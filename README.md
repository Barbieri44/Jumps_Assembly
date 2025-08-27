# Jumps_Assembly
This is an x86 assembly program that checks a single character input by the user.  The program prompts the user to "type a character."  It reads the character and checks if it's the ESC key (ASCII 27), which exits the program.  Otherwise, it determines if the character is a number, an uppercase letter, a lowercase letter, or an unknown character.

The code uses conditional and unconditional jumps to control the flow of execution. These jumps are essential for making decisions and repeating tasks based on the user's input.

Conditional Jumps
Conditional jumps, such as jb (jump if below) and ja (jump if above), transfer control to a different part of the program only if a specific condition is met after a comparison (cmp) instruction.

cmp al, 27 followed by je sair: This checks if the character in register al is equal to the ASCII value for the ESC key. If they are equal, the program jumps to the Sair label to terminate. The je instruction stands for "jump if equal."

cmp bl, 30h followed by jb naosei: This compares the character to the hexadecimal value for '0'. If the character is numerically less than '0', it jumps to the naosei label, as it's not a digit.

cmp bl, 39h followed by ja maiusc: This compares the character to the hexadecimal value for '9'. If the character is numerically greater than '9', it jumps to the maiusc label to check if it's a letter.

Unconditional Jumps
An unconditional jump, like jmp, always transfers control to a new location. It acts like a "go to" statement, ensuring a specific sequence of instructions is followed.

jmp digite: This is used at the end of each classification block (e.g., after printing "It's a number!") to send the program back to the digite label. This creates a continuous loop, allowing the user to enter multiple characters until they press ESC. This makes the program run repeatedly instead of just once.


<img width="965" height="557" alt="image" src="https://github.com/user-attachments/assets/933565cd-1b5c-48e4-8078-661078ef3fe3" />

<img width="973" height="573" alt="image" src="https://github.com/user-attachments/assets/e941fc7d-c03b-46ca-9feb-5225c09aff55" />
