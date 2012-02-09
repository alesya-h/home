library ieee;
use ieee.std_logic_1164.all;

entity jk_trigger is

  port (
    Clk, Clr, Set, J, K : in  std_logic;
    Q,notQ              : out std_logic);

end jk_trigger;

architecture behaviour of jk_trigger is
  signal Qtmp : std_logic := '0';
  signal notQtmp : std_logic := '1';
begin  -- behaviour

  Q <= Qtmp;
  notQ <= notQtmp;

  process (Clk, Clr, Set)
  begin
    if Clr = '1' then
      Qtmp <= '0';
      notQtmp <= '1';
    elsif Set = '1' then
      Qtmp <= '1';
      notQtmp <= '0';
    elsif Clk'event and Clk = '1' then  -- rising clock edge
      if (J = '1') and (K = '0') then
        Qtmp <= '1';
        notQtmp <= '0';
      elsif (J = '0') and (K = '1') then
        Qtmp <= '0';
        notQtmp <= '1';
      elsif (J = '1') and (K = '1') then
        Qtmp <= not Qtmp;
        notQtmp <= not notQtmp;
      end if;
    end if;
  end process;

end behaviour;

library ieee;
use ieee.std_logic_1164.all;

entity jk_tb is
end jk_tb;

architecture behaviour of jk_tb is
  subtype template_type is std_logic_vector (0 to 6);
  type templates_type is array (natural range <>) of template_type;
  constant test_cases : templates_type := ("0000001","1000010");
  signal Clr,Clk,Set,J,K : std_logic;

begin  -- behaviour
  trigger : entity work.jk_trigger(behaviour) port map (
    Clk => Clk ,
    Clr => Clr,
    Set => Set,
    J   => J,
    K   => K);
  worker: process (Clk, Clr)
  begin

  end process worker;

end behaviour;
