# Based on gnzh

setopt prompt_subst

() {

local PR_USER PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{152}%n%f'
  PR_PROMPT='%F{152}%B$ %f%b'
else # root
  PR_USER='%F{144}%n%f'
  PR_PROMPT='%F{144}%B# %f%b'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{144}%M%f' # SSH
else
  PR_HOST='%F{152}%m%f' # no SSH
fi


local return_code="%(?..%F{174}%? ↵%f)"

local user_host="%B${PR_USER}·${PR_HOST}%b"
local current_dir="%B%~%b"
local git_branch='$(git_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)' 

PROMPT="%F{151}╭─%f${venv_prompt}(%f${user_host}%F{151})-[%f${current_dir}%F{151}]%f \$(ruby_prompt_info) ${git_branch}
%F{151}╰─%f$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"
ZSH_THEME_VIRTUALENV_PREFIX="%F{red}("
ZSH_THEME_VIRTUALENV_SUFFIX=")%f "

}
