library verilog;
use verilog.vl_types.all;
entity MEM_WB is
    port(
        Clk             : in     vl_logic;
        OUT_ALU64_MEM   : in     vl_logic_vector(63 downto 0);
        OUT_data64_MEM  : in     vl_logic_vector(63 downto 0);
        OUT_data_MEM    : in     vl_logic_vector(31 downto 0);
        Adrs_MEM        : in     vl_logic_vector(31 downto 0);
        RegWr_MEM       : in     vl_logic_vector(4 downto 0);
        HILO_write_MEM  : in     vl_logic_vector(31 downto 0);
        WB_control_MEM  : in     vl_logic_vector(9 downto 0);
        OUT_ALU64_WB    : out    vl_logic_vector(63 downto 0);
        OUT_data64_WB   : out    vl_logic_vector(63 downto 0);
        Memory_WB       : out    vl_logic_vector(31 downto 0);
        ALU_WB          : out    vl_logic_vector(31 downto 0);
        RegWr_WB        : out    vl_logic_vector(4 downto 0);
        HILO_write_WB   : out    vl_logic_vector(31 downto 0);
        RegWrite        : out    vl_logic;
        MemToReg        : out    vl_logic;
        MemToReg64      : out    vl_logic;
        MulDiv_control  : out    vl_logic;
        HILO_write_control: out    vl_logic;
        Jal_control     : out    vl_logic;
        FPwrite_control : out    vl_logic;
        Load_Byte_control: out    vl_logic;
        float_control_write: out    vl_logic;
        Write32_64      : out    vl_logic
    );
end MEM_WB;
