library verilog;
use verilog.vl_types.all;
entity Top is
    port(
        PC_VALUE        : in     vl_logic_vector(31 downto 0)
    );
end Top;
