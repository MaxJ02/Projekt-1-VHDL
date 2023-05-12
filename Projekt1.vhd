--------------------------------------------------------------------------------
-- Projekt1.vhd:       Implementation of a logic net consisting of four inputs
--                     and three outputs. 
--
--                     Inputs:
--                         - a, b, c, d: One bit inputs.
--                     Outputs:
--                         - x, y, z   : One bit outputs.
--                     
--                     The design is implemented as follows:
--                                  x = a ^ b
--                                  y = cd + bc + b'c'd'
--                                  z = cd + cb' + bc'd'
--                      
--                     Hardware implemented for FPGA card Terasic DE0.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Projekt1 is
   port(a, b, c, d: in std_logic;
        x, y, z:    out std_logic);
end entity;

architecture behaviour of Projekt1 is
signal a_n, b_n, c_n, d_n: std_logic;
begin

    a_n <= not a;
    b_n <= not b;
    c_n <= not c;
    d_n <= not d;

    x <= a xor b;
    y <= (c and d) or (b and c) or (b_n and c_n and d_n);
    z <= (c and d) or (c and b_n) or (b and c_n and d_n);
	 
end architecture;      
