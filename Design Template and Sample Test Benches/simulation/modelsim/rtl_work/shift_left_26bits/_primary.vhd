library verilog;
use verilog.vl_types.all;
entity shift_left_26bits is
    port(
        y               : out    vl_logic_vector(27 downto 0);
        x               : in     vl_logic_vector(25 downto 0)
    );
end shift_left_26bits;
