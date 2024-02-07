library ieee;
  use ieee.std_logic_1164.all;

entity gates is
  port (
    a       : in    std_logic; --! First input
    b       : in    std_logic; --! Second input
    and_out : out   std_logic; --! Logic AND
    or_out  : out   std_logic; --! Logic OR
    xor_out : out   std_logic  --! Logic XOR
  );
end entity gates;

architecture behavioral of gates is

begin

  -- 2-input AND gate
  and_out <= a and b after 8 ns;

  -- 2-input OR gate
  or_out <= a or b after 6 ns;

  -- XOR gate
  xor_out <= a xor b after 11 ns;

end architecture behavioral;
