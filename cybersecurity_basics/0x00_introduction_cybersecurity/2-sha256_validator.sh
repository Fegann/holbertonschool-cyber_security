#!/bin/bash
echo "$2  $1" > /tmp/expected_hash.sha256
sha256sum -c /tmp/expected_hash.sha256
