module control(
	input wire zero,
	input wire [2:0] phase,
	input wire [2:0] opcode,
	output reg sel,
	output reg rd,
	output reg ld_ir,
	output reg helt,
	output reg inc_pc,
	output reg ld_ac,
	output reg wr,
	output reg ld_pc,
	output reg data_c);
        reg H, Z, A, S, J; 
always @* 
 begin
	H = (opcode == 0);
	Z = (opcode == 1 && zero);
	A = (opcode == 2 || opcode == 3 || opcode == 4 || opcode == 5);
	S = (opcode == 6);
	J = (opcode == 7);

	 	case (phase)

	0:begin sel=1; rd=0; lds_ir=0; halt=0; inc_pc=0; ld_ac=0; ld_pc=0; wr=0; data_e=0;end
	1:begin sel=1; rd=1; lds_ir=0; halt=0; inc_pc=0; ld_ac=0; ld_pc=0; wr=0; data_e=0;end
	2:begin sel=1; rd=1; lds_ir=1; halt=0; inc_pc=0; ld_ac=0; ld_pc=0; wr=0; data_e=0;end
	3:begin sel=1; rd=1; lds_ir=1; halt=0; inc_pc=0; ld_ac=0; ld_pc=0; wr=0; data_e=0;end
	4:begin sel=0; rd=0; lds_ir=0; halt=H; inc_pc=1; ld_ac=0; ld_pc=0; wr=0; data_e=0;end
	5:begin sel=0; rd=A; lds_ir=0; halt=0; inc_pc=0; ld_ac=0; ld_pc=0; wr=0; data_e=0;end
	6:begin sel=0; rd=A; lds_ir=0; halt=0; inc_pc=Z; ld_ac=0; ld_pc=J; wr=0; data_e=S;end
	7:begin sel=0; rd=A; lds_ir=0; halt=0; inc_pc=0; ld_ac=A; ld_pc=J; wr=S; data_e=S;end
		endcase
 end
endmodule
