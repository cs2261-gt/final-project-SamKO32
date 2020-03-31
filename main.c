#include "myLib.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();

void goToGame();
void game();

void goToInstructions();
void instructions();

void goToCredits();
void credits();

void goToPause();
void pause();

void goToLose();
void lose();

// Variables
unsigned short buttons;
unsigned short oldButtons;
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];

enum {START, GAME, INSTR, CREDS, PAUSE, LOSE};
int state;

int main () {

    initialize();

    while(1) {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

                // State Machine
        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case INSTR:
                game();
                break;
            case CREDS:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
		}
    }
}

// Initializes the game on launch
void initialize() {
	REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;


	REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    goToStart();
}

void goToStart() {

}

void start() {

}

void goToGame() {

}

void game() {

}

void goToInstructions() {

}

void instructions() {

}

void goToCredits() {

}
void credits() {

}

void goToPause() {

}
void pause() {

}

void goToLose() {

}
void lose() {
    
}