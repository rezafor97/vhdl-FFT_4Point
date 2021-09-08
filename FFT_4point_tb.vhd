

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity FFT_4point_tb is
--  Port ( );
end FFT_4point_tb;

architecture projection of FFT_4point_tb is

component FFT_4point is
 Port (  	Clock				  :  in		std_logic;
             x0_real                 : in signed (15 downto 0);
              x0_imag              : in signed (15 downto 0);
              x1_real                : in signed (15 downto 0);
               x1_imag             : in signed (15 downto 0);
               x2_real               : in signed (15 downto 0);
              x2_imag             : in signed (15 downto 0);
              x3_real               : in signed (15 downto 0);
               x3_imag            : in signed (15 downto 0);
               F0_Real             : out signed (16 downto 0);
                F0_imag          : out signed (16 downto 0);
               F1_Real            : out signed (16 downto 0);
              F1_imag            : out signed (16 downto 0);
              F2_Real             : out signed (16 downto 0);
               F2_imag          : out signed (16 downto 0);
               F3_Real           : out signed (16 downto 0);
                F3_imag         : out signed (16 downto 0));

               
               end component;
    constant Clock_period : time := 20 ns;          
    signal Clock : std_logic := '0';    
 signal  x0_real,x0_imag,x1_real,x1_imag,x2_real,x2_imag,x3_real,x3_imag             :signed (15 downto 0);
 signal F0_Real,F0_imag,F1_Real,F1_imag,F2_Real,F2_imag,F3_Real,F3_imag:signed (16 downto 0);
begin
            uut1:FFT_4point port map(x0_real=>x0_real       ,x0_imag=>x0_imag,      x1_real=>x1_real        ,x1_imag=>x1_imag,      x2_real=>x2_real,       x2_imag=>x2_imag,
                                                        x3_real=>x3_real,       x3_imag=>x3_imag,       F3_Real=>F3_Real      ,F3_imag=>F3_imag,    F2_Real=>F2_Real,       F1_imag=>F1_imag,
                                                        F1_Real=>F1_Real,     F2_imag=>F2_imag,        F0_Real=>F0_Real,     F0_imag=>F0_imag,    Clock=>Clock);


   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for Clock_period*10;
            x0_real        <=       to_signed(7,16);
            x0_imag     <=        to_signed(1,16);
            x1_real        <=        to_signed(5,16);
            x1_imag      <=        to_signed(-4,16);
            x2_real       <=         to_signed(3,16);
            x2_imag     <=         to_signed(23,16);
            x3_real       <=         to_signed(9,16);
            x3_imag     <=         to_signed(-2,16);
                  wait;
   end process;

            
end projection;
