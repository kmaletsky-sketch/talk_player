MCU=attiny402
F_CPU=16000000UL
CC=avr-gcc
CFLAGS=-mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os -Wall
OBJTOOL=avr-objcopy

all: main.hex

main.elf: main.c
	$(CC) $(CFLAGS) -o $@ $^

main.hex: main.elf
	$(OBJTOOL) -O ihex -R .eeprom $< $@

clean:
	rm -f main.elf main.hex
