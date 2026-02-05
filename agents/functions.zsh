function fn_agr() {
  fn_rebuild_gemini_files
  ( 
    cd ~/prj/prjnow
  #  rsync -av GEMINI.andy.md a@aiag-mini-kkl:~/.gemini/GEMINI.md
    rsync -av --copy-links .aiag-profiles/GEMINI-andy.md a@aiag-std-kkl:~/.gemini/GEMINI.md
    rsync -av --copy-links .aiag-profiles/GEMINI-bobby.md b@aiag-std-kkl:~/.gemini/GEMINI.md
  ) 


}

function fn_rebuild_gemini_files() {
  (
  cd ~/prj/prjnow/.aiag-profiles
  rm GEMINI-andy.md 2>/dev/null
  cat agent-profile-andy.md >> GEMINI-andy.md
  cat agent-project.md >> GEMINI-andy.md
  echo "" >> GEMINI-andy.md
  echo "## Task" >> GEMINI-andy.md
  head -1 ../todo-queue-andy.txt >> GEMINI-andy.md

  rm GEMINI-bobby.md 2>/dev/null
  cat agent-profile-bobby.md >> GEMINI-bobby.md
  cat agent-project.md >> GEMINI-bobby.md
  echo "" >> GEMINI-bobby.md
  echo "## Task" >> GEMINI-bobby.md
  head -1 ../todo-queue-bobby.txt >> GEMINI-bobby.md
 ) 
}
