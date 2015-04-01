library verilog;
use verilog.vl_types.all;
entity lab5 is
    port(
        CLK50           : in     vl_logic;
        RESET           : in     vl_logic;
        CLK_SEL         : in     vl_logic;
        IOA             : in     vl_logic_vector(7 downto 0);
        IOB             : in     vl_logic_vector(7 downto 0);
        EN_L            : in     vl_logic;
        CLK             : out    vl_logic;
        PC              : out    vl_logic_vector(7 downto 0);
        NextPC          : out    vl_logic_vector(7 downto 0);
        Iin             : out    vl_logic_vector(15 downto 0);
        DataA           : out    vl_logic_vector(7 downto 0);
        DataB           : out    vl_logic_vector(7 downto 0);
        DataC           : out    vl_logic_vector(7 downto 0);
        DataD           : out    vl_logic_vector(7 downto 0);
        Din             : out    vl_logic_vector(7 downto 0);
        MW              : out    vl_logic;
        IOC             : out    vl_logic_vector(7 downto 0);
        IOD             : out    vl_logic_vector(7 downto 0);
        IOE             : out    vl_logic_vector(7 downto 0);
        IOF             : out    vl_logic_vector(7 downto 0);
        IOG             : out    vl_logic_vector(7 downto 0);
        IOH             : out    vl_logic_vector(7 downto 0);
        LEDARRAYRED     : out    vl_logic_vector(17 downto 0);
        LEDARRAYGREEN   : out    vl_logic_vector(8 downto 0);
        HEX7            : out    vl_logic_vector(6 downto 0);
        HEX6            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0)
    );
end lab5;
