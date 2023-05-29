#include "gfx.h"
#include "snes/background.h"
#include <snes.h>
#include <stdint.h>

int main(void) {
  uint8_t i;

  consoleInit();
  gfx_init();

  for (i = 0; i < 128; i++) {
    init_sprite(i * 4, (i % 16) * 16, i / 16 * 16, 3, 0, 0, i, 0);
  }

  while (1) {
    flush();
  }

  return 0;
}
