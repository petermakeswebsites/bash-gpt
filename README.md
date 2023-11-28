# Bash GPT

Really simple script where you describe a Mac OS terminal command you want. I made this because I kept having to do batch image transformations every month or so and kept having to re-learn all the arguments.

## Setup

You need to an OpenAI developer key. By default it uses gpt 3.5 but you can change it to 4 by changing the model in the script.

Add your environment variable to whatever terminal you use, probably `~/.zshrc` or 

```bash
export BASH_GPT=sk-abcdefg...
```

1. Make the Script Executable: First, you should make sure the script is executable. This is done using the chmod command.

```bash
# from bash-gpt directory
chmod +x ai.sh
```

2. Move the Script to a Directory in Your PATH: Then, you need to move the script to a directory that's included in your system's PATH. Common directories for this purpose are `/usr/local/bin` or `~/bin` (if it exists and is in your PATH).

```bash
# from bash-gpt directory
sudo cp ai.sh /usr/local/bin/ai
```

Note you can replace `ai` at the end with whatever you want to call it.

You probably can do some kind of symlink to the repo instead though

```bash
# from bash-gpt directory
sudo ln -s $PWD/ai.sh /usr/local/bin/ai
```

## Usage

After installing, just do `ai` and write your prompt like `delete my entire filesystem`. You will be prompt

## Disclaimer

I'm not responsible if you delete your whole computer.