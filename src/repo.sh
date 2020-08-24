#!/usr/bin/env bash



export REPO_USAGE="
    -------------------------
    Usage:
      repo my_repo
    -------------------------
"

function repo() {

    REPO_NAME=${PWD##*/}

    if [ -d ".git" ] ; then
        echo "---------------------------------------------"
        echo $SORRY_DAVE
        echo "The current directory is already a git repo"
        echo "---------------------------------------------"
    else
        echo "Creating remote repository on Github"
        SCRIPT="curl -u ${GIT_USER}:${GIT_TOKEN} https://api.github.com/user/repos -d '{\"name\":\"${REPO_NAME}\"}'"
        echo $SCRIPT
        OUTPUT=$(eval $SCRIPT)
        echo "-------------------------"

        # echo "$OUTPUT"

        IT_FAILED="creation failed"
        if grep -q "$IT_FAILED" <<< "$OUTPUT" ; then
            if grep -q "name already exists" <<< "$OUTPUT" ; then
                echo "--------------------------------------------------"
                echo $SORRY_DAVE
                echo "A repo named $REPO_NAME already exists in Github"
                echo "--------------------------------------------------"
            else
                echo "GIT response : ${OUTPUT}"
            fi
        else
            echo "Hmm. How did we get here?"
            echo "Creating README.md"
            touch README.md
            echo "# ${REPO_NAME}" > README.md
            echo "-------------------------"

            echo "Intialize git repo"
            git init
            echo "-------------------------"

            echo "Adding README to repo"
            git add README.md
            echo "-------------------------"

            echo "Performing first commit"
            git commit -m "First Commit"
            echo "-------------------------"

            echo "Add remote origin git@github.com:${GIT_USER}/${REPO_NAME}.git"
            git remote add origin git@github.com:${GIT_USER}/${REPO_NAME}.git
            git branch --set-upstream-to=origin/master master
            echo "-------------------------"

            echo "Trying to push to origin"
            git push -u origin master
        fi
    fi
}
