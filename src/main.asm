.include "hdr.asm"
.accu 16
.index 16
.16bit
.define __main_locals 1
.SECTION ".text_0x0" SUPERFREE
main:
.ifgr __main_locals 0
tsa
sec
sbc #__main_locals
tas
.endif
jsr.l consoleInit
lda.w #:bg_end
lda.w #bg_end + 0
sta.b tcc__r0
lda.w #:bg
lda.w #bg + 0
sta.b tcc__r1
sec
lda.b tcc__r0
sbc.b tcc__r1
sta.b tcc__r0
pea.w 8192
pea.w 256
pea.w 512
pei (tcc__r0)
sep #$20
lda #0
pha
rep #$20
pea.w :bg_palette
pea.w bg_palette + 0
pea.w :bg
pea.w bg + 0
sep #$20
lda #0
pha
rep #$20
jsr.l bgInitTileSet
tsa
clc
adc #18
tas
jsr.l WaitForVBlank
lda.w #:bg_map_end
lda.w #bg_map_end + 0
sta.b tcc__r0
lda.w #:bg_map
lda.w #bg_map + 0
sta.b tcc__r1
sec
lda.b tcc__r0
sbc.b tcc__r1
sta.b tcc__r0
pea.w 24576
sep #$20
lda #0
pha
rep #$20
pei (tcc__r0)
pea.w :bg_map
pea.w bg_map + 0
sep #$20
lda #0
pha
rep #$20
jsr.l bgInitMapSet
tsa
clc
adc #10
tas
pea.w (0 * 256 + 3)
sep #$20
rep #$20
jsr.l setMode
pla
sep #$20
lda #1
pha
rep #$20
jsr.l bgSetDisable
tsa
clc
adc #1
tas
lda.w #:sprites_end
sta.b tcc__r0h
lda.w #sprites_end + 0
sta.b tcc__r0
lda.w #:sprites
lda.w #sprites + 0
sta.b tcc__r1
sec
lda.b tcc__r0
sbc.b tcc__r1
sta.b tcc__r0
lda.w #:sprites_palette_end
lda.w #sprites_palette_end + 0
sta.b tcc__r1
lda.w #:sprites_palette
lda.w #sprites_palette + 0
sta.b tcc__r2
sec
lda.b tcc__r1
sbc.b tcc__r2
sta.b tcc__r1
sep #$20
lda #96
pha
rep #$20
pea.w 0
sep #$20
lda #0
pha
rep #$20
pei (tcc__r1)
pea.w :sprites_palette
pea.w sprites_palette + 0
pei (tcc__r0)
pea.w :sprites
pea.w sprites + 0
jsr.l oamInitGfxSet
tsa
clc
adc #16
tas
jsr.l setScreenOn
lda.w #0
sta.b tcc__r0
sep #$20
sta -1 + __main_locals + 1,s
rep #$20
__local_2:
lda.w #0
sep #$20
lda -1 + __main_locals + 1,s
rep #$20
sta.b tcc__r0
sec
sbc.w #128
bvc +
eor #$8000
+
bmi +
brl __local_0
+
bra __local_1
__local_3:
lda.w #0
sep #$20
lda -1 + __main_locals + 1,s
rep #$20
sta.b tcc__r0
sta.b tcc__r1
lda.b tcc__r0h
sta.b tcc__r1h
inc.b tcc__r0
sep #$20
lda.b tcc__r0
sta -1 + __main_locals + 1,s
rep #$20
bra __local_2
__local_1:
lda.w #0
sep #$20
lda -1 + __main_locals + 1,s
rep #$20
asl a
asl a
sta.b tcc__r0
lda.w #0
sep #$20
lda -1 + __main_locals + 1,s
rep #$20
sta.b tcc__r1
tax
lda.w #16
jsr.l tcc__div
txa
asl a
asl a
asl a
asl a
sta.b tcc__r1
lda.w #0
sep #$20
lda -1 + __main_locals + 1,s
rep #$20
sta.b tcc__r2
tax
lda.w #16
jsr.l tcc__div
lda.b tcc__r9
asl a
asl a
asl a
asl a
sta.b tcc__r2
lda.w #0
sep #$20
lda -1 + __main_locals + 1,s
rep #$20
sta.b tcc__r3
sep #$20
lda #0
pha
rep #$20
pei (tcc__r3)
pea.w (0 * 256 + 0)
sep #$20
lda #3
pha
rep #$20
pei (tcc__r2)
pei (tcc__r1)
pei (tcc__r0)
jsr.l oamSet
tsa
clc
adc #12
tas
lda.w #0
sep #$20
lda -1 + __main_locals + 1,s
rep #$20
asl a
asl a
sta.b tcc__r0
pea.w (0 * 256 + 0)
sep #$20
rep #$20
pei (tcc__r0)
jsr.l oamSetEx
tsa
clc
adc #4
tas
jmp.w __local_3
__local_0:
__local_4:
jsr.l WaitForVBlank
bra __local_4
lda.w #0
sta.b tcc__r0
__local_5:
.ifgr __main_locals 0
tsa
clc
adc #__main_locals
tas
.endif
rtl
.ENDS
.RAMSECTION "ramtmpxfile1rHMSX.data" APPENDTO "globram.data"
__local_dummytmpxfile1rHMSX.data dsb 1
.ENDS
.SECTION "tmpxfile1rHMSX.data" APPENDTO "glob.data"
__local_dummytmpxfile1rHMSX.data: .db 0
.ENDS
.SECTION ".rodata" SUPERFREE
__local_dummytmpxfile1rHMSX.rodata: .db 0
.ENDS


.RAMSECTION ".bss" BANK $7e SLOT 2
__local_dummybss dsb 1
.ENDS
