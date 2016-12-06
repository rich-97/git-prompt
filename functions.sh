find_git_branch () {
  local branch

  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="$branch"
  else
    git_branch="None"
  fi
}

find_git_commit () {
  local commit

  if commit=$(git rev-parse --verify --short HEAD 2> /dev/null); then
    git_commit="$commit"
  else
    git_commit="None"
  fi
}

find_git_changes () {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_changes="!"
  else
    git_changes=""
  fi
}

make_git_prompt () {
  if [ -d .git ]; then
    export PS1='\[$user_color\]${debian_chroot:+($debian_chroot)}\u\[$txtrst\]:\[$dirs_color\]\w\[$txtwht\](\[$branch_color\]$git_branch\[$txtwht\]|\[$commit_color\]$git_commit\[$txtwht\])\[$changes_color\]$git_changes\[$txtrst\]\$ '
  else
    export PS1='\[$user_color\]${debian_chroot:+($debian_chroot)}\u\[$txtwht\]:\[$dirs_color\]\w\[$txtwht\]\$ '
  fi
}

PROMPT_COMMAND="find_git_branch; find_git_commit; make_git_prompt; find_git_changes; $PROMPT_COMMAND"

