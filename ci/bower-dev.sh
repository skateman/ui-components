#!/bin/bash
set -x
HASH=$(git rev-parse HEAD)
./node_modules/webpack/bin/webpack.js -p
git add -f dist/css dist/js
git commit -m "Automatic dev build from ${HASH}"
git tag -f dev
set +x
git push -f https://$GITHUB_AUTH@github.com/ManageIQ/ui-components.git dev &> /dev/null
echo "git push origin HEAD:gh-pages"
