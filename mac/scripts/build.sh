rm -rf ".build"

swift build -c 'release'

rm -rf "../keyput-methoard-scripts"

mkdir "../keyput-methoard-scripts"

cp .build/arm64-apple-macosx/release/move-mouse-to-last-screen ../keyput-methoard-scripts
cp .build/arm64-apple-macosx/release/move-mouse-to-next-screen ../keyput-methoard-scripts
cp .build/arm64-apple-macosx/release/move-app ../keyput-methoard-scripts
