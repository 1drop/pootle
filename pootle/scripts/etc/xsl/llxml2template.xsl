<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<xsl:output method='xml'
		version='1.0'
		encoding='UTF-8'
		indent='no' />

	<xsl:template match="/T3locallang">
		<xliff version="1.0">
			<file source-language="EN" datatype="plaintext" original="messages" date="{$date}" product-name="{$extension}">
				<header/>
				<body>
					<xsl:apply-templates select="data[@type='array']/languageKey[@index='default']/label" />
				</body>
			</file>
		</xliff>
	</xsl:template>

	<xsl:template match="label">
		<xsl:variable name="index" select="@index"/>
		<trans-unit id="{@index}">
			<source><xsl:value-of select="." /></source>
		</trans-unit>
	</xsl:template>

</xsl:stylesheet>
