
//{{BLOCK(GBF)

//======================================================================
//
//	GBF, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 583 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 37312 + 2048 = 39872
//
//	Time-stamp: 2020-04-05, 21:44:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GBF_H
#define GRIT_GBF_H

#define GBFTilesLen 37312
extern const unsigned short GBFTiles[18656];

#define GBFMapLen 2048
extern const unsigned short GBFMap[1024];

#define GBFPalLen 512
extern const unsigned short GBFPal[256];

#endif // GRIT_GBF_H

//}}BLOCK(GBF)
