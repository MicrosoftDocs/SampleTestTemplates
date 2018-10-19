import os
import compileall
import sys

path = '.'
total = 0
failed = 0

names = [name for name in  os.listdir(path) if name.endswith('.py')]

print (names)

for name in names:
    fullname = os.path.join(path, name)
    total += 1
    if not compileall.compile_file(fullname):
        failed += 1

print (total, failed)

sys.exit (0 if total > 0 and failed == 0 else 1)



