library verilog;
use verilog.vl_types.all;
entity EXE_MEM is
    port(
        Clk             : in     vl_logic;
        OUT_ALU64       : in     vl_logic_vector(63 downto 0);
        OUT_ALU32       : in     vl_logic_vector(31 downto 0);
        Rt_data64_EXE   : in     vl_logic_vector(63 downto 0);
        Rt_data_EXE     : in     vl_logic_vector(31 downto 0);
        RegWr_EXE       : in     vl_logic_vector(4 downto 0);
        Rs_data_EXE     : in     vl_logic_vector(31 downto 0);
        WB_control_EX   : in     vl_logic_vector(9 downto 0);
        MEM_control_EX  : in     vl_logic_vector(2 downto 0);
        OUT_ALU64_MEM   : out    vl_logic_vector(63 downto 0);
        Adrs_MEM        : out    vl_logic_vector(31 downto 0);
        Rt_data_MEM     : out    vl_logic_vector(31 downto 0);
        Rt_data64_MEM   : out    vl_logic_vector(63 downto 0);
        RegWr_MEM       : out    vl_logic_vector(4 downto 0);
        HILO_write_MEM  : out    vl_logic_vector(31 downto 0);
        WB_control_MEM  : out    vl_logic_vector(9 downto 0);
        MemWrite64      : out    vl_logic;
        MemWrite        : out    vl_logic;
        MemRead         : out    vl_logic
    );
end EXE_MEM;
