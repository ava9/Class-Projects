library verilog;
use verilog.vl_types.all;
entity muxCI is
    port(
        CISEL           : in     vl_logic;
        CIout           : out    vl_logic
    );
end muxCI;
