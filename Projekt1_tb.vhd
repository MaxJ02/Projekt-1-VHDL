--------------------------------------------------------------------------------
-- Projekt1_tb.vhd: Testbench for module Projekt1.
--
--                     Signals:
--                         - a, b, c, d: One bit inputs.
--                         - x, y, z     : One bit outputs.
--                     
--                     All 16 combinations 0000 - 1111 of inputs abcd are
--                     tested for 10 ns each, therefore the total simulation
--                     time is 160 ns. Simulation is performed in ModelSim.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Projekt1_tb is
end entity;

architecture behaviour of Projekt1_tb is
signal a, b, c, d, x, y, z: std_logic := '0';
begin

    --------------------------------------------------------------------------------
    -- sim_instance: Connects the ports of module Projekt1 with signals of
    --               of the same name to simulate the design. 
    --------------------------------------------------------------------------------
    sim_instance: entity work.Projekt1
    port map(a, b, c, d, x, y, z);
    
    
     
    --------------------------------------------------------------------------------
    -- SIM_PROCESS: Tests all combinations 0000 - 1111 of inputs ABCD via a for
    --              loop. The value 0 - 15 of integer i is converted to bits and
    --              assigned to variable input. Each combination is tested during
    --              10 ns. The process is halted once all combinations have been
    --              tested.
    --------------------------------------------------------------------------------
     SIM_PROCESS: process is
     begin
         for i in 0 to 15 loop
             (a, b, c, d) <= std_logic_vector(to_unsigned(i, 4));
             wait for 10 ns;
         end loop;
         wait;
     end process;
end architecture;   
