#!/bin/bash


function demo() {
    echo "$@"
    "$@"
}

function usage() {
    echo """
Usage: $0 [PARAM] 
  PARAM:
 
   
"""
}

case $1 in
    no-auth)
        demo http GET "http://localhost:8080/get"  

        
    ;;
    guest-auth)
        export GUEST_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiZ3Vlc3QiLCJzdWIiOiJZV3hwWTJVPSIsIm5iZiI6MTUxNDg1MTEzOSwiZXhwIjoxNjQxMDgxNTM5fQ.K5DnnbbIOspRbpCr2IKXE9cPVatGOCBrBQobQmBmaeU"
        demo http GET "http://localhost:8080/get" "Authorization:Bearer ${GUEST_TOKEN}" 
    ;;
    admin-auth)
        export ADMIN_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW4iLCJzdWIiOiJZbTlpIiwibmJmIjoxNTE0ODUxMTM5LCJleHAiOjE2NDEwODE1Mzl9.WCxNAveAVAdRCmkpIObOTaSd0AJRECY2Ch2Qdic3kU8"
        demo http GET "http://localhost:8080/get" "Authorization:Bearer ${ADMIN_TOKEN}" 
    ;;
    admin-auth-post)
        export ADMIN_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW4iLCJzdWIiOiJZbTlpIiwibmJmIjoxNTE0ODUxMTM5LCJleHAiOjE2NDEwODE1Mzl9.WCxNAveAVAdRCmkpIObOTaSd0AJRECY2Ch2Qdic3kU8"
        demo http POST "http://localhost:8080/post" "Authorization:Bearer ${ADMIN_TOKEN}" firstname=bob
    ;;
    *)
        usage
    ;;  

esac