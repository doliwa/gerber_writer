#sphinx-build: the following arguments are required: sourcedir, outputdir, filenames
SPHINXBUILD=sphinx-build
SOURCEDIR=doc
BUILDDIR=build/docs

# change to project directory. -- return to current dir after execution of this script.
while true ; do
	if [[ $PWD = "/" ]]; then
		echo "we could not find the project directory gerber_writer_project"
		exit 
	fi
#    echo "base=$(basename $PWD) on path $PWD"
    if [[ "$(basename $PWD)" =~ "gerber_writer" ]]; then
        break
    fi
    cd ..
done


if [ -z "$1" ]
then
  echo -e "\n!!! argument missing. probably you want './make.sh html'\n"  
  $SPHINXBUILD -M help $SOURCEDIR $BUILDDIR $SPHINXOPTS $0
else
  echo -e "\nwe will create the gerber-writer/build/docs directory for you\n"
  $SPHINXBUILD -M $1 $SOURCEDIR $BUILDDIR $SPHINXOPTS $O
fi

