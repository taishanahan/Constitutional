<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="totalNum" as="xs:double" select="15"/>
    <!--<xsl:variable name="liberty" as="xs:double" select="count(//liberty/country) div $totalNum"/>
    <xsl:variable name="vote" as="xs:double" select="count(//vote/country) div $totalNum"/>
    <xsl:variable name="speech" as="xs:double" select="count(//speech/country) div $totalNum"/>
    <xsl:variable name="protest" as="xs:double" select="count(//protest/country) div $totalNum"/>
    <xsl:variable name="assembly" as="xs:double" select="count(//assembly/country) div $totalNum"/>
    <xsl:variable name="citizenship" as="xs:double" select="count(//citizenship/country) div $totalNum"/>
    <xsl:variable name="misc" as="xs:double" select="count(//misc/country) div $totalNum"/>
    <xsl:variable name="gender-equality" as="xs:double" select="count(//gender-equality/country) div $totalNum"/>
    <xsl:variable name="racial-equality" as="xs:double" select="count(//racial-equality/country) div $totalNum"/>
    <xsl:variable name="arms" as="xs:double" select="count(//arms/country) div $totalNum"/>
    <xsl:variable name="legal" as="xs:double" select="count(//legal/country) div $totalNum"/>
    -->
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
            <text  x="1400" y="-{$height}" text-anchor="middle" font-size="xx-large">Percent of constitutions that mention each right</text>
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
        <xsl:variable name="yPos" as="xs:double" select="$num * $barInterval + $spacing"/>
        <xsl:variable name="rectWidth" as="xs:double" select="$percent * $scale"/>
        <rect width="{$rectWidth}" height="{$barWidth}" x="1000" y="-{$yPos}" stroke="black"/>    
        <text y="-{$yPos - 15}" x="{$rectWidth + 1025}" text-anchor="middle">
            <xsl:apply-templates select="round($percent)"/> %
        </text>
        <text x="975" y="-{$yPos - 15}" text-anchor="end">
            <xsl:value-of select="@class"/>
        </text>
    </xsl:template>
</xsl:stylesheet>