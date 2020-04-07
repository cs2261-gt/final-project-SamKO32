#include "game.h"
#include "myLib.h"

int lives;
int knifeCount;
int lost;

void initGame() {
    lives = 3;
    // int knifeCount = 5;
    // int lost = 0;

    initMordecai();
    //initGbf();
    initCoin();
    //initSword();
}

void updateGame() {
    updateMordecai();
}

void drawGame() {
    //drawMordecai();
    drawCoin();
    drawGbf();
}

void initMordecai() {
    mordecai.width = 64;
    mordecai.height = 64;
    mordecai.cdel = 1;
    mordecai.rdel = 1;
    mordecai.aniState = RUN;
    //mordecai.col = SCREENWIDTH - (mordecai.width/2);
	mordecai.row = 30;

    mordecai.col = 0;
    // mordecai.row = 100;
    mordecai.active = 1;
    //mordecai.aniState = 1;
}

void updateMordecai() {
    if (BUTTON_PRESSED(BUTTON_UP)) {
        mordecai.col += 10;
        //after some time 
        //mordecai.col -= 10;
        mordecai.aniState = JUMP;
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        mordecai.col--;
        mordecai.aniState = CROUCH;
    }
    //mordecai.col = mordecai.oldCol;

}

void drawMordecai() {
        shadowOAM[0].attr0 = mordecai.row | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[0].attr1 = mordecai.col | ATTR1_LARGE;
        shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
}

void initCoin() {
    //coin.cdel = 1;
    coin.col = 50;
	coin.row = 50;

    mordecai.col = 0;
    // mordecai.row = 100;
    mordecai.active = 1;
    //mordecai.aniState = 1;
}

void updateCoin() {

}

void drawCoin() {
        shadowOAM[1].attr0 = coin.row | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[1].attr1 = coin.col | ATTR1_LARGE;
        shadowOAM[1].attr2 = ATTR2_TILEID(4, 0);
}

void initGbf() {
    gbf.active = 1;
    gbf.col = 30;
    gbf.row = 100;
}

void updateGbf();

void drawGbf() {
    if (gbf.active) {
        shadowOAM[2].attr0 = gbf.col | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP;
        shadowOAM[2].attr1 = gbf.col | ATTR1_LARGE;
        shadowOAM[2].attr2 = ATTR2_TILEID(8, 0);
    }

}