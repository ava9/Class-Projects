library verilog;
use verilog.vl_types.all;
entity HaltLogic is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        HALT            : in     vl_logic;
        EN_L            : in     vl_logic;
        H               : out    vl_logic
    );
end HaltLogic;
