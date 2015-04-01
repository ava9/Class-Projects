library verilog;
use verilog.vl_types.all;
entity cpu is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        EN_L            : in     vl_logic;
        Iin             : in     vl_logic_vector(15 downto 0);
        Din             : in     vl_logic_vector(7 downto 0);
        PC              : out    vl_logic_vector(7 downto 0);
        NextPC          : out    vl_logic_vector(7 downto 0);
        DataA           : out    vl_logic_vector(7 downto 0);
        DataB           : out    vl_logic_vector(7 downto 0);
        DataC           : out    vl_logic_vector(7 downto 0);
        DataD           : out    vl_logic_vector(7 downto 0);
        MW              : out    vl_logic
    );
end cpu;
