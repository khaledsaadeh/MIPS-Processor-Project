library verilog;
use verilog.vl_types.all;
entity shift_left_32bits is
    port(
        y               : out    vl_logic_vector(31 downto 0);
        x               : in     vl_logic_vector(31 downto 0)
    );
end shift_left_32bits;
