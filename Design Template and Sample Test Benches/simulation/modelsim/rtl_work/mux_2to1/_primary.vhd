library verilog;
use verilog.vl_types.all;
entity mux_2to1 is
    port(
        c               : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic
    );
end mux_2to1;
