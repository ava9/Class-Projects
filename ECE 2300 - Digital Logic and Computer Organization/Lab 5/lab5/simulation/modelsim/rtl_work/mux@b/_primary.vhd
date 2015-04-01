library verilog;
use verilog.vl_types.all;
entity muxB is
    port(
        BSEL            : in     vl_logic;
        Bout            : out    vl_logic_vector(7 downto 0);
        BInput          : in     vl_logic_vector(7 downto 0)
    );
end muxB;
