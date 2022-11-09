#!/bin/bash

# Sub dirs to create in the assignment dir
sub_dirs=(
    images
    traces
    diragrams
)

# Check for assignment number
if [ -z $1 ]
then
    printf "No assigment number given\n"
    exit 1
fi

assignment_number=$1
assignment_dir=assignment-${assignment_number}

# Check if assignment dir already exists
if [ -d ${assignment_dir} ]
then
    printf "${assignment_dir} already exists\n"
    exit 2
fi

# setup assigment dir
mkdir ${assignment_dir} &> /dev/null
pushd ${assignment_dir} &> /dev/null

for dir in ${sub_dirs[*]}
do
    mkdir ${dir}
    touch ${dir}/placeholder
done

touch report.tex

popd &> /dev/null

printf "${assignment_dir} setup complete!\n"
