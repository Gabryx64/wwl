#ifndef SPRITES_H
#define SPRITES_H
#include <snes.h>
#include <stdint.h>

extern uint8_t sprites, sprites_end, sprites_palette, sprites_palette_end, bg,
    bg_end, bg_palette, bg_map, bg_map_end;

#define gfx_init()                                                             \
  do {                                                                         \
    bgInitTileSet(0, &bg, &bg_palette, 0, &bg_end - &bg, 256 * 2,              \
                  BG_256COLORS, 0x2000);                                       \
    flush();                                                                   \
    bgInitMapSet(0, &bg_map, &bg_map_end - &bg_map, SC_32x32, 0x6000);         \
    setMode(BG_MODE3, 0);                                                      \
    bgSetDisable(1);                                                           \
    oamInitGfxSet(&sprites, &sprites_end - &sprites, &sprites_palette,         \
                  &sprites_palette_end - &sprites_palette, 0, 0x0000,          \
                  OBJ_SIZE16_L32);                                             \
    setScreenOn();                                                             \
  } while (0)

#define init_sprite_ex(id, x, y, priority, hflip, vflip, sprite_offset,        \
                       palette_offset, size, hide)                             \
  do {                                                                         \
    oamSet(id, x, y, priority, hflip, vflip, sprite_offset, palette_offset);   \
    oamSetEx(id, size, hide);                                                  \
  } while (0)

#define init_sprite(id, x, y, priority, hflip, vflip, sprite_offset,           \
                    palette_offset)                                            \
  init_sprite_ex(id, x, y, priority, hflip, vflip, sprite_offset,              \
                 palette_offset, OBJ_SMALL, OBJ_SHOW)

#define move_sprite(id, x, y) oamSetXY(id, x, y)

#define flush WaitForVBlank

#endif
