find . -depth 1 -name '*.jpg' -exec convert {} -resize 300x185! jpg:resized/{} \;
