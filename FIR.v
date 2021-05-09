module FIR(
	 input   	  		  sys_clk,//250k,即采样频率
    input   	  		  rst_n,
	 output wire [11:0] data//12位有符号数据
);
wire [10:0]  data1;
wire [10:0]  data2;

sin_str sin_1k(
    .sys_clk(sys_clk),
    .rst_n(rst_n),
    .sw1(1),
    .sw2(1),
    .sw3(1),
    .sw4(0),
    .data( data1)//rom出来的数据
    );

sin_str sin_100k(
    .sys_clk(sys_clk),
    .rst_n(rst_n),
    .sw1(1),
    .sw2(1),
    .sw3(0),
    .sw4(1),
    .data( data2)//rom出来的数据
    );
	 
assign data=data1+data2-12'd2048;  //拼接数据
endmodule
