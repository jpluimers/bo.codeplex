<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/customers/customer">
		<clients>
			<client>
				<name>
					<xsl:value-of select="name"/>
				</name>
				<id>
					<xsl:value-of select="@id"/>
				</id>
			</client>
		</clients>
	</xsl:template>
</xsl:stylesheet>
