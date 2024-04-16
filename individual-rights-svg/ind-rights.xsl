<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="totalNum" as="xs:double" select="15"/>
    <xsl:variable name="maxheight" as="xs:double" select="1000"/>
    <xsl:variable name="maxwidth" as="xs:double" select="15 * 120"/>
    <xsl:variable name="scale" as="xs:double" select="10"/>
    <xsl:variable name="spacing" as="xs:double" select="10"/>
    <xsl:variable name="barWidth" as="xs:double" select="20"/>
    <xsl:variable name="barInterval" as="xs:double" select="$barWidth + $spacing"/>
    
    <xsl:template match="/">
        <svg
            height="{$maxheight + 400}"
            width="{$maxwidth + 400}"
            viewBox="0, -2000, 2000, 2000">
        <g>
            <xsl:variable name="height" as="xs:double" select="$barInterval * 23"/>
            <text  x="50" y="-{$height + $maxheight}" text-anchor="middle" font-size="xx-large">Percent of constitutions that mention each right</text>
        </g>
        <xsl:apply-templates/>
        </svg>
    </xsl:template>
    
    <xsl:template match="right">
        <xsl:variable name="position" as="xs:integer" select="count(preceding::right) + 1"/>
        <xsl:variable name="rightCount" as="xs:double" select="count(//right[$position]/country)"/>
        <xsl:variable name="math" as="xs:double" select="$rightCount div $totalNum"/>    
        <xsl:variable name="percent" as="xs:double" select="$math * 100"/>
        <xsl:variable name="num" as="xs:integer" select="position() - 1"/>
        <xsl:variable name="yPos" as="xs:double" select="$num * $barInterval + $spacing + $maxheight"/>
        <xsl:variable name="xPos" as="xs:double" select="-250"/>
        <xsl:variable name="rectWidth" as="xs:double" select="$percent * $scale"/>
        <rect width="{$rectWidth}" height="{$barWidth}" x="{$xPos}" y="-{$yPos}" stroke="black"/>    
        <text y="-{$yPos - 15}" x="{$rectWidth + $xPos +15}" text-anchor="start">
            <xsl:apply-templates select="round($percent)"/> %
        </text>
        <text x="{$xPos -25}" y="-{$yPos - 15}" text-anchor="end">
            <xsl:value-of select="@class"/>
        </text>
    </xsl:template>
</xsl:stylesheet>