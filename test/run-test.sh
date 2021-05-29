#!/bin/bash


function demo() {
    echo "$@"
    "$@"
}

function usage() {
    echo """
Usage: $0 [PARAM] 
  PARAM:
    - get-valid
    - get-invalid
    - post-valid
   
"""
}

case $1 in
    get-valid)
        demo http POST "http://localhost:8080" "Authorization:Bearer foo" 
    ;;
    get-invalid)
        demo http POST "http://localhost:8080" "Authorization:Bearer bar" 
    ;;
    post-valid)
        demo http POST "http://localhost:8080" "Authorization:Bearer foo" hello=world
    ;;
    *)
        usage
    ;;  

esac