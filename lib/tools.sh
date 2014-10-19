function show.function {
   declare -f "$1"
}

function reset.known.hosts () {
  cat /dev/null > $HOME/.ssh/known_hosts
}

