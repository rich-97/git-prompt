<h1 align="center">Git prompt</h1>

<p align="center">
  <img src="prompt.gif">
</p>

## Installation:

Open the terminal and make dir named `.git-prompt`, inside clone the repository.

```shell
mkdir ~/.git-prompt
git clone https://github.com/rich-97/git-prompt ~/.git-prompt
```

After that, write the following lines in your `~/.bashrc`.

```shell
export GIT_PROMPT=~/.git-prompt/git-prompt
source $GIT_PROMPT/main.sh
```

And in your terminal sesion execute `source ~/.bashrc`.
