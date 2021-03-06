library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        LA              : in     vl_logic;
        LR              : in     vl_logic;
        Y               : out    vl_logic_vector(7 downto 0);
        C               : out    vl_logic;
        V               : out    vl_logic;
        N               : out    vl_logic;
        Z               : out    vl_logic
    );
end shifter;
