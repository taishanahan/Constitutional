<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" 
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="maxheight" as="xs:double" select="1000"/>
    <xsl:variable name="maxwidth" as="xs:integer" select="count(//constitution) * 120"/>
    <xsl:variable name="barspacing" as="xs:double" select="1.2"/>
    <xsl:variable name="barwidth" as="xs:double" select="30" />
    
    
    <xsl:variable name="freedomhouse" as="map(xs:string, xs:integer)"> <!--since we are dividing it
        by hardcoded numbers, this will allow the string to be processed the final result as a number as
        well-->
        <xsl:map>
            <xsl:map-entry key="'Armenia'" select="54"/>
            <xsl:map-entry key="'Azerbaijan'" select="7"/>
            <xsl:map-entry key="'Estonia'" select="95"/>
            <xsl:map-entry key="'Georgia'" select="58"/>
            <xsl:map-entry key="'Kyrgyzstan'" select="27"/>
            <xsl:map-entry key="'Lithuania'" select="89"/>
            <xsl:map-entry key="'Turkmenistan'" select="2"/>
            <xsl:map-entry key="'Tajikistan'" select="5"/>
            <xsl:map-entry key="'Kazakhstan'" select="23"/>
            <xsl:map-entry key="'Latvia'" select="88"/>
            <xsl:map-entry key="'Russia'" select="13"/>
            <xsl:map-entry key="'Uzbekistan'" select="12"/>
            <xsl:map-entry key="'Belarus'" select="8"/>
            <xsl:map-entry key="'Moldova'" select="61"/>
            <xsl:map-entry key="'Ukraine'" select="49"/>
        </xsl:map>
        <!--xsl:mapping allows each variable to be
        assoicated with each string, and the specific attribute value (country). This allows
        dividing the freedom house number by the number of ind_rights elements to be easier-->
    </xsl:variable>
    
  
    <xsl:variable name="scale" as="xs:double" select="$maxwidth "/>
    
    <xsl:template match="constitution" >
        <xsl:value-of select="map:get($freedomhouse, @country)"/>
    </xsl:template>
    
    <xsl:template match="/">
        
        <svg
            height="{$maxheight + 400}"
            width="{$maxwidth + 400}"
            viewBox="0, -1500, 1500, 1600"> 
       
  
            <g> 
                <line x1="{50}" y1="-{50}" x2="{$maxwidth}" y2="-{50}" stroke="black"/>
                <text x="{$maxwidth div 2}" y="{50}" font-size="xx-large">Constitution</text>
    
                <line x1="{50}" y1="-{50}" x2="{50}" y2="-{$maxheight + 50}" stroke="black"/>
                <text x ="{0}" y="-{$maxheight + 100}" font-size="xx-large"
                    text-anchor="middle">Number of Individual Rights Divided by Freedom House
                    Score</text>
                <xsl:for-each select="0 to 10">
                    <xsl:variable name="Ruling-height" as="xs:double" select=". * 100 "/>
                    <text x="{30}" y="-{$Ruling-height + 50}" font-size="x-large" text-anchor="middle" dominant-baseline="middle">
                        <xsl:value-of select="$Ruling-height div 20"/>
                    </text>
                    <line x1="50" y1="-{$Ruling-height + 50}" x2="{$maxwidth}" y2="-{$Ruling-height + 50}" stroke="black" opacity=".2"/>
                </xsl:for-each>
                <xsl:apply-templates select="//constitution"/>
                <!--  Adjusting the x coord to center the main title, this is different from our
                    other ones because viewbox dimensions were changed-->
                <text x="{200}" y="-{$maxheight + 200}" font-size="xxx-large"
                    dominant-baseline="middle">Comparison of Number of Individual Rights to Freedom House
                    Score</text>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="constitution">
        <xsl:variable name="xpos" as="xs:double"
            select="count(preceding-sibling::constitution)"/>
        <!-- Calculating the vertical scale factor: Number of rights divided by the Freedom House score -->
        <xsl:variable name="ypos" as="xs:double" select="count(descendant::ind_rights) div map:get($freedomhouse,@country)"/>
        <!--map get associates each country with the interger associted above (freedomhouse)-->
        <rect x="{$xpos * 100 * $barspacing + 70}" y="-{$ypos * 50 + 50}" width="{$barwidth}"
            height="{$ypos * 50}" stroke="black" fill="red" opacity=".5"/>
        
        <text x="{$xpos * 100 * $barspacing + 70 + $barwidth div 2}" y="-{25}" font-size="x-large" text-anchor="middle">
            <xsl:value-of select="@country"/>
        </text>
        <text x="{$xpos * 100 * $barspacing + 70 + $barwidth div 2}" y="-{$ypos * 50 + 100}" text-anchor="start">
            <xsl:value-of select="format-number($ypos*2.5, '0.0')"/> <!--round to nearest tenth-->
        </text>
    </xsl:template>
    
    

</xsl:stylesheet>