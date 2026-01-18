#!/bin/bash
NEW_HOST = "$1"
TARGET_URL = "$2"
FORM_DATA = "$3"

curl -X POST\
	-H "Host: ${NEW_HOST}"\
	--data "${FORM_DATA}"\
	"${TARGET_URL}"
