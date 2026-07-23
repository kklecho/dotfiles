function fn_yt2mp3() {
  yt-dlp --extract-audio --audio-format mp3 $1
}

