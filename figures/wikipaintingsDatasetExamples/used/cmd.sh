find . -depth 1 -name '*.jpg' -exec convert {} -resize 300 -crop 300x185 jpg:resized/{} \;
convert post_impressionism.jpg -resize 300 -crop 300x185 png:resized/post_impressionism.jpg
