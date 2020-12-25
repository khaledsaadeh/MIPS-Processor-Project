library verilog;
use verilog.vl_types.all;
entity registerFile is
    port(
        Rs_data_ID      : out    vl_logic_vector(31 downto 0);
        Rs_MSG          : out    vl_logic_vector(31 downto 0);
        Rt_data_ID      : out    vl_logic_vector(31 downto 0);
        Rt_MSG          : out    vl_logic_vector(31 downto 0);
        Rd_data_ID      : out    vl_logic_vector(31 downto 0);
        HI              : out    vl_logic_vector(31 downto 0);
        LO              : out    vl_logic_vector(31 downto 0);
        FP              : out    vl_logic;
        Clk             : in     vl_logic;
        Rs_ID           : in     vl_logic_vector(4 downto 0);
        Rt_ID           : in     vl_logic_vector(4 downto 0);
        Rd_ID           : in     vl_logic_vector(4 downto 0);
        RegWr_ID        : in     vl_logic_vector(4 downto 0);
        Write_data      : in     vl_logic_vector(31 downto 0);
        Write_data64    : in     vl_logic_vector(63 downto 0);
        Load_Byte_control: in     vl_logic;
        Store_Byte_control: in     vl_logic;
        RegWrite        : in     vl_logic;
        float_control_read: in     vl_logic;
        float_control_write: in     vl_logic;
        FPwrite_control : in     vl_logic;
        MulDiv_control  : in     vl_logic;
        Write32_64      : in     vl_logic;
        Jal_control     : in     vl_logic;
        Store_FP        : in     vl_logic
    );
end registerFile;
