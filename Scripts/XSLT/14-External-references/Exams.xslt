<?xml version="1.0" encoding="UTF-8" ?>

<!-- Niet vergeten om de 'examxml' parameter te zetten, in code of in het XSL/XQuery menu in XmlSpy -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" />
<!--
  <xsl:param name="examxml" select="'ExamDescriptions.xml'"></xsl:param>
  -->
  <xsl:param name="examxml" select="'ExamDescriptions.xml'"/>
  <xsl:variable name="lookupTable" select="document($examxml)"/>

  <xsl:template match="/">
 	  <xsl:for-each select="/Exams/Exam">
	    <xsl:variable name="CurrentCode" select="."/>
        <xsl:variable name="CurrentExam" select="$lookupTable/Exams/Exam[ @Code = $CurrentCode ]"/>
        <xsl:value-of select="$CurrentCode"/> -  <xsl:value-of select="$CurrentExam/Name"/><br/><br/>
        <xsl:text>			--EOL-- 
</xsl:text>
	  </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet>

  