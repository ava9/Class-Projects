library verilog;
use verilog.vl_types.all;
entity muxO is
    port(
        OSEL            : in     vl_logic_vector(1 downto 0);
        Oout            : out    vl_logic_vector(7 downto 0);
        shifterResult   : in     vl_logic_vector(7 downto 0);
        logicalResult   : in     vl_logic_vector(7 downto 0);
        adderResult     : in     vl_logic_vector(7 downto 0)
    );
end muxO;
