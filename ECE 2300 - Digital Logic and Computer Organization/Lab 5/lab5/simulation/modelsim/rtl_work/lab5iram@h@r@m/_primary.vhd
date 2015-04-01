library verilog;
use verilog.vl_types.all;
entity lab5iramHRM is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        ADDR            : in     vl_logic_vector(7 downto 0);
        Q               : out    vl_logic_vector(15 downto 0)
    );
end lab5iramHRM;
