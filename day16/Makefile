anim.gif: day16.bqn
	mkdir -p img
	time bqn $<
	parallel 'pnmtopng {} > {.}.png' ::: img/*.pnm
	gifski -r 50 -o $@ img/*.png

.PHONY: clean
clean:
	rm -rf img
	rm -f anim.gif
