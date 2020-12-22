library verilog;
use verilog.vl_types.all;
entity Forwarding_unit is
    port(
        Forward_MUX1    : out    vl_logic_vector(1 downto 0);
        Forward_MUX2    : out    vl_logic_vector(1 downto 0);
        RegWr_MEM       : in     vl_logic_vector(4 downto 0);
        RegWr_WB        : in     vl_logic_vector(4 downto 0);
        Rt_EXE          : in     vl_logic_vector(4 downto 0);
        Rs_EXE          : in     vl_logic_vector(4 downto 0);
        RegWrite_EXE_MEM: in     vl_logic;
        RegWrite_MEM_WB : in     vl_logic
    );
end Forwarding_unit;
