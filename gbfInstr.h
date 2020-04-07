
//{{BLOCK(gbfInstr)

//======================================================================
//
//	gbfInstr, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 601 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 38464 + 2048 = 41024
//
//	Time-stamp: 2020-04-07, 14:19:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GBFINSTR_H
#define GRIT_GBFINSTR_H

#define gbfInstrTilesLen 38464
extern const unsigned short gbfInstrTiles[19232];

#define gbfInstrMapLen 2048
extern const unsigned short gbfInstrMap[1024];

#define gbfInstrPalLen 512
extern const unsigned short gbfInstrPal[256];

#endif // GRIT_GBFINSTR_H

//}}BLOCK(gbfInstr)
