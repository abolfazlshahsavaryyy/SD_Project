library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rotate_register is
    Port (
        clk   : in  STD_LOGIC;
        rst   : in  STD_LOGIC;
        dir   : in  STD_LOGIC;          -- 0: left, 1: right
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end rotate_register;

architecture Behavioral of rotate_register is
    signal reg : STD_LOGIC_VECTOR(7 downto 0) := "10000001"; -- „ﬁœ«— «Ê·ÌÂ
begin
    process(clk, rst)
    begin
        if rst = '1' then
            reg <= "10000001";
        elsif rising_edge(clk) then
            if dir = '0' then
                reg <= reg(6 downto 0) & reg(7); -- Rotate Left
            else
                reg <= reg(0) & reg(7 downto 1); -- Rotate Right
            end if;
        end if;
    end process;

    data_out <= reg;

end Behavioral;
