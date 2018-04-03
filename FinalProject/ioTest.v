`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:57 03/14/2017 
// Design Name: 
// Module Name:    DIgitalClock 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FinalProject(input  M_CLOCK,	  			// FPGA clock
					  input Row1,Row2,Row3,Row4,
					  output reg Column1,Column2,Column3,Column4,
					  input [3:0] IO_PB,
					  output [3:0] F_LED,	  		// FPGA LEDs
					  output [7:0] IO_LED,			// IO Board LEDs
					  output reg [3:0] IO_SSEGD, 		// IO Board Seven Segment Digits			
					  output reg [7:0] IO_SSEG,  		// 7=dp, 6=g, 5=f,4=e, 3=d,2=c,1=b, 0=a
					  output IO_SSEG_COL,
					  output DEC_POINT);	  		
	
	
	
	assign IO_SSEG_COL = 1;				// deactivate the colon displays
	assign F_LED = ~IO_PB;
	assign DEC_POINT = 1'b1;
	assign IO_LED = 8'b00000000;
	
	wire FlagCheck = 1'b0;
	reg [7:0] AllPins;
	reg [31:0] ColumnCounter = 0;
	reg [31:0] DisplayCounter = 0;
	reg [1:0] ColumnState = 0;
	reg Columns = 0;
	reg DisplayResults = 0;
	reg FLAGG = 1'b0;
	reg checkflag = 1'b0;
	reg [7:0] SEG1;
	
	
	//**************CLOCK RATE***************************//
	always @(posedge M_CLOCK) begin
			ColumnCounter <= ColumnCounter + 1;
			DisplayCounter <= DisplayCounter + 1;
			if (ColumnCounter == 1850000) begin //22000 208000
				Columns <= ~Columns;
				ColumnCounter <= 0;
			end
			if (DisplayCounter == 125000) begin //34500000 
				DisplayResults <= ~DisplayResults;
				DisplayCounter <= 0;
			end
	end
	//***************************************************//
	//***************Going Through Columns**************//
	always @(posedge Columns) begin // THE SEGMENTS
		case(ColumnState)
			0: begin
				{Column1,Column2,Column3,Column4} <= 4'b1000;				
				case ({Row1,Row2,Row3,Row4})
					4'b1000: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0100: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0010: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0001: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					default: begin
						FLAGG <= 1'b0;
						ColumnState <= 1;
					end
				endcase
			end
			1: begin
				{Column1,Column2,Column3,Column4} <= 4'b0100;
				case ({Row1,Row2,Row3,Row4})
					4'b1000: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0100: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0010: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0001: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					default: begin
						FLAGG <= 1'b0;
						ColumnState <= 2;
					end
				endcase
			end
			2: begin
				{Column1,Column2,Column3,Column4} <= 4'b0010;
				case ({Row1,Row2,Row3,Row4})
					4'b1000: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0100: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0010: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0001: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					default: begin
						FLAGG <= 1'b0;
						ColumnState <= 3;
					end
				endcase
			end
			3: begin
				{Column1,Column2,Column3,Column4} <= 4'b0001;
				case ({Row1,Row2,Row3,Row4})
					4'b1000: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0100: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0010: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					4'b0001: begin
						AllPins <= ({Row1,Row2,Row3,Row4,Column1,Column2,Column3,Column4});
						FLAGG <= 1'b1;
						checkflag = 1'b1;
					end
					default: begin
						FLAGG <= 1'b0;
						ColumnState <= 0;
					end
				endcase
			end
			default: begin
				ColumnState <= 0;
			end
		endcase
	end
	//***************************************************//
	//******************Getting the Value Number********//
	//***************************************************//
	always @(FLAGG) begin
		case (AllPins)
			8'b10001000: begin // Row1 Column1
				SEG1 <= {DEC_POINT, 7'b1111001}; //1
			end
			8'b10000100: begin //Row1 Column2
				SEG1 <= {DEC_POINT, 7'b0100100}; //2
			end
			8'b10000010: begin //Row1 Column3
				SEG1 <= {DEC_POINT, 7'b0110000}; //3
			end
			8'b10000001: begin //Row1 Column4
				SEG1 <= {DEC_POINT, 7'b0001000}; //A
			end
			///
			8'b01001000: begin // Row2 Column1
				SEG1 <= {DEC_POINT, 7'b0011001}; //4
			end
			8'b01000100: begin //Row2 Column2
				SEG1 <= {DEC_POINT, 7'b0010010}; //5
			end
			8'b01000010: begin //Row2 Column3
				SEG1 <= {DEC_POINT, 7'b0000010}; //6
			end
			8'b01000001: begin //Row2 Column4
				SEG1 <= {DEC_POINT, 7'b0000011}; //b
			end
			///
			8'b00101000: begin // Row3 Column1
				SEG1 <= {DEC_POINT, 7'b1111000}; //7
			end
			8'b00100100: begin //Row3 Column2
				SEG1 <= {DEC_POINT, 7'b0000000}; //8
			end
			8'b00100010: begin //Row3 Column3
				SEG1 <= {DEC_POINT, 7'b0011000}; //9
			end
			8'b00100001: begin //Row3 Column4
				SEG1 <= {DEC_POINT, 7'b1000110}; //C
			end
			///
			8'b00011000: begin // Row4 Column1
				SEG1 <= {DEC_POINT, 7'b1000000}; //* = 0
			end
			8'b00010100: begin //Row4 Column2
				SEG1 <= {DEC_POINT, 7'b1000000}; // 0
			end
			8'b00010010: begin //Row4 Column3
				SEG1 <= {DEC_POINT, 7'b1000000}; //# = 0
			end
			8'b00010001: begin //Row4 Column4
				SEG1 <= {DEC_POINT, 7'b0100001}; // d
			end
			default: begin
				if (checkflag == 0)
					SEG1 <= {DEC_POINT, 7'b00000000};
				else
					SEG1 <= SEG1;
			end
		endcase
	end
	always @(posedge DisplayResults) begin // THE SEGMENTS
		IO_SSEGD <= 4'b0111;
		IO_SSEG <= SEG1;
	end
	
endmodule
		
