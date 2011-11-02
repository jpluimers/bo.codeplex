<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/customers">
  <xsl:variable name="custname" select="'Acme Coorporation'"/>	
  <h1>Customer name=<xsl:value-of select="$custname" /></h1>
	<xsl:for-each select="customer[name=$custname]">
	  Name: <b><xsl:value-of select="name" /></b><br/>	  
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
