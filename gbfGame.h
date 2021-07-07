
//{{BLOCK(gbfGame)

//======================================================================
//
//	gbfGame, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 484 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 30976 + 2048 = 33536
//
//	Time-stamp: 2020-04-07, 18:37:34
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GBFGAME_H
#define GRIT_GBFGAME_H

#define gbfGameTilesLen 30976
extern const unsigned short gbfGameTiles[15488];

#define gbfGameMapLen 2048
extern const unsigned short gbfGameMap[1024];

#define gbfGamePalLen 512
extern const unsigned short gbfGamePal[256];

#endif // GRIT_GBFGAME_H

//}}BLOCK(gbfGame)
