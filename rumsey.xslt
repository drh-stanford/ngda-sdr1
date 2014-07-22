<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:mods="http://www.loc.gov/mods/v3" xmlns:mets="http://www.loc.gov/METS/" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="//mets:mets">
    <xsl:for-each select="./mets:dmdSec/mets:mdWrap/mets:xmlData/mods:mods">
      <xsl:text>|catkey:</xsl:text>
      <xsl:for-each select="./mods:recordInfo/mods:recordIdentifier[@source='Unicorn catalog key']">
        <xsl:value-of select="."/>
      </xsl:for-each>
      <xsl:text>||</xsl:text>
      <xsl:for-each select="./mods:titleInfo[@type='abbreviated']/mods:title">
        <xsl:value-of select="."/>
      </xsl:for-each>
      <xsl:text>|rumsey:</xsl:text>
      <xsl:for-each select="./mods:identifier">
        <xsl:value-of select="."/>
        <xsl:text>_</xsl:text>
      </xsl:for-each>
    </xsl:for-each>
    <xsl:for-each select="//mets:FLocat">
      <xsl:text>|</xsl:text>
      <xsl:value-of select="@xlink:href"/>
    </xsl:for-each>
      <xsl:text>|
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
