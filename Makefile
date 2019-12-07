		CC = gcc
		CFLAGS = -Wall -ansi -pedantic
		LFLAGS = -lm
		OBJS = hw_hello.o hw_power.o hw_main.o
		EXEC = hello
		MANIFEST = *.c .h Makefile
		DESTDIR = $(HOME)/bin
		VER = 0.1

all: $(EXEC)

$(EXEC): $(OBJS)
		$(CC) $(LFLAGS) $+ -o $@
		echo hello: zbudowane!

%.o: %.c
		$(CC) -c $(CFLAGS) $<

hw_main.o: hw_defs.h hw_hello.h hw_power.h

hw_hello.o: hw_defs.h

hw_power.o: hw_defs.h

clean:
		rm -f *~ rm -f *.bak rm -f $(EXEC) $(OBJS)

install: all
		sh -c "if [ ! -d $(DESTDIR) ] ; then mkdir $(DESTDIR) ; fi"
		cp $(EXEC) $(DESTDIR)/$(EXEC)
		echo hello: zainstalowane!

dist: clean
	tar cvzf ../$(EXEC)-$(VER).tar.gz $(MANIFEST)

.PHONY: clean
