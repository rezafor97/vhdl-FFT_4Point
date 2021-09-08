
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity FFT_2point is
    Port ( x0_real       : in signed (15 downto 0);
              x0_imag     : in signed (15 downto 0);
              x1_real       : in signed (15 downto 0);
              x1_imag     : in signed (15 downto 0);
             F0_Real       : out signed (16 downto 0);
             F0_imag      : out signed (16 downto 0);
             F1_Real       : out signed (16 downto 0);
             F1_imag      : out signed (16 downto 0));
end FFT_2point;

architecture projection of FFT_2point is
begin
				F0_Real								<=		x0_real   + resize(x1_real,17);
				F0_imag								<=		x0_imag + resize(x1_imag,17);
				F1_Real								<=		x0_real   - resize(x1_real,17);
				F1_imag								<=		x0_imag - resize(x1_imag,17);
end projection;
