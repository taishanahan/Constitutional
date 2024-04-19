<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    
<!--================= first want to match everything and select just the actual text of the preamble/chapter ==================-->
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="styling.css"/>
                <link rel="stylesheet" type="text/css" href="transformation-styling.css"/>
                <script src="textpage-highlight-javascript.js"></script>
                <title>XSLT for Constitutions</title>
                
            </head>
            <body>
                
<!--=========================== NAV BAR SO IT DISPLAYS ON EACH PAGE: ========================================-->
                <h1>An Analysis of the Constitutions of Former Soviet Union States</h1>
                <div class="nav-bar">
                    <ul>
                        <li class="navbar"><a href="index.xhtml">Home</a></li>
                        <li class="navbar"><a href="about-page.xhtml">About</a></li>
                        <li class="navbar"><a href="constitution-page.xhtml">Constitutions</a></li>
                        <li class="navbar"><a href="analysis-page.xhtml">Analysis</a></li>
                        <li class="navbar"><a href="conclusion-page.xhtml">Conclusions</a></li>
                    </ul>
                </div>
                
<!--============================= SIDE NAV BAR: ===============================================-->
                <div class="sidenav">
                    <ul>
                        <li class="sidebar"><a href="armenia-xslt-test.xhtml">Armenia</a></li>
                        <li class="sidebar">
                            <a href="azerbaijan-xslt.xhtml">Azerbaijan</a></li>
                        <li class="sidebar">
                            <a href="belarus-xslt.xhtml">Belarus</a></li>
                        <li class="sidebar"><a href="estonia-xslt.xhtml">Estonia</a></li>
                        <li class="sidebar"><a href="georgia-xslt.xhtml">Georgia</a></li>
                        <li class="sidebar"><a href="kazakhstan-xslt.xhtml">Kazhakstan</a></li>
                        <li class="sidebar"><a href="kyrgyzstan-xslt.xhtml">Kyrgyzstan</a></li>
                        <li class="sidebar">
                            <a href="latvia-xslt.xhtml">Latvia</a></li>
                        <li class="sidebar"><a href="lithuania-xslt.xhtml">Lithuania</a></li>
                        <li class="sidebar">
                            <a href="moldova-xslt.xhtml">Moldova</a></li>
                        <li class="sidebar"><a href="russia-xslt.xhtml">Russia</a></li>
                        <li class="sidebar"><a href="tajikstan-xslt.xhtml">Tajikistan</a>
                        </li>
                        <li class="sidebar"><a href="turkmenistan-xslt.xhtml">Turkmenistan</a></li>
                        <li class="sidebar">
                            <a href="ukraine-xslt.xhtml">Ukraine</a></li>
                        <li  class="sidebar">
                            <a href="uzbekistan-xslt.xhtml">Uzbekistan</a></li>
                    </ul>
                </div>
                
<!--======================== CHECKBOXES TO ADD COLOR TO DIF ELEMENTS: ======================================-->
                
               <div class="check-box">
                   <h4>Check a box to highlight an element: </h4>
                    <ul>
                      <li class="colors">
                          <input type="checkbox" id="myCheckOne" onclick="highlightNationalism()"></input>
                          <label for="myCheckOne">Nationalism</label>  
                      </li>
                  
                      <li class="colors">
                          <input type="checkbox" id="myCheckTwo" onclick="highlightLiberty()"></input>
                          <label for="myCheckTwo">Liberty</label>
                      </li> 
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckGov" onclick="highlightGov()"></input>
                            <label for="myCheckGov">Government</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckCitizenship" onclick="highlightCitizenship()"></input>
                            <label for="myCheckCitizenship">Citizenship</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckVote" onclick="highlightVote()"></input>
                            <label for="myCheckVote">Vote</label>
                        </li> 
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckProtest" onclick="highlightProtest()"></input>
                            <label for="myCheckProtest">Protest</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckAssembly" onclick="highlightAssembly()"></input>
                            <label for="myCheckAssembly">Assembly</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckLegal" onclick="highlightLegal()"></input>
                            <label for="myCheckLegal">Legal</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckRace" onclick="highlightRace()"></input>
                            <label for="myCheckRace">Racial Equality</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckMisc" onclick="highlightMisc()"></input>
                            <label for="myCheckMisc">Misc Rights</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckCapital" onclick="highlightCapital()"></input>
                            <label for="myCheckCapital">Capital</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckSymbols" onclick="highlightSymbols()"></input>
                            <label for="myCheckSymbols">Symbols</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckRussian" onclick="highlightRussian()"></input>
                            <label for="myCheckRussian">Russian Language</label>
                        </li>
                        
                        <li class="colors">
                            <input type="checkbox" id="myCheckNative" onclick="highlightNative()"></input>
                            <label for="myCheckNative">Native Language</label>
                        </li>
                        
                        
                    </ul>
               </div> 
                
                
                
