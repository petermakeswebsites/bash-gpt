# Bash GPT

Really simple script where you describe a Mac OS terminal command you want. You need to an OpenAI developer key. By default it uses gpt 3.5 but you can change it to 4 by changing the model in the script.

## Setup

Add your environment variable to whatever terminal you use, probably `~/.zshrc` or 

```bash
export BASH_GPT=sk-abcdefg...
```

1. Make the Script Executable: First, you should make sure the script is executable. This is done using the chmod command.

```bash
chmod +x ai.sh
```

2. Move the Script to a Directory in Your PATH: Then, you need to move the script to a directory that's included in your system's PATH. Common directories for this purpose are `/usr/local/bin` or `~/bin` (if it exists and is in your PATH).

```bash
sudo mv scriptname.sh /usr/local/bin/
```

You probably can do some kind of symlink.

Note this has the potential to be very dangerous so use it at your own risk!