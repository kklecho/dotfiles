function fromminlib() {
    # Create new repo based on minlib
    # Usage: newminlib <repo_name>

    new_repo_name=$1
    new_repo_path=$HOME/repos/$new_repo_name
    
    if [ -z "$GH_USER" ]; then
        echo "GH_USER not set"
        echo "set GH_USER in your environment"
        echo "e.g. export GH_USER=kklecho"
        return 1
    fi

    template_repo=git@github.com:$GH_USER/minlibxx.git

    ghfromtemplate $template_repo $new_repo_path

    if ! [ -d "$new_repo_path" ]; then
        echo "Repo $new_repo_path not found"
        return 1
    fi
    
    mv $new_repo_path/minlibxx.py $new_repo_path/$new_repo_name.py
    mv $new_repo_path/test_minlibxx.py $new_repo_path/test_$new_repo_name.py
    sed -i "s/minlibxx/$new_repo_name/g" $new_repo_path/$new_repo_name.py
    sed -i "s/minlibxx/$new_repo_name/g" $new_repo_path/test_$new_repo_name.py
    sed -i "s/minlibxx/$new_repo_name/g" $new_repo_path/README.md
    sed -i "s/minlibxx/$new_repo_name/g" $new_repo_path/pyproject.toml

    (
        cd $new_repo_path && \
        git add . && \
        git commit -m "Initial commit" && \
        git push
    )

    return 0
}


function minlibit() {
    file=$1
    test_file=$2
    lib_name=$3

    if [ ! -f "$file" ] || [ ! -f "$test_file" ]  || [ -z "$lib_name" ]; then
        echo "Usage: minlibit file test_file lib_name"

        echo "file: $file"
        echo "test_file: $test_file"
        echo "lib_name: $lib_name"
        return 1
    fi

    lib_repo_path=$HOME/repos/$lib_name

    fromminlib $lib_name

    if ! [ -d "$lib_repo_path" ]; then
        echo "Repo $lib_repo_path not found"
        return 1
    fi

    cp $file $lib_repo_path
    mv $file $file.bak

    cp $test_file $lib_repo_path
    mv $test_file $test_file.bak

    echo "copied $file to $lib_repo_path and renamed to $file.bak"
    echo "copied $test_file to $lib_repo_path and renamed to $test_file.bak"

    (e $lib_repo_path)

    return 1
}
