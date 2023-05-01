<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="xs"
                version="2.0">
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="sample" page-width="7cm" page-height="4cm">
                    <fo:region-body margin="0.1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="sample">
                <fo:flow flow-name="xsl-region-body">
                        <xsl:param name="code"/>
                    <fo:table table-layout="fixed" width="100%">
                        <fo:table-column column-width="30%"/>
                        <fo:table-column column-width="40%"/>
                        <fo:table-column column-width="30%"/>


                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block margin-left="5px">
                                        <fo:external-graphic
                                                display-align="center"
                                                content-width="20px"
                                                content-height="20px"
                                                src="url(logos/uae.png)">
                                        </fo:external-graphic>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block block-progression-dimension="1.5cm" font-family="TimesNewRoman"
                                              inline-progression-dimension="6cm" font-size="6px" text-align="center"
                                              color="#3262a8">
                                        Université Abdelmalek Essaadi
                                        Ecole Nationale des Sciences Appliquées
                                        Tanger
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>
                                        <fo:external-graphic
                                                display-align="center"
                                                content-width="30px"
                                                content-height="30px"
                                                src="url(logos/ensat.png)">
                                        </fo:external-graphic>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>

                    </fo:table>
                    <fo:block border-bottom="1pt solid orange">
                    </fo:block>
                    <fo:block color="#3262a8" text-align="center" font-size="8px" margin-top="2px"
                              font-family="TimesNewRoman">
                        CARTE D'ETUDIANT
                    </fo:block>

                    <fo:table table-layout="fixed" margin-top="8px">
                        <fo:table-column column-width="0.8cm"/>
                        <fo:table-column column-width="4.6cm"/>
                        <fo:table-column column-width="2cm"/>


                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block margin-right="6px" margin-left="3px">
                                        <fo:external-graphic
                                                display-align="center"
                                                content-width="30px"
                                                content-height="35px"
                                                src="url(photos/{$code}.jpg)">
                                        </fo:external-graphic>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>

                                    <fo:table table-layout="fixed" margin-top="10px">
                                        <fo:table-column column-width="0.2cm"/>
                                        <fo:table-body>
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block margin-left="5px" font-size="7px"
                                                              font-family="TimesNewRoman"
                                                              color="#3262a8">
                                                        <xsl:value-of select="//etudiants/etudiant[Code_Apogee=$code]/NOM"  />
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block margin-left="5px" font-size="7px"
                                                              font-family="TimesNewRoman"
                                                              color="#3262a8">
                                                        <xsl:value-of select="//etudiants/etudiant[Code_Apogee/text()=$code]/PRENOM"  />
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block margin-left="5px" font-size="5px"
                                                              font-family="TimesNewRoman"
                                                              color="#3262a8">
                                                        <xsl:value-of select="//etudiants/etudiant[Code_Apogee/text()=$code]/Code_Apogee"  />
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </fo:table-body>
                                    </fo:table>


                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block padding-right="6px" font-size="2px">
                                        <xsl:variable name="qrcode" select="concat('url(Qrcodes/',//etudiants/etudiant[Code_Apogee/text()=$code]/NOM,'.png)')"/>
                                        <fo:external-graphic
                                                display-align="center"
                                                content-width="30px"
                                                content-height="30px"
                                                src="{$qrcode}">
                                        </fo:external-graphic>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>

                    </fo:table>
                    <fo:block margin-top="13px" text-align="center" font-size="5px" font-family="TimesNewRoman"
                              color="#3262a8">
                        Première Inscription : 2019 / 2020
                    </fo:block>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>