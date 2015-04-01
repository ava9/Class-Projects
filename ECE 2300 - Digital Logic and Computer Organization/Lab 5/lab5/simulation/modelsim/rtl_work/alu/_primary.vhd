library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        ADD             : integer := 0;
        SUB             : integer := 1;
        \SRA\           : integer := 2;
        \SRL\           : integer := 3;
        \SLL\           : integer := 4;
        \AND\           : integer := 5;
        \OR\            : integer := 6
    );
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        OP              : in     vl_logic_vector(2 downto 0);
        Y               : out    vl_logic_vector(7 downto 0);
        C               : out    vl_logic;
        V               : out    vl_logic;
        N               : out    vl_logic;
        Z               : out    vl_logic;
        HEX7            : out    vl_logic_vector(6 downto 0);
        HEX6            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0)
    );
end alu;
