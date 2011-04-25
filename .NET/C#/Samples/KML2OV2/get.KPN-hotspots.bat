rem https://portal.hotspotsvankpn.com/nl/1606-HotSpot_Locaties.html
wget --output-document=kpn-hotspots.txt.xml "http://misc.hotspotsvankpn.com/?page=locations" 
wget --output-document=kpn-hotspots.kml.xml "http://misc.hotspotsvankpn.com/?page=locations&output=KML" 
rem "http://addto.tomtom.com/api/home/v2/content?action=install&apikey=61e28980-bf57-4f9e-b7de-3a1a6e706908&uri=http%3A%2F%2Fwww.tomtom.com%2Faddto%2Ffiles%2F58667.xml"
rem decoded:
rem "http://www.tomtom.com/addto/files/58667.xml
rem "http://www.tomtom.com/addto/files/58667.zip
rem "http://www.tomtom.com/addto/files/58667.bmp
wget --output-document=58667.xml "http://www.tomtom.com/addto/files/58667.xml
wget --output-document=58667.zip "http://www.tomtom.com/addto/files/58667.zip
wget --output-document=58667.bmp "http://www.tomtom.com/addto/files/58667.bmp
