# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "GBF.h" 1
# 22 "GBF.h"
extern const unsigned short GBFTiles[18656];


extern const unsigned short GBFMap[1024];


extern const unsigned short GBFPal[256];
# 3 "main.c" 2
# 1 "gbfPause.h" 1
# 22 "gbfPause.h"
extern const unsigned short gbfPauseTiles[18048];


extern const unsigned short gbfPauseMap[1024];


extern const unsigned short gbfPausePal[256];
# 4 "main.c" 2
# 1 "gbfLose.h" 1
# 22 "gbfLose.h"
extern const unsigned short gbfLoseTiles[9952];


extern const unsigned short gbfLoseMap[1024];


extern const unsigned short gbfLosePal[256];
# 5 "main.c" 2
# 1 "gbfGame.h" 1
# 22 "gbfGame.h"
extern const unsigned short gbfGameTiles[15488];


extern const unsigned short gbfGameMap[1024];


extern const unsigned short gbfGamePal[256];
# 6 "main.c" 2
# 1 "mordecaiHead.h" 1
# 21 "mordecaiHead.h"
extern const unsigned short mordecaiHeadTiles[16384];


extern const unsigned short mordecaiHeadPal[16];
# 7 "main.c" 2
# 1 "mordSheet.h" 1
# 21 "mordSheet.h"
extern const unsigned short mordSheetTiles[16384];


extern const unsigned short mordSheetPal[256];
# 8 "main.c" 2
# 1 "coinSheet.h" 1
# 21 "coinSheet.h"
extern const unsigned short coinSheetTiles[16384];


extern const unsigned short coinSheetPal[256];
# 9 "main.c" 2
# 1 "gameSheet.h" 1
# 21 "gameSheet.h"
extern const unsigned short gameSheetTiles[16384];


extern const unsigned short gameSheetPal[256];
# 10 "main.c" 2
# 1 "gbfInstr.h" 1
# 22 "gbfInstr.h"
extern const unsigned short gbfInstrTiles[19232];


extern const unsigned short gbfInstrMap[1024];


extern const unsigned short gbfInstrPal[256];
# 11 "main.c" 2


void initialize();


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


unsigned short buttons;
unsigned short oldButtons;
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
extern int lives;

enum {START, GAME, INSTR, CREDS, PAUSE, LOSE};
int state;

int main () {

    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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


void initialize() {
 (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<12);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((28)<<8) | (0<<14) | (1<<7);


 (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;

    goToStart();
}

int morCol = 60;
int morRow = 110;


void goToStart() {
    DMANow(3, GBFPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, GBFTiles, &((charblock *)0x6000000)[0], 37312 / 2);
    DMANow(3, GBFMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    DMANow(3, mordecaiHeadPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, mordecaiHeadTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    hOff = 0;
    morCol = 60;
    morRow = 110;
    state = START;
}




void drawPointer() {
    shadowOAM[0].attr0 = morRow | (0<<8) | (0<<14) | (0<<13);
    shadowOAM[0].attr1 = morCol | (3<<14);
    shadowOAM[0].attr2 = ((0)*32+(0));
}




void start() {


    drawPointer();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    if((!(~(oldButtons)&((1<<4))) && (~buttons & ((1<<4))))) {
        if (morCol < 200) {
            morCol += 70;
        }
    }
    if((!(~(oldButtons)&((1<<5))) && (~buttons & ((1<<5))))) {
        if (morCol > 60) {
            morCol -= 70;
        }
    }
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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

    DMANow(3, gbfGamePal, ((unsigned short *)0x5000000), 512);
    DMANow(3, gbfGameTiles, &((charblock *)0x6000000)[0], 30976 / 2);
    DMANow(3, gbfGameMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    DMANow(3, gameSheetPal, ((unsigned short *)0x5000200), 16);
    DMANow(3, gameSheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = GAME;

}

void game() {

    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToLose();
    }
    if (lives == 0) {
        goToLose();
    }

    hOff++;
    (*(volatile unsigned short *)0x04000014) = hOff;

}

void goToInstructions() {

    DMANow(3, gbfInstrPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, gbfInstrTiles, &((charblock *)0x6000000)[0], 38464 / 2);
    DMANow(3, gbfInstrMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    hOff = 0;
    state = INSTR;

}

void instructions() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }

}

void goToCredits() {
# 226 "main.c"
}

void credits() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }

}

void goToPause() {


    DMANow(3, gbfPausePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, gbfPauseTiles, &((charblock *)0x6000000)[0], 36096 / 2);
    DMANow(3, gbfPauseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    DMANow(3, mordecaiHeadPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, mordecaiHeadTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    hOff = 0;
    morCol = 60;
    morRow = 97;
    state = PAUSE;

}

void pause() {

    drawPointer();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    if((!(~(oldButtons)&((1<<4))) && (~buttons & ((1<<4))))) {
        if (morCol < 180) {
            morCol += 70;
        }
    }
    if((!(~(oldButtons)&((1<<5))) && (~buttons & ((1<<5))))) {
        if (morCol > 60) {
            morCol -= 70;
        }
    }
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        if (morCol == 60) {

            goToGame();
        } else if (morCol == 130) {
            goToInstructions();
        } else if (morCol == 200) {
            goToStart();
        }
    }

}

void goToLose() {

    DMANow(3, gbfLosePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, gbfLoseTiles, &((charblock *)0x6000000)[0], 19904 / 2);
    DMANow(3, gbfLoseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    DMANow(3, mordecaiHeadPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, mordecaiHeadTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    hOff = 0;
    morCol = 60;
    morRow = 97;
    state = LOSE;

}

void lose() {

    if((!(~(oldButtons)&((1<<4))) && (~buttons & ((1<<4))))) {
        if (morCol < 180) {
            morCol += 70;
        }
    }
    if((!(~(oldButtons)&((1<<5))) && (~buttons & ((1<<5))))) {
        if (morCol > 60) {
            morCol -= 70;

        }
    }
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        if (morCol == 60) {

            goToGame();
        } else if (morCol == 130) {
            goToInstructions();
        } else if (morCol == 200) {
            goToStart();
        }
    }



    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToStart();
 }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  goToCredits();
 }
}
