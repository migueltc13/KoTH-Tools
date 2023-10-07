CC = gcc
CFLAGS = -std=c99 -Wall
LDFLAGS = -static
SRC_ECHO = echo.c
SRC_LSATTR = lsattr.c
OUT_ECHO = echo
OUT_LSATTR = lsattr

all: $(OUT_ECHO) $(OUT_LSATTR)

$(OUT_ECHO): $(SRC_ECHO)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

$(OUT_LSATTR): $(SRC_LSATTR)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	rm -f $(OUT_ECHO) $(OUT_LSATTR)
