#include <stdlib.h>
#include "game.h"
#include "myLib.h"

int lives;
int knifeCount;
int lost;
int score;
int attacksLeft;


void initGame() {
    lives = 3;
    score = 0;
    attacksLeft = 5;
    lost = 0;

    initMordecai();
    initGbf();
    initCoin();
    initAttack();
}

void updateGame() {
    updateMordecai();
    updateCoin();
    updateGbf();
    for (int i = 0; i < ATTACKCOUNT; i++)
		updateAttack(&attack[i]);
}

void drawGame() {
    drawMordecai();
    drawCoin();
    drawGbf();
    for (int i = 0; i < ATTACKCOUNT; i++)
		drawAttack(&attack[i]);
}

void initMordecai() {
    mordecai.cdel = 1;
    mordecai.rdel = 1;
    mordecai.aniState = RUN;
	mordecai.row = 100;

    mordecai.col = 10;
    // mordecai.row = 100;
    mordecai.active = 1;
    //mordecai.aniState = 1;
}

void updateMordecai() {
    if (collision(mordecai.col, mordecai.row, 32, 32, gbf.col, gbf.row, 32, 32)) {
        lives--;
        //shadowOAM[1].attr0 = ATTR0_HIDE;
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        if (mordecai.row > 10) {
            mordecai.row -= 20;
            mordecai.aniState = JUMP;
        } 
        //want to implement jumping
        // delay(1000); 
        // mordecai.row += 20;
        mordecai.aniState = JUMP;
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        if (mordecai.row < 100) {
            mordecai.row += 20;
            mordecai.aniState = CROUCH;
        }
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        fireAttack();
    }
    //mordecai.col = mordecai.oldCol;
}

void drawMordecai() {
        shadowOAM[0].attr0 = mordecai.row | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = mordecai.col | ATTR1_MEDIUM;
        shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
}

void delay(int time) {
    volatile int waste;
    for (int i = 0; i < time *1000000; i++) {
        waste++;
    }
}

void initAttack() {
    for (int i = 0; i < ATTACKCOUNT; i++) {
		attack[i].row = 0;
		attack[i].col = 0;
        attack[i].cdel = 0;
		attack[i].active = 0;
	}
}


void updateAttack(ATTACK* a) {
    if (collision(a->col, a->row, 32, 32, gbf.col, gbf.row, 32, 32)) {
        gbf.active = 0;
        a->active = 0;
        shadowOAM[3].attr0 = ATTR0_HIDE;
        shadowOAM[2].attr0 = ATTR0_HIDE;
    }

	// If active, update; otherwise ignore
	if (a->active) {
		if (a->col + 32 < 230) {
            a->col += a->cdel;
		} else {
			a->active = 0;
            shadowOAM[3].attr0 = ATTR0_HIDE;
		}
	}
}


void fireAttack() {
	for (int i = 0; i < ATTACKCOUNT; i++) {
		if (!attack[i].active) {

			attack[i].row = mordecai.row;
			attack[i].col = mordecai.col;

            attack[i].cdel += 1;
			attack[i].active = 1;
			break;
		}
	}
}

void drawAttack(ATTACK* a) {
    if(a->active) {
        shadowOAM[3].attr0 = a->row | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[3].attr1 = a->col | ATTR1_MEDIUM;
        shadowOAM[3].attr2 = ATTR2_TILEID(12, 0);
	}

}




void initCoin() {
    //coin.cdel = 1;
    coin.col = 230;
	coin.row = rand() % 150;
    coin.cdel = 1;
    coin.active = 1;

    // want to use this to make coin appear at different heights
    // if(rand() % 2) {
    //     coin.high = 1;
    //     coin.low = 0;
    // } else {
    //     coin.low = 1;
    //     coin.high = 0;
    // }
    //coin.aniState = ;
    //coin.prevAniState = ;
}

//want coin to reappear after random amount of time
void updateCoin() {
    if (collision(mordecai.col, mordecai.row, 32, 32, coin.col, coin.row, 32, 32)) {
        coin.active = 0;
        shadowOAM[1].attr0 = ATTR0_HIDE;
    }
    int randNum;
    randNum = rand() % 10;

    if (coin.col > 0) {
        coin.col -= coin.cdel;
    } else {
        coin.active = 0;
        shadowOAM[1].attr0 = ATTR0_HIDE;
    }

    if (!coin.active) {
        if (randNum < 2) {
            initCoin();
        }
    }
}

void drawCoin() {
    if (coin.active) {
        shadowOAM[1].attr0 = coin.row | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[1].attr1 = coin.col | ATTR1_MEDIUM;
        shadowOAM[1].attr2 = ATTR2_TILEID(4, 0);
    }
}

void initGbf() {
    gbf.active = 1;
    gbf.col = 200;
    gbf.row = mordecai.row;
}

void updateGbf() {
    int time;
}

void drawGbf() {
    if (gbf.active) {
        shadowOAM[2].attr0 = gbf.row | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[2].attr1 = gbf.col | ATTR1_MEDIUM;
        shadowOAM[2].attr2 = ATTR2_TILEID(8, 0);
    }

}