all:
	echo 'Provide a target: pow clean'

minify:
	curl -X POST -s --data-urlencode 'input@static/s/js/app.js' https://javascript-minifier.com/raw > static/s/js/app.min.js
	curl -X POST -s --data-urlencode 'input@static/s/js/ie10.js' https://javascript-minifier.com/raw > static/s/js/ie10.min.js
	curl -X POST -s --data-urlencode 'input@static/s/css/styles.css' https://cssminifier.com/raw > static/s/css/styles.min.css

vendor:
	gb vendor fetch github.com/boltdb/bolt

fmt:
	find src/ -name '*.go' -exec go fmt {} ';'

build: fmt
	gb build all

start: build
	./bin/pow

test:
	gb test -v

clean:
	rm -rf bin/ pkg/

.PHONY: pow
