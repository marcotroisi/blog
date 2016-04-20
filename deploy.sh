#!/bin/bash

echo "*** Hugo... ***"
hugo

echo "*** Git add & commit ***"
git add -A
git commit -m "Updating site" && git push origin master

echo "*** Push Public folder to GitHub Pages ***"
git subtree push --prefix=public https://github.com/marcotroisi/blog.git gh-pages

echo "*** DONE! ***"
