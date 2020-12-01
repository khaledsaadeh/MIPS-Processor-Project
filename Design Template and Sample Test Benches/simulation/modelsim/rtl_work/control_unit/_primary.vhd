library verilog;
use verilog.vl_types.all;
entity control_unit is
    port(
        Jal_control     : out    vl_logic;
        ID_Flush        : out    vl_logic;
        IF_Flush        : out    vl_logic;
        Store_Byte_control: out    vl_logic;
        Load_Byte_control: out    vl_logic;
        control_signal  : out    vl_logic_vector(23 downto 0);
        Op_code         : in     vl_logic_vector(5 downto 0);
        Funct_ID        : in     vl_logic_vector(5 downto 0)
    );
end control_unit;
