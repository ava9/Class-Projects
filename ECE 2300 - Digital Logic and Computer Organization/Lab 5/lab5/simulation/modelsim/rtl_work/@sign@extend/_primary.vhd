library verilog;
use verilog.vl_types.all;
entity SignExtend is
    port(
        IMM             : in     vl_logic_vector(5 downto 0);
        OUTPUT          : out    vl_logic_vector(7 downto 0)
    );
end SignExtend;
