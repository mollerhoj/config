function git_prompt
  set -l color blue

  if git_untracked
    set color cyan
  end

  if git_dirty
    set color green
  end

  if git_staged
    set color yellow
  end

  set_color blue -b $color
  echo -n " "
  set_color black -b $color
  echo -n (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /')
  set_color $color -b normal
  echo -n " "
  set_color black -b blue
end

function git_untracked
  set -l result 1
  if command git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- :/ >/dev/null 2>&1
    set result $status
  end
  return $result
end

function git_dirty
  not command git diff --no-ext-diff --quiet --exit-code 2>/dev/null
  return $status
end

function git_staged
  not command git diff-index --cached --quiet HEAD -- 2>/dev/null
  return $status
end
