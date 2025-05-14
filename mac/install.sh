if [ $(which goku) == "goku no found" ]; then
    echo "install goku and re-run this script"
    open https://github.com/yqrashawn/GokuRakuJoudo
    exit
fi

cp karabiner.edn "$HOME"/.config
rm -rf "$HOME"/.config/keyput-methoard-scripts
cp -r keyput-methoard-scripts "$HOME"/.config
chmod +x "$HOME"/.config/keyput-methoard-scripts/*

goku
