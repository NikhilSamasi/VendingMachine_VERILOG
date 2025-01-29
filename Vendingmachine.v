module vending_machine(
  input clk,
  input rst,
  input [1:0]in,
  output reg out,
  output reg[1:0]change
  );
  parameter s0=2'b00;
  parameter s1=2'b01;
  parameter s2=2'b10;
   reg[1:0] c_st,n_st;
   always@(posedge clk)
     begin
       if(rst)
       begin
        c_st=0;
        n_st=0;
        change=2'b00;
       end
       else
       c_st=n_st;
      
      case(c_st)
      s0:  
        if(in==0)
        begin 
         n_st=s0;
         out=0;
         change=2'b00;
        end
        else if(in==2'b01)
        begin
          n_st=s1;
          out=0;
          change=2'b00;
        end
        else if(in==2'b10)
        begin
           n_st=s2;
           out=0;
           change=2'b00;
        end
      s1:
        if(in==0)
        begin
           n_st=s0;
           out=0;
           change=2'b01;
        end
        else if(in==2'b01)
        begin
           n_st=s2;
           out=0;
           change=2'b00;
        end
        else if(in==2'b10)
        begin
           n_st=s0;
           out=1;
           change=2'b00;
        end
      s2:
        if(in==0)
        begin
           n_st=s0;
           out=0;
           change=2'b00;
        end
        else if(in==2'b01)
        begin  
           n_st=s0;
           out=1;
           change=0;
        end
        else if(in==2'b10)
        begin
           n_st=s0;
           out=1;
           change=2'b01;
        end
      endcase
     end
endmodule