<!--========================== MAKE ALL TEXT SECTION ELEMENT: ===============================-->
                <div class="text"><xsl:apply-templates select="//body"/></div>
                
            </body>
        </html>
    </xsl:template>   
    
    <!--======================= turn the preamble into a paragraph ===================================-->
    <xsl:template match="preamble">
        <h2>
            <xsl:text>PREAMBLE</xsl:text>
        </h2>
    <p class="preamble">
        <xsl:apply-templates/>
    </p>
    </xsl:template>
    
<!--================== make the chapter title big =================================-->
    <xsl:template match="chap_title">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
<!--===================== make the section header big (if there is one) =========================-->
    <xsl:template match="s_header">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
   
<!--====================test to see if there are section headers to figure out how big to make the article headers ======================-->
    <xsl:template match="a_header">
        <xsl:variable name="count-sections" as="xs:integer" select="count(//section)"/>
        <xsl:choose>
            <xsl:when test="$count-sections eq 1">
                <h3>
                    <xsl:apply-templates/>
                </h3>
            </xsl:when>
            <xsl:otherwise>
                <h4>
                    <xsl:apply-templates/>
                </h4>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
<!--=================== make each article its own div ====================================-->
    <xsl:template match="article">
        <div>
            <xsl:apply-templates/>
        </div>
        <br/>
    </xsl:template>

<!--==================== make each article text its own paragraph ========================= -->
    <xsl:template match="a_text">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
<!--============================ transform elements =================================-->
    <!--    1. transforming ind_rights: -->
    <xsl:template match="ind_rights">
        <span class="{@ind_type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!--    2. religion -->
    <xsl:template match="religion">
        <span class="{@r_type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--    3. nationalism -->
    <xsl:template match="nationalism">
        <span class="nationalism">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--    4. language -->
    <xsl:template match="language">
        <span class="{@lang_type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--    5. Soveriegnty -->
    <xsl:template match="sovereignty">
        <span class="soveriegnty">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--    6. gov -->
    <xsl:template match="gov">
        <span class="gov">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        7. economic -->
    <xsl:template match="economic">
        <span class="{@e_type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        8. Symbols -->
    <xsl:template match="symbols">
        <span class="symbols">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        9. capital -->
    <xsl:template match="capital">
        <span class="capital">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        10. consent -->
    <xsl:template match="consent">
        <span class="consent">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        11. seperation -->
    <xsl:template match="separation">
        <span class="separation">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        12. parties -->
    <xsl:template match="parties">
        <span class="{@p_type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        13. property -->
    <xsl:template match="property">
        <span class="{@prop_type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        14. international -->
    <xsl:template match="international">
        <span class="international">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        15. peace -->
    <xsl:template match="peace">
        <span class="peace">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        16. treason -->
    <xsl:template match="treason">
        <span class="treason">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        17. levels -->
    <xsl:template match="levels">
        <span class="{@l_type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        18. elections -->
    <xsl:template match="elections">
        <span class="elections">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
<!--        19. currency -->
    <xsl:template match="currency">
        <span class="currency">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


</xsl:stylesheet>