<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Customer Simplified StyleSheet demo</title>
			</head>
			<body>
				<h1>
					<xsl:value-of select="/customers/customer/name"/>
				</h1>
				<p>
					<br/>
	  ID: <b>
						<xsl:value-of select="/customers/customer/@id"/>
					</b>
				</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
