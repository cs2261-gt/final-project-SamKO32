#include "myLib.h"
#include "GBF.h"
#include "gbfPause.h"
#include "gbfLose.h"

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
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL | BG_8BPP;


	REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    goToStart();
}

// Sets up the start state
void goToStart() {
    DMANow(3, GBFPal, PALETTE, 256);
    DMANow(3, GBFTiles, &CHARBLOCK[0], GBFTilesLen / 2);
    DMANow(3, GBFMap, &SCREENBLOCK[28], GBFMapLen / 2);
    
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    state = START;
}

// Runs every frame of start state
void start() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        //initGame();
        goToGame();
    }
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
    if(BUTTON_PRESSED(BUTTON_R)) {
        goToCredits();
    }

}

void goToGame() {
    state = GAME;

}

void game() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

}

void goToInstructions() {

}

void instructions() {

}

void goToCredits() {

    // DMANow(3, gbfCreditsPal, PALETTE, 256);
    // DMANow(3, gbfCreditsTiles, &CHARBLOCK[0], gbfCreditsTilesLen / 2);
    // DMANow(3, gbfCreditsMap, &SCREENBLOCK[28], gbfCreditsMapLen / 2);

    // hideSprites();
    // waitForVBlank();
    // DMANow(3, shadowOAM, OAM, 128 * 4);

    // state = LOSE;

}

void credits() {

}

void goToPause() {

    //pause screen 
    DMANow(3, gbfPausePal, PALETTE, 256);
    DMANow(3, gbfPauseTiles, &CHARBLOCK[0], gbfPauseTilesLen / 2);
    DMANow(3, gbfPauseMap, &SCREENBLOCK[28], gbfPauseMapLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = PAUSE;

}

void pause() { 
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

}

void goToLose() {

    DMANow(3, gbfLosePal, PALETTE, 256);
    DMANow(3, gbfLoseTiles, &CHARBLOCK[0], gbfLoseTilesLen / 2);
    DMANow(3, gbfLoseMap, &SCREENBLOCK[28], gbfLoseMapLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = LOSE;

}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToCredits();
	}
}