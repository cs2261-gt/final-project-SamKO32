
//{{BLOCK(gbfPause)

//======================================================================
//
//	gbfPause, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 564 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 36096 + 2048 = 38656
//
//	Time-stamp: 2020-04-01, 23:25:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GBFPAUSE_H
#define GRIT_GBFPAUSE_H

#define gbfPauseTilesLen 36096
extern const unsigned short gbfPauseTiles[18048];

#define gbfPauseMapLen 2048
extern const unsigned short gbfPauseMap[1024];

#define gbfPausePalLen 512
extern const unsigned short gbfPausePal[256];

#endif // GRIT_GBFPAUSE_H

//}}BLOCK(gbfPause)
