// Mordecai Struct
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

// GBF Struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int active;
    int aniState;
    int prevAniState; 
} GBF;

// Coins Struct
typedef struct {
    int row;
    int col;
    int active;
    int aniState;
    int prevAniState;
} COIN;

// Sword/attack "coin"?? Struct
typedef struct {
    int row;
    int col;
    int active;
    int aniState;
    int prevAniState;
} SWORD;

// Mordecai sprite enum 
enum {RUN, JUMP, CROUCH, THROW};

MORDECAI mordecai;
COIN coin;
GBF gbf;

// Prototypes
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