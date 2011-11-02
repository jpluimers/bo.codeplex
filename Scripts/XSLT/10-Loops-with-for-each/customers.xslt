<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/customers">
	<h1>Customers in XML file:</h1>
	<xsl:for-each select="customer">
	 <xsl:sort select="name" order="ascending" />
	  <b><xsl:value-of select="name" /></b><br/>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>