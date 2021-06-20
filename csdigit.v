`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:14:53 06/14/2021 
// Design Name: 
// Module Name:    csdigit 
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
module csdigit(
    input signed[14+2:0]a,
    output reg signed [14+1:0]c
    );

integer i;
reg carry=0;
//assign a[15] = a[14];
//assign a[16] = 0;

always @(a or i or carry)
begin

for(i=0;i<16;i=i+1)
begin
//if statement carry =0
if(carry == 0)
begin

if({a[i+1],a[i]}==2'b00 ||{a[i+1],a[i]}==2'b10)
begin 
c[i] = 1'b0;
carry = 0;
end 
else if({a[i+1],a[i]}==2'b01)
begin
c[i] = 1'b1;
carry = 0;
end
else if({a[i+1],a[i]}==2'b11)
begin
c[i] = -1'b1;
carry = 1;
end
else
begin
c = a;
carry = 0;
end
end//if end
///////else statement carry =1
else
begin
if({a[i+1],a[i]}==2'b01 ||{a[i+1],a[i]}==2'b11)
begin 
c[i] = 1'b0;
carry = 1;
end 
else if({a[i+1],a[i]}==2'b00)
begin
c[i] = 1'b1;
carry = 0;
end
else if({a[i+1],a[i]}==2'b10)
begin
c[i] = -1'b1;
carry = 1;
end
else
begin
c = a;
carry = 0;
end
end//else end

end// for end

end//always end

endmodule
