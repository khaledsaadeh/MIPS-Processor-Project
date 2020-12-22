library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        Clk             : in     vl_logic;
        PC_4            : in     vl_logic_vector(31 downto 0);
        Inst            : in     vl_logic_vector(31 downto 0);
        IF_Flush        : in     vl_logic;
        IF_stall        : in     vl_logic;
        Op_code         : out    vl_logic_vector(5 downto 0);
        Rs_ID           : out    vl_logic_vector(4 downto 0);
        Rt_ID           : out    vl_logic_vector(4 downto 0);
        Rd_ID           : out    vl_logic_vector(4 downto 0);
        Shamt_ID        : out    vl_logic_vector(4 downto 0);
        Funct_ID        : out    vl_logic_vector(5 downto 0);
        Imm16_ID        : out    vl_logic_vector(15 downto 0);
        Jmp_Adrs_ID     : out    vl_logic_vector(25 downto 0);
        Fmt             : out    vl_logic_vector(4 downto 0);
        Fs              : out    vl_logic_vector(4 downto 0);
        Fd              : out    vl_logic_vector(4 downto 0);
        PC_ID           : out    vl_logic_vector(31 downto 0)
    );
end IF_ID;
