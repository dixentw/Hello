
import sys
import json
import datetime
import http.client
import re

headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}

count = 0
for line in sys.stdin :
	if line : 
		obj = json.loads(line.strip())
		#match = re.search("^[0-9]+$", obj['time_local'])
		#if not match :
		push = 1;
		#push = 1;
		#result = datetime.datetime.strptime(obj['time_local'], "%d/%b/%Y:%H:%M:%S %z")
		#else :
		#	result = datetime.datetime.fromtimestamp(int(obj['time_local']))
		#obj['time_local'] = result.strftime("%Y-%m-%dT%H:%M:%S")
		extracted = re.search(".*\s(.*)\s.*", obj['request'])
		obj['request-nxguri'] = obj['host'] + extracted.group(1)
		if push == 0:
			print(json.dumps(obj))
			#print(obj['request'])
			#print(obj['host'] + extracted.group(1))
		lala = json.dumps(obj)
		if push == 1 :
			fluentd = http.client.HTTPConnection("localhost", 8080)
			fluentd.connect()
			fluentd.request('POST', '/td.access.log1', lala, headers)
			response = fluentd.getresponse()
			if response.status != 200 : 
				print(response.status)
			print(count)
		count = count + 1
