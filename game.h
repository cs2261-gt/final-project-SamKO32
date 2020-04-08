// Mordecai Struct
typedef struct {
    int row;
    int col;
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
    int fromRight;
    int fromTop; 
} GBF;

// Coins Struct
typedef struct {
    int row;
    int col;
    int cdel;
    int active;
    int aniState;
    int prevAniState;
    int high;
    int low;
} COIN;

// Attack Struct
typedef struct {
    int row;
    int col;
    int cdel;
    int active;
    int aniState;
    int prevAniState;
} ATTACK;

// Mordecai sprite enum 
enum {RUN, JUMP, CROUCH, THROW};


// Constants
#define ATTACKCOUNT 5

MORDECAI mordecai;
COIN coin;
GBF gbf;
ATTACK attack[ATTACKCOUNT];


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

void fireAttack();

void initAttack();
void updateAttack();
void drawAttack();