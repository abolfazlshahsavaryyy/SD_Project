library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_rotate_register is
end tb_rotate_register;

architecture behavior of tb_rotate_register is
    component rotate_register
        Port (
            clk   : in  STD_LOGIC;
            rst   : in  STD_LOGIC;
            dir   : in  STD_LOGIC;
            data_out : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal clk   : STD_LOGIC := '0';
    signal rst   : STD_LOGIC := '1';
    signal dir   : STD_LOGIC := '0';
    signal data_out : STD_LOGIC_VECTOR(7 downto 0);

begin
    UUT: rotate_register port map (clk, rst, dir, data_out);

    clk_process : process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    stim_proc: process
    begin
        wait for 20 ns;
        rst <= '0';
        wait for 40 ns;
        dir <= '0';  -- ???? ?? ??
        wait for 80 ns;
        dir <= '1';  -- ???? ?? ????
        wait;
    end process;
end behavior;
