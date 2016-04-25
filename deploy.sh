#!/bin/bash

echo "*** Hugo... ***"
hugo

echo "RSS in /feed"
mkdir public/feed/
cp public/index.xml public/feed/

echo "/tag folder"
mkdir public/tag
cp -r public/tags/* public/tag/

echo "*** Git add & commit ***"
git add -A
git commit -m "Updating Site"
# git push origin master

echo "*** Push Public folder to GitHub Pages ***"
# git subtree push --prefix=public https://github.com/marcotroisi/blog.git gh-pages

echo "*** DONE! ***"
