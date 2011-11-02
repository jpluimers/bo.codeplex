<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:template match="/customers/customer">
    Customer "<xsl:value-of select="name"/>"
    at index <xsl:value-of select="@id"/>
  </xsl:template>
</xsl:stylesheet>