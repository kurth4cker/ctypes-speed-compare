CC = cc

PROG = sample
LIB = libsum.so

all: $(PROG) $(LIB)

$(PROG): $(LIB) sample.c
	$(CC) $(CFLAGS) -o $@ $^

$(LIB): sum-of-squares.c
	$(CC) -fPIC $(CFLAGS) -shared -o $@ $^

clean:
	rm -f *.o $(PROG) $(LIB)

.SUFFIXES: .c
.c:
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $< $(LDLIBS) $(LIB)
