alias gitdiff="git branch -vv | cut -c 3- | awk '$3 !~/\\[/ { print $1 }'"
alias gogit='cd ~/github/'
alias mygit='cd ~/github/iconify/'

# Add, commit, set-upstream, and push local branch
function gitme() {
    if [ -z "$1" ]
    then
        echo "You must enter a git commit message"
    else
        git status
        echo "Adding new files to track"
        git add *
        echo "commit -a -m \"$1\""
        git commit -a -m "$1"
        echo "Set the upstream branch to track if none exists"
        gitsetupstream
        echo "Push the updates to the remote origin"
        git push
    fi
}

# Set the upstream for a local branch if it does not exist
function gitsetupstream {
    BRANCHNAME=`git rev-parse --abbrev-ref HEAD`
    if [[ $(git branch -r | grep -w "$BRANCHNAME" | wc -c) -ne 0 ]]; then
		echo "Branch $BRANCHNAME already has an upstream"
	else
		echo "Setting upstream for branch $BRANCHNAME"
		git push --set-upstream origin "$BRANCHNAME"
	fi
}

function gitall() {
    if [ -z "$1" ]
    then
        echo "You have to enter a git commit message"
    else
        git status
        git add *
        echo "commit -a -m \"$1\""
        git commit -a -m "$1"
        git push --all --recurse-submodules=on-demand -u
        # git push
    fi
}
