import xml.etree.ElementTree as x

c = 0

with open("wp_ebd_posted_data.csv") as f:
	for line in f:
		if len(line) > 30 :
			c += 1
			print "-----   %d %d" %(len(line), c)
			#print line
			r = x.fromstring(line)#.get('your-email')
			#print r.find('_wpcf7_unit_tag').text
			#print r.find('mc4wp-EMAIL').text
			#if r.find('mc4wp-EMAIL') :
			#	print r.find('mc4wp-EMAIL').text
			for e in r.iter() :
				if e.text is not None:
					print e.tag + " = "  + e.text.encode('utf-8') 
					#print e.text 
