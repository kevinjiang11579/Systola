f = open("input.out", "a")
count = 0
for i in range(0, 32768):
	f.write(str(count));
	f.write('\n')
	count += 1
	if count == 256:
		count = 0
f.close()

