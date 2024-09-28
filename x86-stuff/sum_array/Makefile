# Makefile simplified from UiT INF-2200 course

CC = gcc # compiler

CFLAGS = -masm=att -Ofast -g

sum_array: main.c sum_array.S Makefile	
	$(CC) $(CFLAGS) -S -o main.s main.c                               # compile to assembly
	$(CC) $(CFLAGS) -E sum_array.S > sum_array_preprocessed.s       # preprocess the handwritten assembly file
	$(CC) $(CFLAGS) main.s sum_array_preprocessed.s -o $@                # assemble and link
	#
	# wildcards
	# $@ references the target sum_ar
	# $< references first argument main.c


clean:
	rm main.s
	rm sum_array_preprocessed.s
	rm sum_array
