alias docker-kill="docker ps -aq | xargs docker stop"
alias docker-clean="docker ps -aq | xargs docker rm; docker volume prune -f; docker network prune -f"
alias docker-purge="docker images | grep '^<none>' | sed -e 's/ \\{1,\\}/ /g' | cut -d' ' -f 3 | xargs docker rmi"
alias docker-nuke="docker-kill; docker-clean; docker-purge"
