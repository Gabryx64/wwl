#include "gfx.h"
#include "snes/background.h"
#include <snes.h>
#include <stdint.h>

int main(void) {
  uint8_t i;

  consoleInit();
  gfx_init();

  init_sprite(0, 100, 50, 3, 0, 0, 0, 0);

  while (1) {
    flush();
  }

  return 0;
}
