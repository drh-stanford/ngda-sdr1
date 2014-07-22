<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:mods="http://www.loc.gov/mods/v3" xmlns:mets="http://www.loc.gov/METS/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="/mods:mods">
      <xsl:text>|</xsl:text>
      <xsl:for-each select="./mods:titleInfo/mods:title">
        <xsl:value-of select="."/>
      </xsl:for-each>
      <xsl:text>|
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
