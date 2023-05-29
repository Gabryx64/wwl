.include "hdr.asm"

.section ".rosprite" superfree

sprites:
.incbin "assets/sprites.pic"
sprites_end:

sprites_palette:
.incbin "assets/sprites.pal"
sprites_palette_end:

.ends

.section ".rodata2" superfree

bg: .incbin "assets/bg.pic"
bg_end:

bg_map: .incbin "assets/bg.map"
bg_map_end:

bg_palette: .incbin "assets/bg.pal"

.ends
