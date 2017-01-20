<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  
  <xsl:output method='xml' 
    version='1.0' 
    encoding='UTF-8' 
    indent='yes' />
  
  <xsl:template match="/xliff">
    <T3locallang>
      <data type="array">
        <languageKey index="{$lang}" type="array">
          <xsl:apply-templates select="file/body" />
        </languageKey>
      </data>
    </T3locallang>
  </xsl:template>
  
  <xsl:template match="trans-unit">
    <xsl:variable name="index" select="@id"/>
    <label index="{$index}"><xsl:value-of select="source" /></label>
  </xsl:template>
  
</xsl:stylesheet>
