import os
import sys

def fos(command, p1, p2=None):
  ls1 = ["~/.config/nvim", "~/.local/share/nvim", "~/.cache/nvim"]
  ls2 = ls1
  if p2 is None:
    ls2 = ["", "", ""]
    p2 = ""
  for i in range(3):
    cmd = f"{command} {ls1[i]+p1} {ls2[i]+p2}"
    os.system(cmd)
    print(cmd)

options = ["backup_mine", "backup_chad", "remove_current", "to_mine", "to_chad"]
if len(sys.argv) == 1:
  key = input("Options: " + "".join([f"\n  {i}. {x}" for i, x in enumerate(options)]) + "\n:")
  print(key)
  command = options[int(key)]
else:
  command = sys.argv[1]

if command == "backup_mine":
  print(command)
  fos("rm -rf", "_mine")
  fos("cp -r", "", "_mine")
elif command == "backup_chad":
  print(command)
  fos("rm -rf", "_chad")
  fos("cp -r", "", "_chad")
elif command == "remove_current":
  print(command)
  fos("rm -rf", "")
elif command == "to_mine":
  print(command)
  fos("rm -rf", "")
  fos("cp -r", "_mine", "")
  os.system("ln -sf ~/.vim/init.vim ~/.config/nvim/init.vim")
elif command == "to_chad":
  print(command)
  fos("rm -rf", "")
  fos("cp -r", "_chad", "")

