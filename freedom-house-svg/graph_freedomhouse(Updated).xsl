<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" 
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="maxheight" as="xs:double" select="450"/>
    <xsl:variable name="maxwidth" as="xs:integer" select="count(//constitution) * 110"/>
    <xsl:variable name="barspacing" as="xs:double" select="1.2"/>
    <xsl:variable name="barwidth" as="xs:double" select="20" />
    
    
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
            width="{$maxwidth -300}"
            viewBox="0, -1500, 1500, 1600"> 
       
  
            <g> 
                <!--drawing line and text for horizontal axis-->
                <line x1="{50}" y1="-{50}" x2="{$maxwidth + 170}" y2="-{50}" stroke="black"/>
                <text x="{$maxwidth div 2}" y="{50}" font-size="xx-large">Constitution</text>
    
            <!--drawing line and text for vertical axis-->
                <line x1="{50}" y1="-{50}" x2="{50}" y2="-{$maxheight + 200}" stroke="black"/>
                <text x ="{0}" y="-{$maxheight + 250}" font-size="xx-large"
                    text-anchor="middle">Number of Individual Rights Divided by Freedom House
                    Score</text>
              
                
                <xsl:for-each select="0 to 12">
                    <!--vertical axis numbers-->
                    <xsl:variable name="Ruling-height" as="xs:double" select=". * 50 "/>
                    <text x="{30}" y="-{$Ruling-height + 50}" font-size="x-large" text-anchor="middle" dominant-baseline="middle">
                        <xsl:value-of select="format-number($Ruling-height div 60,'0.0')"/>   
                  </text>
                    <!--lines between each graph-->
                    <line x1="50" y1="-{$Ruling-height + 50}" x2="{$maxwidth + 200}" y2="-{$Ruling-height
                        + 50}" stroke="black" opacity=".2"/>
                </xsl:for-each>
                
                
                <xsl:apply-templates select="//constitution"/>
                <!--  Adjusting the x coord to center the main title, this is different from our
                    other ones because viewbox dimensions were changed-->
                <text x="{200}" y="-{$maxheight + 310}" font-size="xxx-large"
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
        
        
        <rect x="{$xpos * 100 * $barspacing + 70}" y="-{$ypos * 150 + 50}" width="{$barwidth *2.5}"
            height="{$ypos * 150}" stroke="black" fill="red" opacity=".5"/>
        
        <text x="{$xpos * 100 * $barspacing + 70 + $barwidth div 2}" y="-{25}" font-size="x-large" text-anchor="middle">
            <xsl:value-of select="@country"/>
        </text>
        
        <!--text on top of bar graphs-->
        <text x="{$xpos * 100 * $barspacing + 70 + $barwidth div 2}" y="-{$ypos * 150 + 70}"
            text-anchor="start" font-size="x-large" >
            <xsl:value-of select="format-number($ypos*2.5, '0.0')"/> <!--round to nearest tenth-->
        </text>
    </xsl:template>
    
    

</xsl:stylesheet>