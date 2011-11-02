<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/customers">
	<h1>Customers with name having 'C' as second character:</h1>
	<xsl:for-each select="customer[substring(name,2,1) = 'C']">
	 <xsl:sort select="name" order="ascending" />
	  Name: <b><xsl:value-of select="name" /></b><br/>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
