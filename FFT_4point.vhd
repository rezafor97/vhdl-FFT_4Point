
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity FFT_4point is
 Port (  	Clock				    :  in		std_logic;
            x0_real                 : in signed (15 downto 0);
            x0_imag                 : in signed (15 downto 0);
            x1_real                 : in signed (15 downto 0);
            x1_imag                 : in signed (15 downto 0);
            x2_real                 : in signed (15 downto 0);
            x2_imag                 : in signed (15 downto 0);
            x3_real                 : in signed (15 downto 0);
            x3_imag                 : in signed (15 downto 0);
            F0_Real                 : out signed (16 downto 0);
            F0_imag                 : out signed (16 downto 0);
            F1_Real                 : out signed (16 downto 0);
            F1_imag                 : out signed (16 downto 0);
            F2_Real                 : out signed (16 downto 0);
            F2_imag                 : out signed (16 downto 0);
            F3_Real                 : out signed (16 downto 0);
            F3_imag                 : out signed (16 downto 0));

               
               end FFT_4point;

architecture projection of FFT_4point is
-- input signal buffer
signal x0_real_int,x1_real_int,x2_real_int,x3_real_int  :signed(15 downto 0);
signal x0_imag_int ,x1_imag_int,x2_imag_int,x3_imag_int :signed(15 downto 0);
-- output signal lev1 route
signal F0_Real_int,F1_Real_int,F2_Real_int,F3_Real_int :signed(16 downto 0);
signal F0_imag_int,F1_imag_int,F2_imag_int,F3_imag_int :signed(16 downto 0);
--  output signal  lev1 register
signal F0_Real_reg,F1_Real_reg,F2_Real_reg,F3_Real_reg :signed(15 downto 0);
signal F0_imag_reg,F1_imag_reg,F2_imag_reg,F3_imag_reg :signed(15 downto 0);
--output signal buffer
signal F0_Real_buf,F1_Real_buf,F2_Real_buf,F3_Real_buf :signed(16 downto 0);
signal F0_imag_buf,F1_imag_buf,F2_imag_buf,F3_imag_buf :signed(16 downto 0);
begin

                                                                    
    Butterfly_Ins_1:		entity work.FFT_2point port map(
            x0_real         =>      x0_real_int ,
            x0_imag       =>      x0_imag_int,
            x1_real          =>     x2_real_int ,
            x1_imag        =>     x2_imag_int,
            F0_Real        =>     F0_Real_int,
            F0_imag       =>     F0_imag_int,
            F1_Real         =>    F2_Real_int ,
            F1_imag        =>    F2_imag_int) ;

    Butterfly_Ins_2:		entity work.FFT_2point port map(
            x0_real         =>      x1_real_int ,
            x0_imag       =>      x1_imag_int,
            x1_real          =>     x3_real_int ,
            x1_imag        =>     x3_imag_int,
            F0_Real        =>     F1_Real_int,
            F0_imag       =>     F1_imag_int,
            F1_Real         =>    F3_Real_int ,
            F1_imag        =>    F3_imag_int) ;

    Butterfly_Ins_3:		entity work.FFT_2point port map(
            x0_real         =>     F0_Real_reg,
            x0_imag       =>     F0_imag_reg,
            x1_real          =>    F1_Real_reg ,
            x1_imag        =>    F1_imag_reg,
            F0_Real        =>    F0_Real_buf ,
            F0_imag       =>    F0_imag_buf  ,
            F1_Real         =>    F2_Real_buf  ,
            F1_imag        =>    F2_imag_buf) ;

    Butterfly_Ins_4:		entity work.FFT_2point port map(
            x0_real         =>     F2_Real_reg,
            x0_imag       =>     F2_imag_reg,
            x1_real          =>    F3_Real_reg ,
            x1_imag        =>    F3_imag_reg,
            F0_Real        =>    F1_Real_buf ,
            F0_imag       =>    F1_imag_buf  ,
            F1_Real         =>    F3_Real_buf  ,
            F1_imag        =>    F3_imag_buf) ;

process(Clock)
					begin						
						if rising_edge(Clock) then
							
							------ Buffering the Input Signal --------
						  x0_Real_Int						<=		x0_Real;
						  x0_Imag_Int						<=		x0_Imag;
						  x1_Real_Int						<=		x1_Real;
						  x1_Imag_Int						<=		x1_Imag;
						  x2_Real_Int						<=		x2_Real;
						  x2_Imag_Int						<=		x2_Imag;
						  x3_Real_Int						<=		x3_Real;
						  x3_Imag_Int						<=		x3_Imag;

							------ Buffering the Internal Signal --------
						  f0_Real_reg				<=		resize(f0_Real_Int,16);
						 f0_Imag_reg		     	<=		resize(f0_Imag_Int,16);
						  f1_Real_reg				<=		resize(f1_Real_Int,16);
						  f1_Imag_reg				<=		resize(f1_Imag_Int,16);
						  f2_Real_reg				<=		resize(f2_Real_Int,16);
						 f2_Imag_reg		  	   <=		resize(f2_Imag_Int,16);
						 f3_Real_reg		       <=		resize(f3_Imag_Int,16);
						  f3_Imag_reg			   <=		0 - resize(f3_Real_Int,16);
			         ------ Buffering the output Signal --------
                        F0_Real        <=    F0_Real_buf ;
                        F0_imag       <=    F0_imag_buf  ;
                        F1_Real         <=    F1_Real_buf ;
                        F1_imag        <=    F1_imag_buf  ;
                        F2_Real        <=    F2_Real_buf ;
                        F2_imag       <=    F2_imag_buf  ;
                        F3_Real         <=    F3_Real_buf ;
                        F3_imag        <=    F3_imag_buf  ;
							
						end if;	 							
				end process;	




end projection;
