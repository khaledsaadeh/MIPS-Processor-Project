library verilog;
use verilog.vl_types.all;
entity instructionMemory is
    port(
        instruction     : out    vl_logic_vector(31 downto 0);
        PC              : in     vl_logic_vector(31 downto 0)
    );
end instructionMemory;
