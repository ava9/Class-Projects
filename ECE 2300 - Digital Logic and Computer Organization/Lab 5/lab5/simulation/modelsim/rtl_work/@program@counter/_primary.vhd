library verilog;
use verilog.vl_types.all;
entity ProgramCounter is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        H               : in     vl_logic;
        PC              : out    vl_logic_vector(7 downto 0);
        PC_NEXT         : out    vl_logic_vector(7 downto 0);
        BS              : in     vl_logic_vector(2 downto 0);
        N               : in     vl_logic;
        Z               : in     vl_logic;
        OFF             : in     vl_logic_vector(5 downto 0)
    );
end ProgramCounter;
