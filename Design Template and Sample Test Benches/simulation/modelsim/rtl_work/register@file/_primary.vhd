library verilog;
use verilog.vl_types.all;
entity registerFile is
    port(
        Rs_data_ID      : out    vl_logic_vector(31 downto 0);
        Rt_data_ID      : out    vl_logic_vector(31 downto 0);
        Clk             : in     vl_logic;
        Rs_ID           : in     vl_logic_vector(4 downto 0);
        Rt_ID           : in     vl_logic_vector(4 downto 0);
        RegWr_ID        : in     vl_logic_vector(4 downto 0);
        Write_data      : in     vl_logic_vector(31 downto 0);
        Load_Byte_control: in     vl_logic;
        Store_Byte_control: in     vl_logic;
        RegWrite        : in     vl_logic
    );
end registerFile;
