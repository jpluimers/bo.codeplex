<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="customers">
	<xsl:call-template name="header" />
</xsl:template>

<xsl:template name="header">
  <h1>List of customers</h1>
</xsl:template>

</xsl:stylesheet>