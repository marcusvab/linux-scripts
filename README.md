for dir in */; do rar a -r "${dir%/}.rar" "$dir"; done
