<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/customers">
    <html>
      <body>
        <xsl:apply-templates select="customer" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="customer">
    ID: <xsl:value-of select="@id" /> 
    Name: <xsl:value-of select="name" /> 
    <hr />
  </xsl:template>

</xsl:stylesheet >