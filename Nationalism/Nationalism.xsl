<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" 
    xmlns:math="http://www.w3.org/2005/xpath-functions/math">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="maxheight" as="xs:double" select="1000"/>
    <xsl:variable name="maxwidth" as="xs:double" select="count(//constitution) * 120"/>
    <xsl:variable name="barspacing" as="xs:double" select="1.2"/>
    <xsl:variable name="barwidth" as="xs:double" select="30" />
    
    <xsl:template match="/">
        
        <svg
            height="{$maxheight + 400}"
            width="{$maxwidth + 400}"
            viewBox="0, -2000, 2000, 2000"> 
            <g> 
                <line x1="{50}" y1="-{50}" x2="{$maxwidth}" y2="-{50}" stroke="black"/>
                <text x="{$maxwidth + 10}" y="-{50}" font-size="xx-large">Constitution</text>
                <line x1="{50}" y1="-{50}" x2="{50}" y2="-{$maxheight + 50}" stroke="black"/>
                <text x ="{100}" y="-{$maxheight + 100}" font-size="xx-large" text-anchor="middle">Mentions of Nationalism</text>
                <xsl:for-each select="0 to 10">
                    <xsl:variable name="Ruling-height" as="xs:double" select=". * 100 "/>
                    <text x="{30}" y="-{$Ruling-height + 50}" font-size="x-large" text-anchor="middle" dominant-baseline="middle">
                        <xsl:value-of select="$Ruling-height div 100"/>
                    </text>
                    <line x1="50" y1="-{$Ruling-height + 50}" x2="{$maxwidth}" y2="-{$Ruling-height + 50}" stroke="black" opacity=".2"/>
                </xsl:for-each>
                <xsl:apply-templates select="//constitution"/>
                <text x="{$maxwidth div 2.5}" y="-{$maxheight + 200}" font-size="xxx-large" dominant-baseline="middle">Nationalism Chart</text>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="constitution">
        <xsl:variable name="xpos" as="xs:double" select="count(preceding-sibling::constitution)"/>
        <xsl:variable name="ypos" as="xs:double" select="count(descendant::nationalism)"/>
        
        <rect x="{$xpos * 100 * $barspacing + 70}" y="-{$ypos * 100 + 50}" width="{$barwidth}" height="{$ypos * 100}" stroke="black" fill="red" opacity=".5"/>
        <!-- text x="{$xpos * 100 + $barspacing + 50 + $barwidth div 2}" y="-{$ypos * 100 + 60}" font-size="x-large" text-anchor="middle">
            <xsl:value-of select="count(descendant::nationalism)"/>
        </text>  -->
        
        <text x="{$xpos * 100 * $barspacing + 70 + $barwidth div 2}" y="-{25}" dominant-baseline="middle" font-size="x-large" text-anchor="middle">
            <xsl:value-of select="@country"/>
        </text>
    </xsl:template>
    
</xsl:stylesheet>