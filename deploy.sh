#!/bin/bash

function deployFromTo () {
	for f in $1; do
		if [[ -f "$f" ]]; then
			echo "${f}"
			curl --ftp-create-dirs -T ${f} -u $FTP_USER:$FTP_PASSWORD "ftp://s26.zenbox.pl/$2"
		fi
	done
}

deployFromTo "*" "domains/capitaltemplate.com/public_html/templates/burbon-snapshot/demo/"
deployFromTo "multipage/*" "domains/capitaltemplate.com/public_html/templates/burbon-snapshot/demo/multipage/"
deployFromTo "css/*" "domains/capitaltemplate.com/public_html/templates/burbon-snapshot/demo/css/"
deployFromTo "sass/*" "domains/capitaltemplate.com/public_html/templates/burbon-snapshot/demo/sass/"
deployFromTo "js/*" "domains/capitaltemplate.com/public_html/templates/burbon-snapshot/demo/js/"
