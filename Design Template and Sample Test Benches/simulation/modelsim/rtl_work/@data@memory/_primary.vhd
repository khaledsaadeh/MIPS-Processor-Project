library verilog;
use verilog.vl_types.all;
entity DataMemory is
    port(
        OUT_data_MEM    : out    vl_logic_vector(31 downto 0);
        OUT_nextdata_MEM: out    vl_logic_vector(31 downto 0);
        Adrs_MEM        : in     vl_logic_vector(31 downto 0);
        Rt_data_MEM     : in     vl_logic_vector(31 downto 0);
        Rt_data64_MEM   : in     vl_logic_vector(63 downto 0);
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemWrite64      : in     vl_logic;
        Clk             : in     vl_logic
    );
end DataMemory;
