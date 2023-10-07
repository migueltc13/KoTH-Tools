CC = gcc
CFLAGS = -std=c99 -Wall
LDFLAGS = -static
SRC = echo.c
OUT = echo

all: $(OUT)

$(OUT): $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(OUT) $(SRC)

clean:
	rm -f $(OUT)
