<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/" >
	<html>
	  <body>
	    <xsl:apply-templates select="products/product" />
	    <br/>
		Number of products: 
		<xsl:value-of select="count(//product/price)" /> <br/>
		Sum of all prices of all products: 
		<xsl:value-of select="sum(//product/price)" /> </body>
	</html>
</xsl:template>

<xsl:template match="product">
  <xsl:value-of select="text()" />
  <br/>
  <xsl:value-of select="price" />
  <br/>
</xsl:template>
  
</xsl:stylesheet >
