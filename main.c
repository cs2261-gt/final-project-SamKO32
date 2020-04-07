#include "myLib.h"
#include "GBF.h"
#include "gbfPause.h"
#include "gbfLose.h"
#include "gbfGame.h"
#include "mordecaiHead.h"
#include "mordSheet.h"
#include "coinSheet.h"
#include "gameSheet.h"
#include "gbfInstr.h"

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
                instructions();
                break;
            case CREDS:
                credits();
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

int morCol = 60;
int morRow = 110;

// Sets up the start state
void goToStart() {
    DMANow(3, GBFPal, PALETTE, 256);
    DMANow(3, GBFTiles, &CHARBLOCK[0], GBFTilesLen / 2);
    DMANow(3, GBFMap, &SCREENBLOCK[28], GBFMapLen / 2);
    
    DMANow(3, mordecaiHeadPal, SPRITEPALETTE, 256);
    DMANow(3, mordecaiHeadTiles, &CHARBLOCK[4], mordecaiHeadTilesLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    hOff = 0;
    morCol = 60;
    morRow = 110;
    state = START;
}

// draw mordecai head
// int morCol = 60;
// int morRow = 110;
void drawPointer() {
    shadowOAM[0].attr0 = morRow | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[0].attr1 = morCol | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
}



// Runs every frame of start state
void start() {

    //morCol = 60;
    drawPointer();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if(BUTTON_PRESSED(BUTTON_RIGHT)) {
        if (morCol < 200) {
            morCol += 70;
        }
    }
    if(BUTTON_PRESSED(BUTTON_LEFT)) {
        if (morCol > 60) {
            morCol -= 70;
        }
    }
    if(BUTTON_PRESSED(BUTTON_START)) {
        if (morCol == 60) {
            initGame();
            goToGame();
        } else if (morCol == 130) {
            goToInstructions();
        } else if (morCol == 200) {
            goToCredits();
        }
    }
}

void goToGame() {
    //game screen 
    DMANow(3, gbfGamePal, PALETTE, gbfGamePalLen);
    DMANow(3, gbfGameTiles, &CHARBLOCK[0], gbfGameTilesLen / 2);
    DMANow(3, gbfGameMap, &SCREENBLOCK[28], gbfGameMapLen / 2);

    DMANow(3, gameSheetPal, SPRITEPALETTE, 16);
    DMANow(3, gameSheetTiles, &CHARBLOCK[4], gameSheetTilesLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = GAME;

}

void game() {

    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToLose();
    }
    
    hOff++;
    REG_BG1HOFF = hOff;

}

void goToInstructions() {
    //instructions screen 
    DMANow(3, gbfInstrPal, PALETTE, 256);
    DMANow(3, gbfInstrTiles, &CHARBLOCK[0], gbfInstrTilesLen / 2);
    DMANow(3, gbfInstrMap, &SCREENBLOCK[28], gbfInstrMapLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    hOff = 0;
    state = INSTR;

}

void instructions() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

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
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

}

void goToPause() {

    //pause screen 
    DMANow(3, gbfPausePal, PALETTE, 256);
    DMANow(3, gbfPauseTiles, &CHARBLOCK[0], gbfPauseTilesLen / 2);
    DMANow(3, gbfPauseMap, &SCREENBLOCK[28], gbfPauseMapLen / 2);

    DMANow(3, mordecaiHeadPal, SPRITEPALETTE, 256);
    DMANow(3, mordecaiHeadTiles, &CHARBLOCK[4], mordecaiHeadTilesLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    hOff = 0;
    morCol = 60;
    morRow = 97;
    state = PAUSE;

}

void pause() { 

    drawPointer();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if(BUTTON_PRESSED(BUTTON_RIGHT)) {
        if (morCol < 180) {
            morCol += 70;
        }
    }
    if(BUTTON_PRESSED(BUTTON_LEFT)) {
        if (morCol > 60) {
            morCol -= 70;
        }
    }
    if(BUTTON_PRESSED(BUTTON_START)) {
        if (morCol == 60) {
            //initGame();
            goToGame();
        } else if (morCol == 130) {
            goToInstructions();
        } else if (morCol == 200) {
            goToStart();
        }
    }

}

void goToLose() {

    DMANow(3, gbfLosePal, PALETTE, 256);
    DMANow(3, gbfLoseTiles, &CHARBLOCK[0], gbfLoseTilesLen / 2);
    DMANow(3, gbfLoseMap, &SCREENBLOCK[28], gbfLoseMapLen / 2);

    DMANow(3, mordecaiHeadPal, SPRITEPALETTE, 256);
    DMANow(3, mordecaiHeadTiles, &CHARBLOCK[4], mordecaiHeadTilesLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    hOff = 0;
    morCol = 60;
    morRow = 97;
    state = LOSE;

}

void lose() {

    if(BUTTON_PRESSED(BUTTON_RIGHT)) {
        if (morCol < 180) {
            morCol += 70;
        }
    }
    if(BUTTON_PRESSED(BUTTON_LEFT)) {
        if (morCol > 60) {
            morCol -= 70;

        }
    }
    if(BUTTON_PRESSED(BUTTON_START)) {
        if (morCol == 60) {
            //initGame();
            goToGame();
        } else if (morCol == 130) {
            goToInstructions();
        } else if (morCol == 200) {
            goToStart();
        }
    }



    if (BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToCredits();
	}
}