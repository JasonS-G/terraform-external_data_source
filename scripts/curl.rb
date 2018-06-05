#!/usr/bin/env ruby
require 'json'

query   = JSON.parse($stdin.read)
url     = query['url']

# Run cURL to dummy API
cresult = `curl -sk #{url} | tr -d '\n'`

# Filter
ret = {}
JSON.parse(cresult).each { |r| ret[r['username']] = r['company']['bs'].to_s }

# Setup response JSON
result  = JSON.generate(ret)

puts result
