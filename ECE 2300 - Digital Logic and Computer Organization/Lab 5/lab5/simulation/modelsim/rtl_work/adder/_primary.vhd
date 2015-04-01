library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        CI              : in     vl_logic;
        Y               : out    vl_logic_vector(7 downto 0);
        CO              : out    vl_logic;
        V               : out    vl_logic;
        N               : out    vl_logic;
        Z               : out    vl_logic
    );
end adder;
