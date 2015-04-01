library verilog;
use verilog.vl_types.all;
entity lab5dram is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        ADDR            : in     vl_logic_vector(7 downto 0);
        DATA            : in     vl_logic_vector(7 downto 0);
        MW              : in     vl_logic;
        Q               : out    vl_logic_vector(7 downto 0);
        IOA             : in     vl_logic_vector(7 downto 0);
        IOB             : in     vl_logic_vector(7 downto 0);
        IOC             : out    vl_logic_vector(7 downto 0);
        IOD             : out    vl_logic_vector(7 downto 0);
        IOE             : out    vl_logic_vector(7 downto 0);
        IOF             : out    vl_logic_vector(7 downto 0);
        IOG             : out    vl_logic_vector(7 downto 0);
        IOH             : out    vl_logic_vector(7 downto 0)
    );
end lab5dram;
