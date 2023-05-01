<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="relve"
                                       page-height="15in"
                                       page-width="11in">
                    <fo:region-body margin="1in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="relve">
                <fo:flow flow-name="xsl-region-body">
                    <fo:table table-layout="fixed">
                        <fo:table-column column-width="8cm"/>
                        <fo:table-column column-width="8cm"/>
                        <fo:table-column column-width="6cm"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block>
                                        <fo:external-graphic
                                                display-align="center"
                                                content-width="6cm"
                                                content-height="6cm"
                                                src="url(file:///C:/Users/YASSINE/Desktop/JAVA/JAKARTA/z999_xmlProject/src/main/webapp/images/im1.png)">
                                        </fo:external-graphic>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell >
                                    <fo:block text-align="center">
                                        <fo:external-graphic
                                                display-align="center"
                                                content-width="6cm"
                                                content-height="6cm"
                                                src="url(file:///C:/Users/YASSINE/Desktop/JAVA/JAKARTA/z999_xmlProject/src/main/webapp/images/Ensat.jpg)">
                                        </fo:external-graphic>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block text-align="center">
                                        <fo:external-graphic
                                                display-align="center"
                                                content-width="6cm"
                                                content-height="6cm"
                                                src="url(file:///C:/Users/YASSINE/Desktop/JAVA/JAKARTA/z999_xmlProject/src/main/webapp/images/im2.png)">
                                        </fo:external-graphic></fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>

                    </fo:table>
                    <fo:block font-size="24pt" font-weight="bold" text-align="center">
                        RELVE DES NOTES ET RESULTATS
                    </fo:block>

                    <xsl:param name="code"/>

                    <fo:block font-size="12pt" text-align="left" space-before="0.5in" font-weight="bold">
                        <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/NOM"/>
                        <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/PRENOM"/>

                    </fo:block>
                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        Numéro d'étudiant : <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/Code_Apogee"/>
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        Né à <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/VILLE"/>
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        inscrit en <fo:inline font-weight="bold"><xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/FILIERE"/></fo:inline>
                    </fo:block>



                    <fo:block margin-top="5px">
                        <fo:table text-align="center" border-style="solid" >
                            <fo:table-column border-style="solid"/>
                            <fo:table-column border-style="solid"/>
                            <fo:table-column border-style="solid"/>
                            <fo:table-header border-style="solid"  font-size="13pt" font-weight="bold">
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>modules</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>Notes</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>Session</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                            <fo:table-body >
                                <xsl:for-each select="/etudiants/etudiant[Code_Apogee=$code]/modules/module/sous_module">
                                    <fo:table-row>
                                        <fo:table-cell  border-style="solid">
                                            <fo:block>
                                                <xsl:value-of select="@nom" />
                                            </fo:block>
                                        </fo:table-cell >
                                        <fo:table-cell  border-style="solid">
                                            <fo:block>
                                                <xsl:value-of select="." />/20
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell  border-style="solid">
                                            <fo:block>
                                                <xsl:choose>
                                                    <xsl:when test="position() &lt; 19">
                                                        S1
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        S2
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                    <fo:block font-size="12pt"  text-align="left" space-before="0.5in" font-weight="bold">
                        <xsl:variable name="sum" select="sum(/etudiants/etudiant[Code_Apogee=$code]/modules/module/sous_module)"/>
                        Resultat d'admission :<xsl:variable name="moyenne" select="format-number($sum div 31,'0.00') "/>
                        <xsl:value-of select="$moyenne"></xsl:value-of>
                        <fo:inline font-weight="normal">
                            <xsl:choose>
                                <xsl:when test="$moyenne &lt; 11.5">
                                    ajourne
                                </xsl:when>
                                <xsl:when test="$moyenne &gt; 12 and $moyenne &lt; 14">
                                    admit avec montion passable.
                                </xsl:when>
                                <xsl:when test="$moyenne &gt; 14 and $moyenne &lt; 16">
                                    admit avec montion bien.
                                </xsl:when>
                                <xsl:when test="$moyenne &gt; 16 ">
                                    admit avec montion tres bien.
                                </xsl:when>
                                <xsl:when test="$moyenne &gt; 11.5 and $moyenne &lt; 12">
                                    juree.
                                </xsl:when>
                            </xsl:choose>
                        </fo:inline>

                    </fo:block>
                    <fo:block text-align="center">
                        <fo:external-graphic
                                display-align="center"
                                content-width="7cm"
                                content-height="7cm"
                                src="url(file:///C:/Users/YASSINE/Desktop/JAVA/JAKARTA/z999_xmlProject/src/main/webapp/images/signature.png)">
                        </fo:external-graphic>
                    </fo:block>
                    <fo:block font-size="10pt"  text-align="center" space-before="0.5in">
                        Fait à Tanger le xxxxx
                    </fo:block>

                    <fo:block font-size="10pt" text-align="center">
                        le Directeur de l'Ecole Nationale Appliquee de Tanger
                    </fo:block>
                    <fo:block font-size="10pt"  text-align="center" space-before="0.5in" font-weight="bold">
                        avis important:Il ne peut être délivré qu’un seul exemplaire du present releve de note. Aucun duplication ne sera fourni.
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>