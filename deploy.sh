#!/bin/bash

echo "*** Hugo... ***"
docker run -v `pwd`:/website  marcotroisi/hugo:0.17

echo "RSS in /feed"
mkdir public/feed/
cp public/index.xml public/feed/

echo "/tag folder"
mkdir public/tag
cp -r public/tags/* public/tag/

echo "/category folder"
mkdir public/category
cp -r public/categories/* public/category/

echo "*** Push Public folder to GitHub Pages (in the /docs folder) ***"
cp -r public/* docs/


echo "*** Git add & commit ***"
git add -A
git commit -m "Updating Site"
git push origin master

# echo "*** Push Public folder to GitHub Pages ***"
# git push origin :gh-pages
# if [[ $GH_TOKEN ]]; then
# 	git subtree push --prefix=public https://$GH_TOKEN@github.com/marcotroisi/blog.git gh-pages > /dev/null 2>&1
# else
# 	git subtree push --prefix=public https://github.com/marcotroisi/blog.git gh-pages
# fi

echo "*** DONE! ***"
