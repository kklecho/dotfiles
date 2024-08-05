function img_bulk_thumbnail_current_folder() {
    mkdir _resized
    find . -maxdepth 1 -iname "*.png" | xargs -L1 -I{} convert -resize 30% "{}" _resized/"{}"
}
