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

# Based on http://stackoverflow.com/questions/677436/how-to-get-the-git-commit-count
count_git_commit () {
  local count=$(git rev-list --count HEAD 2> /dev/null)

  if [[ $count ]]; then
    git_commits="$count"
  else
    git_commits="None"
  fi
}

make_git_prompt () {
  if [[ -d .git || $(git status --porcelain 2> /dev/null) != "" ]]; then
    export PS1='\[$user_color\]${debian_chroot:+($debian_chroot)}\u\[$txtrst\]:\[$dirs_color\]\w\[$txtwht\](\[$branch_color\]$git_branch\[$txtwht\]|\[$commit_color\]$git_commit\[$txtwht\]\[$txtwht\]|\[$commit_color\]$git_commits\[$txtwht\])\[$changes_color\]$git_changes\[$txtwht\]\$ '
  else
    export PS1='\[$user_color\]${debian_chroot:+($debian_chroot)}\u\[$txtwht\]:\[$dirs_color\]\w\[$txtwht\]\$ '
  fi
}

PROMPT_COMMAND="find_git_branch; find_git_commit; make_git_prompt; find_git_changes; count_git_commit; $PROMPT_COMMAND"

