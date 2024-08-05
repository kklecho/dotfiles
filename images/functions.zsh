function img_bulk_thumbnail_current_folder() {
    # Usage img_bulk_thumbnail_current_folder '*.jpg" - remember the quotes
    name_glob_mask=${1:-'*.png'}
    mkdir _resized
    find . -maxdepth 1 -iname $name_glob_mask | xargs -L1 -I{} convert -resize 30% "{}" _resized/"{}"
}
