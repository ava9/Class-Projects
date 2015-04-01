library verilog;
use verilog.vl_types.all;
entity control is
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
        OP              : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        BSEL            : out    vl_logic;
        CISEL           : out    vl_logic;
        OSEL            : out    vl_logic_vector(1 downto 0);
        SHIFT_LA        : out    vl_logic;
        SHIFT_LR        : out    vl_logic;
        LOGICAL_OP      : out    vl_logic
    );
end control;
