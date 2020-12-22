library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        PC_out          : out    vl_logic_vector(31 downto 0);
        PC_IN           : in     vl_logic_vector(31 downto 0);
        control         : in     vl_logic;
        clk             : in     vl_logic
    );
end PC;
