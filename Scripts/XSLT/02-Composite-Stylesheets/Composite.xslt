<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/"> 
	  <html>
		 <head>
		<title>Customer Simplified StyleSheet demo</title>
		 </head>
		 <body>
		   <b><xsl:value-of select="/customers/customer/name" /></b>
		   <br/>
		   ID: <xsl:value-of select="/customers/customer/@id" />	  
		 </body>
	  </html>
	</xsl:template>  
</xsl:stylesheet>
