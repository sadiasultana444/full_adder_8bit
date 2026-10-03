LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_8_bit_tb IS
END full_adder_8_bit_tb;

ARCHITECTURE behavior OF full_adder_8_bit_tb IS

    COMPONENT full_adder_8_bit
    PORT(
        A    : IN  std_logic_vector(7 downto 0);
        B    : IN  std_logic_vector(7 downto 0);
        CIN  : IN  std_logic;
        SUM  : OUT std_logic_vector(7 downto 0);
        COUT : OUT std_logic
    );
	  END COMPONENT;

    signal A    : std_logic_vector(7 downto 0) := (others => '0');
    signal B    : std_logic_vector(7 downto 0) := (others => '0');
    signal CIN  : std_logic := '0';

    signal SUM  : std_logic_vector(7 downto 0);
    signal COUT : std_logic;

BEGIN
  uut: full_adder_8_bit
    PORT MAP (
        A    => A,
        B    => B,
        CIN  => CIN,
        SUM  => SUM,
        COUT => COUT
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1: 5 + 3 = 8
        A <= "00000101";
        B <= "00000011";
        CIN <= '0';
        wait for 10 ns;
		   -- Test 2: 10 + 20 = 30
        A <= "00001010";
        B <= "00010100";
        CIN <= '0';
        wait for 10 ns;

        -- Test 3: 255 + 1 = 256
        A <= "11111111";
        B <= "00000001";
        CIN <= '0';
        wait for 10 ns;

        -- Test 4: 15 + 10 + 1 = 26
        A <= "00001111";
        B <= "00001010";
        CIN <= '1';
        wait for 10 ns;
-- Test 5: 0 + 0 = 0
        A <= "00000000";
        B <= "00000000";
        CIN <= '0';
        wait for 10 ns;

        wait;

    end process;

END;