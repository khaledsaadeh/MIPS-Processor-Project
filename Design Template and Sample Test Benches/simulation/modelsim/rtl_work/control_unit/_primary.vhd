library verilog;
use verilog.vl_types.all;
entity control_unit is
    port(
        Store_FP        : out    vl_logic;
        ID_Flush        : out    vl_logic;
        IF_Flush        : out    vl_logic;
        Store_Byte_control: out    vl_logic;
        float_control_read: out    vl_logic;
        HILO_read_control: out    vl_logic_vector(1 downto 0);
        control_signal  : out    vl_logic_vector(35 downto 0);
        Op_code         : in     vl_logic_vector(5 downto 0);
        Funct_ID        : in     vl_logic_vector(5 downto 0);
        Fmt             : in     vl_logic_vector(4 downto 0);
        Ft              : in     vl_logic_vector(4 downto 0)
    );
end control_unit;
