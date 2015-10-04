mock ()
{
    root=$(git rev-parse --show-toplevel);
    if [ -d "$root" ]; then
        ( cd $root;
        make $* );
    else
        echo "mock: nothing to do";
    fi
}
