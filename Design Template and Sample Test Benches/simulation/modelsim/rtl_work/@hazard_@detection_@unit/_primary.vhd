library verilog;
use verilog.vl_types.all;
entity Hazard_Detection_Unit is
    port(
        IF_stall        : out    vl_logic;
        PC_stall        : out    vl_logic;
        ID_stall_hazard : out    vl_logic;
        Rt_ID           : in     vl_logic_vector(31 downto 0);
        Rs_ID           : in     vl_logic_vector(31 downto 0);
        Rd_EXE          : in     vl_logic_vector(31 downto 0);
        load_control    : in     vl_logic
    );
end Hazard_Detection_Unit;
