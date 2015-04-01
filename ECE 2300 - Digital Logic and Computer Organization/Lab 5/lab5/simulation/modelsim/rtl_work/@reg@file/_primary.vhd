library verilog;
use verilog.vl_types.all;
entity RegFile is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        SA              : in     vl_logic_vector(2 downto 0);
        SB              : in     vl_logic_vector(2 downto 0);
        LD              : in     vl_logic;
        DR              : in     vl_logic_vector(2 downto 0);
        D_in            : in     vl_logic_vector(7 downto 0);
        DataA           : out    vl_logic_vector(7 downto 0);
        DataB           : out    vl_logic_vector(7 downto 0)
    );
end RegFile;
