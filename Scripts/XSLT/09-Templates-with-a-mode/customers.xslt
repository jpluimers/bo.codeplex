<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="customers">
		<xsl:apply-templates select="customer" mode="bold"/>
		<hr/>
		<xsl:apply-templates select="customer" mode="italic"/>
	</xsl:template>

	<xsl:template match="customer" mode="bold">
	    Bold: 
		<b>
			<xsl:value-of select="name"/>
		</b>
		<br/>
	</xsl:template>

	<xsl:template match="customer" mode="italic">
	    Italic:
		<i>
			<xsl:value-of select="name"/>
		</i>
		<br/>
	</xsl:template>

	<xsl:template match="customer">
	    Modeless:
			<xsl:value-of select="name"/>
		<br/>
	</xsl:template>

</xsl:stylesheet>
