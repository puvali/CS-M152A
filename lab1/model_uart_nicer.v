`timescale 1ns / 1ps

module model_uart(/*AUTOARG*/
   // Outputs
   TX,
   // Inputs
   RX
   );

   output TX;
   input  RX;

   parameter baud    = 115200;
   parameter bittime = 1000000000/baud;
   parameter name    = "UART0";
   
   reg [7:0] rxData;
   reg [31:0] rxDataLine;
   reg [31:0] forDisplay;
   event     evBit;
   event     evByte;
   event     evTxBit;
   event     evTxByte;
   reg       TX;

   initial
     begin
        TX = 1'b1;
     end
   
   always @ (negedge RX)
     begin
        rxData[7:0] = 8'h0;
        #(0.5*bittime);
        repeat (8)
          begin
             #bittime ->evBit;
             //rxData[7:0] = {rxData[6:0],RX};
             rxData[7:0] = {RX,rxData[7:1]};
          end
		  //10 is ascii for \n
		  if (rxData == 10) begin
			$display("%d %s Received byte %02x (%s)", $stime, name, rxDataLine, rxDataLine);
			end
			else
				//13 is ascii for carriage return \cr
				//if there's no new line or carriage return concatenate rxDataLine and rxData
				if (rxData != 13)
					rxDataLine[31:0] = {rxDataLine, rxData};
		
        ->evByte;
        //$display ("%d %s Received byte %02x (%s)", $stime, name, rxData, rxData);
     end
     
   always @(evByte)
    begin
        if (rxData == 8'h0A)
            forDisplay = forDisplay;
        else if (rxData == 8'h0D)
            $display ("%d %s Received bytes %02x (%s)", $stime, name, forDisplay, forDisplay);
        else
            forDisplay = {forDisplay[23:0],rxData[7:0]};
    end 
    
   task tskRxData;
      output [7:0] data;
      begin
         @(evByte);
         data = rxData;
      end
   endtask // for
      
   task tskTxData;
      input [7:0] data;
      reg [9:0]   tmp;
      integer     i;
      begin
         tmp = {1'b1, data[7:0], 1'b0};
         for (i=0;i<10;i=i+1)
           begin
              TX = tmp[i];
              #bittime;
              ->evTxBit;
           end
         ->evTxByte;
      end
   endtask // tskTxData
   
endmodule // model_uart
