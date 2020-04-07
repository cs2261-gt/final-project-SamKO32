# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int rdel;
    int cdel;
    int aniState;
    int prevAniState;
    int active;
} MORDECAI;


typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int active;
    int aniState;
    int prevAniState;
} GBF;


typedef struct {
    int row;
    int col;
    int active;
    int aniState;
    int prevAniState;
} COIN;


typedef struct {
    int row;
    int col;
    int active;
    int aniState;
    int prevAniState;
} SWORD;


enum {RUN, JUMP, CROUCH, THROW};

MORDECAI mordecai;
COIN coin;
GBF gbf;


void initGame();
void updateGame();
void drawGame();

void initMordecai();
void updateMordecai();
void drawMordecai();

void initGbf();
void updateGbf();
void drawGbf();

void initCoin();
void updateCoin();
void drawCoin();

void initSword();
void updateSword();
void drawSword();
# 2 "game.c" 2
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 342 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 3 "game.c" 2

int lives;
int knifeCount;
int lost;

void initGame() {
    lives = 3;



    initMordecai();

    initCoin();

}

void updateGame() {
    updateMordecai();
}

void drawGame() {

    drawCoin();
    drawGbf();
}

void initMordecai() {
    mordecai.width = 64;
    mordecai.height = 64;
    mordecai.cdel = 1;
    mordecai.rdel = 1;
    mordecai.aniState = RUN;

 mordecai.row = 30;

    mordecai.col = 0;

    mordecai.active = 1;

}

void updateMordecai() {
    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
        mordecai.col += 10;


        mordecai.aniState = JUMP;
    }
    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
        mordecai.col--;
        mordecai.aniState = CROUCH;
    }


}

void drawMordecai() {
        shadowOAM[0].attr0 = mordecai.row | (0<<8) | (0<<14) | (0<<13);
        shadowOAM[0].attr1 = mordecai.col | (3<<14);
        shadowOAM[0].attr2 = ((0)*32+(0));
}

void initCoin() {

    coin.col = 50;
 coin.row = 50;

    mordecai.col = 0;

    mordecai.active = 1;

}

void updateCoin() {

}

void drawCoin() {
        shadowOAM[1].attr0 = coin.row | (0<<8) | (0<<14) | (0<<13);
        shadowOAM[1].attr1 = coin.col | (3<<14);
        shadowOAM[1].attr2 = ((0)*32+(4));
}

void initGbf() {
    gbf.active = 1;
    gbf.col = 30;
    gbf.row = 100;
}

void updateGbf();

void drawGbf() {
    if (gbf.active) {
        shadowOAM[2].attr0 = gbf.col | (0<<8) | (0<<14) | (0<<13);
        shadowOAM[2].attr1 = gbf.col | (3<<14);
        shadowOAM[2].attr2 = ((0)*32+(8));
    }

}
