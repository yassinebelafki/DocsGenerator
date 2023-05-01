<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="xs"
                version="2.0">
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="timeTable" page-width="34cm" page-height="18cm">
                    <fo:region-body margin="0.1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="timeTable">
                <fo:flow flow-name="xsl-region-body">
                    <fo:table table-layout="fixed" width="100%">
                        <fo:table-column column-width="8%" border="1pt solid black"/>
                        <fo:table-column column-width="15.3%" border="1pt solid black"/>
                        <fo:table-column column-width="15.3%" border="1pt solid black"/>
                        <fo:table-column column-width="15.3%" border="1pt solid black"/>
                        <fo:table-column column-width="15.3%" border="1pt solid black"/>
                        <fo:table-column column-width="15.3%" border="1pt solid black"/>
                        <fo:table-column column-width="15.3%" border="1pt solid black"/>

                        <fo:table-body>
                            <fo:table-row height="2cm" display-align="center" font-family="Courier New">
                                <fo:table-cell background-color="#b3b5b4">
                                    <fo:block>

                                    </fo:block>
                                </fo:table-cell>
                                <xsl:for-each select="//timeTable/jour">
                                    <fo:table-cell background-color="#b3b5b4" display-align="center">
                                        <fo:block text-align="center" height="2cm" display-align="center">
                                            <xsl:value-of select="@nom"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </xsl:for-each>
                            </fo:table-row>

                            <xsl:for-each select="//timeTable/jour[position() = 1]/hour">
                                <xsl:variable name="myVariable" select="position()"/>
                                <fo:table-row height="3.0cm" text-align="center">
                                    <fo:table-cell background-color="#b3b5b4">
                                        <fo:block text-align="center" height="2cm" display-align="center">
                                            <xsl:value-of
                                                    select="//timeTable/jour[position() = 1]/hour[$myVariable]/@durée"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <xsl:for-each select="//timeTable/jour">

                                        <fo:table-cell border="1pt solid black">
                                            <fo:block text-align="center" height="2cm" display-align="center">
                                                <fo:block>
                                                    <xsl:attribute name="background-color">
                                                        <xsl:choose>
                                                            <xsl:when test="./hour[$myVariable]/cours/@type='TD'">
                                                                #c8db74
                                                            </xsl:when>
                                                            <xsl:when test="./hour[$myVariable]/cours/@type='TP'">
                                                                #46c764
                                                            </xsl:when>
                                                            <xsl:when test="./hour[$myVariable]/cours/@type='CM'">
                                                                #5980c9
                                                            </xsl:when>
                                                            <xsl:otherwise>#ffffff</xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:attribute>
                                                    <xsl:if test="not(./hour[$myVariable]/cours/@type='')">

                                                    </xsl:if>
                                                    <xsl:if test="./hour[$myVariable]/cours/@type!=''">
                                                        <xsl:value-of select="./hour[$myVariable]/cours/@type"/> -
                                                        <xsl:value-of select="./hour[$myVariable]/@durée"/>
                                                    </xsl:if>
                                                </fo:block>
                                                <fo:block font-weight="bold" font-family="Courier New">
                                                    <xsl:value-of select="./hour[$myVariable]/cours/@nom"/>
                                                </fo:block>
                                                <fo:block font-size="9px" font-family="Courier New">
                                                    <xsl:value-of select="./hour[$myVariable]/cours/prof"/>
                                                </fo:block>
                                                <fo:block font-size="9px" font-family="Courier New">
                                                    <xsl:if test="./hour[$myVariable]/cours/salle/*">
                                                        SALLE
                                                        <xsl:value-of select="./hour[$myVariable]/cours/salle"/>
                                                    </xsl:if>
                                                    <xsl:if test="not(./hour[$myVariable]/cours/salle/*)">

                                                    </xsl:if>
                                                </fo:block>

                                            </fo:block>

                                        </fo:table-cell>
                                    </xsl:for-each>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>