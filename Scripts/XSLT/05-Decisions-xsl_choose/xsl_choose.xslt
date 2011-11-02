<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/customers">
		<html>
			<body>
				<xsl:apply-templates select="customer"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="customer">
      ID: <xsl:value-of select="@id"/>
      <br/>
      Name: 
	  <xsl:choose>
		 <xsl:when test="name='Acme Coorporation'">
		   <b><xsl:value-of select="name"/></b>
		 </xsl:when>
		 <xsl:when test="name='ACME'">
		   <i><xsl:value-of select="name"/></i>
		 </xsl:when>
		 <xsl:otherwise>
		    <xsl:value-of select="name"/>
		 </xsl:otherwise>
	  </xsl:choose>
	  <hr/>
	</xsl:template>
	
</xsl:stylesheet>
