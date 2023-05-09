function libfromtemplate() {
    # Create new repo based on minlib
    # Usage: newminlib <repo_name>

    new_repo_name=$1
    new_repo_path=$2
    template_lib_name=$3

    new_repo_path=$HOME/repos/$new_repo_name
    
    if [ -z "$GH_USER" ]; then
        echo "GH_USER not set"
        echo "set GH_USER in your environment"
        echo "e.g. export GH_USER=kklecho"
        return 1
    fi

    template_repo=git@github.com:$GH_USER/$template_lib_name.git

    ghfromtemplate $template_repo $new_repo_path

    if ! [ -d "$new_repo_path" ]; then
        echo "Repo $new_repo_path not found"
        return 1
    fi

    return 0
}

function minilib() {
    # Create new repo based on minlib
    # Usage: newminlib <repo_name>

    new_repo_name=$1
    new_repo_path=$HOME/repos/$new_repo_name
    template=minlibxx
    
    libfromtemplate $new_repo_name $new_repo_path $template
    
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



function millib() {
    # Create new repo based on minlib
    # Usage: newminlib <repo_name>

    new_repo_name=$1
    new_repo_path=$HOME/repos/$new_repo_name
    template=mililibxx
    
    libfromtemplate $new_repo_name $new_repo_path $template
    
    mv $new_repo_path/mililibxx.py $new_repo_path/$new_repo_name.py
    mv $new_repo_path/test_mililibxx.py $new_repo_path/test_$new_repo_name.py
    sed -i "s/mililibxx/$new_repo_name/g" $new_repo_path/$new_repo_name.py
    sed -i "s/mililibxx/$new_repo_name/g" $new_repo_path/test_$new_repo_name.py
    sed -i "s/mililibxx/$new_repo_name/g" $new_repo_path/README.md
    sed -i "s/mililibxx/$new_repo_name/g" $new_repo_path/pyproject.toml

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


function csv2sqlite() {
    csvpath=$1
    csvname=$(basename -- "$csvpath")
    csvname="${csvname%.*}"
    cwd_name=$(basename -- "$PWD")
    dbname=$cwd_name.db

    if [ -z "$csvpath" ]; then
        echo "Usage: qcsv <csvpath>"
        return 1
    fi

    if ! [ -f "$csvpath" ]; then
        echo "File $csvpath not found"
        return 1
    fi

    # create new sqlite db and import csv
    if [ -f "$dbname" ]; then
        echo "File $dbname already exists"
    else
        echo "Creating $dbname"
        echo ".mode csv\n.import $csvpath $csvname" | sqlite3 $dbname
    fi

    # create sql file for further queries

    sqlfile=$csvname.sql

    if [ -f "$sqlfile" ]; then
        echo "File $sqlfile already exists"
    else
        echo "-- $PWD/$dbname" > $sqlfile
    fi

    # open sqlite db in sqlitebrowser
    (sqlitebrowser $dbname) &
    e $sqlfile

    # {
    # "previewLimit": 50,
    # "driver": "SQLite",
    # "database": "/home/kkl/scratch/py/py.db",
    # "name": "py.db"
    # }        
}
