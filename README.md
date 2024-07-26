
# Snakes and Ladders Game

## Project Overview

The Snakes and Ladders Game is a classic board game implemented in assembly language using the Irvine32 library. The game allows up to four players to roll dice, move their pieces on a 10x10 board, and interact with snakes and ladders which alter their positions.

## Features

- **Player Movement**: Players roll a dice to determine their movement on the board.
- **Snakes and Ladders**: The board includes snakes that move players backward and ladders that move players forward.
- **Game Display**: The game displays the board, players’ positions, and interactive elements like snakes and ladders.

## Prerequisites

- **Assembler**: MASM (Microsoft Macro Assembler)
- **Irvine32 Library**: Ensure you have the Irvine32 library installed and properly configured.
- **Operating System**: Windows (as Irvine32 is a Windows-specific library)

## Installation

1. **Download the Irvine32 Library**:
   - Obtain the Irvine32 library from the official website or include it in your project directory.

2. **Set Up Your Development Environment**:
   - Make sure MASM is installed and properly configured to use with your assembler.

3. **Compile the Program**:
   - Save your assembly code in a file named `snakes_and_ladders.asm`.
   - Open a command prompt and navigate to the directory containing your `.asm` file.
   
4. **Run the Game**:


## Gameplay Instructions

1. **Starting the Game**:
   - Launch the game executable. You will see the welcome message and the game board.

2. **Rolling the Dice**:
   - Players roll the dice by pressing any key. The dice roll will be displayed on the screen.
   - The dice roll determines how many spaces a player will move forward.

3. **Movement**:
   - Players move their pieces based on the dice roll. The board updates to reflect their new positions.

4. **Interacting with Snakes and Ladders**:
   - If a player lands on a ladder, their position will move up to the top of the ladder.
   - If a player lands on a snake, their position will move down to the snake's tail.

5. **Winning the Game**:
   - The first player to reach or exceed position 100 wins the game. A congratulatory message will be displayed.

## Code Overview

- **Data Section**:
  - Contains strings and variables used for displaying messages, player positions, and board elements (snakes and ladders).

- **Code Section**:
  - **`main PROC`**: Entry point of the program, initializes the game, and controls the main game loop.
  - **`posdisp PROC`**: Displays the positions of all players.
  - **`_start PROC`**: Manages the main game logic including rolling the dice, moving players, and handling snakes and ladders.
  - **`UpdatePos PROC`**: Updates and displays the position of each player on the board.
  - **`PrintBorder PROC`**: Prints the border of the game board.
  - **`PrintNums PROC`**: Prints the numbers on the game board.
  - **`PrintLadders PROC`**: Displays the ladders on the board.
  - **`PrintSnakes PROC`**: Displays the snakes on the board.

## Known Issues

- **Platform Dependency**: This game is designed for Windows and requires the Irvine32 library which is specific to that platform.

- **Error Handling**: Basic error handling is implemented. Additional robustness can be added for production use.

## Future Enhancements

- **Graphical User Interface (GUI)**: Develop a GUI version of the game for better user interaction.
- **Extended Features**: Include more advanced features such as player statistics, multiple game modes, or network play.



