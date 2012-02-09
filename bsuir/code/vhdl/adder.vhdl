library ieee;
use ieee.std_logic_1164.all;

entity adder is

  port (
    i0     : in  std_logic;
    i1     : in  std_logic;
    ci     : in  std_logic;
    s      : out std_logic;
    co     : out std_logic);

end adder;

architecture rtl of adder is
begin  -- rtl

  s <= i0 xor i1 xor ci;
  co <= (i0 and i1) or (i0 and ci) or (i1 and ci);

end rtl;

library ieee;
use ieee.std_logic_1164.all;

entity adder_tb is
end adder_tb;

architecture arc1 of adder_tb is
  component adder
    port (
      i0     : in  std_logic;
      i1     : in  std_logic;
      ci     : in  std_logic;
      s      : out std_logic;
      co     : out std_logic);
  end component;
  for adder_0 : adder
    use entity work.adder(rtl);
  signal i0,i1,ci,s,co : std_logic;
begin  -- arc1

  adder_0 : adder port map (
    i0 => i0,
    i1 => i1,
    ci => ci,
    s  => s,
    co => co);

  process
    subtype pattern_type is std_logic_vector(0 to 4);
    type test_cases_type is array (8 downto 1) of pattern_type;
    constant test_cases : test_cases_type := ("00000","00110","01010","10010","01101","10101","11001","11111");
  begin  -- process
    for i in test_cases'range loop
      i0 <= test_cases(i)(0);
      i1 <= test_cases(i)(1);
      ci <= test_cases(i)(2);
      wait for 1 ns;
      assert s=test_cases(i)(3) report "wrong sum" severity error;
      assert co=test_cases(i)(4) report "wrong co" severity error;
    end loop;  -- test_case
    assert false report "test done" severity note;
    wait;
  end process;

end arc1;
