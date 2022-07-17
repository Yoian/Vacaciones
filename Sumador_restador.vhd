library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sumador_restador is
	port(
		clk: in STD_LOGIC;
--		UD: in STD_LOGIC_VECTOR(1 downto 0);
		UP: in STD_LOGIC;
		DOWN: in STD_LOGIC;
--		SAL1: out STD_LOGIC;
--		SAL2: out STD_LOGIC;
		Salida: out STD_LOGIC_VECTOR(7 downto 0):="00000000"
	);
end Sumador_restador;

architecture Behavioral of Sumador_restador is
	signal Total: STD_LOGIC_VECTOR(7 downto 0):="00000000";
	signal clkdiv: STD_LOGIC_VECTOR(15 downto 0);
	signal UD: STD_LOGIC_VECTOR(1 downto 0);
begin
	UD<=UP&DOWN;
--	SAL1<=UP;
--	SAL2<=DOWN;
	divisor : process(clk)
	begin
		if rising_edge(clk) then
			clkdiv<=clkdiv+1;
		end if;
	end process divisor;
	
	Operacion: process(clkdiv(15),UD,Total)
	begin
		if rising_edge(clkdiv(15)) then
			if rising_edge(UD(1)) and Total<"11111111" then
				Total<=Total+'1';			
			elsif rising_edge(UD(0)) and Total>"00000000" then
				Total<=Total-'1';
			else
				Total<=Total;	
			end if;
		end if;
		Salida<=Total;
	end process Operacion;

--	Salida<=Total;
	
end Behavioral;

