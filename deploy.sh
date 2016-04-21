#!/bin/bash

echo "*** Hugo... ***"
hugo

echo "*** Git add & commit ***"
git add -A
git commit -m "Updating Site" && git push origin master

mkdir public/feed/
cp public/index.xml public/feed/ 

echo "*** Push Public folder to GitHub Pages ***"
git subtree push --prefix=public https://github.com/marcotroisi/blog.git gh-pages

echo "*** DONE! ***"
