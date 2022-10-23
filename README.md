# Combination-Lock---Verilog
## Lab 3 of CPEN 211
In this lab we create a 6 digit combination lock by programming the DE1-SoC using system Verilog. 

Digits are entered into the lock in binary using the input switches on the DE1-Soc, a digit is selected by pressing button 3 on the DE1-Soc.
As you are entering the digits, any 0-9 decimal number will be displayed in real time on the rightmost 7 segment display on the board. 
If the current number being inputted is >9 the rightmost 5 7 segment displays will display 'Error'. After 6 digits have been selected the seven segments
will diplay either 'OPEN' if you have successfully selected the 6-digit passcode or 'CLOSED' if you have selected any other combination of 6-digits.

