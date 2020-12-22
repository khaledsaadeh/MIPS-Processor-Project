library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        OUT_ALU32       : out    vl_logic_vector(31 downto 0);
        OUT_ALU64       : out    vl_logic_vector(63 downto 0);
        ZF_ALU          : out    vl_logic;
        IN_ALU_MSG1     : in     vl_logic_vector(31 downto 0);
        IN_ALU_1        : in     vl_logic_vector(31 downto 0);
        IN_ALU_2        : in     vl_logic_vector(31 downto 0);
        IN_ALU_MSG2     : in     vl_logic_vector(31 downto 0);
        ALU_control     : in     vl_logic_vector(11 downto 0)
    );
end ALU;
