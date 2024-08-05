
function video_to_first_frame(){
    input_file_path=$1
    output_file_path_png=$2

    ffmpeg -i $input_file_path -vf "select=eq(n\,34)" -vframes 1 $output_file_path_png
}

