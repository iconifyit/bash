alias dev='cd ~/github/iconfinder/iconfinderbox2/'
alias nextfinder='cd ~/github/iconfinder/nextfinder/'
alias iconfinderbox='cd ~/github/iconfinder/iconfinderbox2/'

function ibox() {
    echo "Switching to iconfinderbox2"
    cd ~/github/iconfinder/iconfinderbox2/
    echo "Launching Vagrant VM"
    vagrant up
}

function nextf {
    cd ~/github/iconfinder/nextfinder/
    git branch
    git status
}

NF_TEST_DIR="/tmp/nf-tests"

function setup_tmp {
    rm -Rf "$NF_TEST_DIR"
    mkdir "$NF_TEST_DIR"
}

function teardown_tmp {
    rm -Rf "$NF_TEST_DIR"
}

function path_to_ref() {
	echo $1 > "$NF_TEST_DIR/x2"
	sed s:^\./::g "$NF_TEST_DIR/x2" > "$NF_TEST_DIR/y2"
	sed s:.py::g "$NF_TEST_DIR/y2" > "$NF_TEST_DIR/x2"
	sed s:/:.:g "$NF_TEST_DIR/x2" > "$NF_TEST_DIR/y2"
	cat "$NF_TEST_DIR/y2"
}

function path_list_to_refs() {
	if [ -z "$1" ]
    then
        echo "An input file is required"
    fi
    if [ -z "$2" ]
    then
        echo "Output file is required"
    fi
    
	while read -r line; do
		path_to_ref "$line" >> $2
	done < $1
}

function list_tests {
	setup_tmp
    folders=( logic presentation )
	ag -g ".*/tests/test_.*\.py" > "$NF_TEST_DIR/x"
	while read f; do
	    f=`path_to_ref "$f"`
	    for dir in "${folders[@]}"; do
		    len=${#dir}
		    echo $f $len | awk '{print substr($1,0,$2)}' > "$NF_TEST_DIR/y"
			test=`cat "$NF_TEST_DIR/y"`
			if [ "$test" = "$dir" ]; then
				echo $f | awk '{print "nextfinder test " $0 " --noinput"}' >> "$NF_TEST_DIR/z"
			fi
		done
	done < "$NF_TEST_DIR/x"
	cat "$NF_TEST_DIR/z" > ~/nf-tests 
	teardown_tmp
	cat ~/nf-tests
}

function list_test_funcs {

	setup_tmp
	
    cd ~/github/iconfinder/nextfinder/
    
    grep -R "def test_" --include "test_*.py" ./logic >> "$NF_TEST_DIR/x"
    grep -R "def test_" --include "test_*.py" ./presentation >> "$NF_TEST_DIR/x"
    
    sed 's/.py:    def test_/ - test_/g' "$NF_TEST_DIR/x" > "$NF_TEST_DIR/y"
    sed 's/(self)://g' "$NF_TEST_DIR/y" > "$NF_TEST_DIR/x"
    
    path_list_to_refs "$NF_TEST_DIR/x" ~/nf-test-funcs
    
    teardown_tmp
    
    cat ~/nf-test-funcs
}

function list_test_cases {

	setup_tmp
	
    cd ~/github/iconfinder/nextfinder/
    
    grep -R "class .*TestCase" --include "test_*.py" ./logic >> "$NF_TEST_DIR/x"
    grep -R "class .*TestCase" --include "test_*.py" ./presentation >> "$NF_TEST_DIR/x"
    
    sed 's/\.py:class /./g' "$NF_TEST_DIR/x" > "$NF_TEST_DIR/y"
    sed 's/(.*)://g' "$NF_TEST_DIR/y" > "$NF_TEST_DIR/x"
    
    path_list_to_refs "$NF_TEST_DIR/x" ~/nf-test-cases
	
	teardown_tmp
	
	cat ~/nf-test-cases
}