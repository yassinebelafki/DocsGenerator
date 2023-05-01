<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="certificate"
                                       page-height="8.5in"
                                       page-width="11in">
                    <fo:region-body margin="1in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="certificate">
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
                                                src="url(/im1.png)">
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
                                            src="url(im2.png)">
                                    </fo:external-graphic></fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:block font-size="24pt" font-weight="bold" text-align="center">
                        ATTESTATION DE SCOLARITE
                    </fo:block>
                    <fo:block font-size="12pt" text-align="left" space-before="0.5in">
                        Le directeur de l’Ecole Nationale des Sciences appliquées de Tanger atteste que l’élève ingénieur :Le directeur de l’Ecole Nationale des Sciences appliquées de Tanger atteste que l’élève ingénieur :
                        <xsl:param name="code"/>
                        <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/NOM"/>
                        <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/PRENOM"/>

                    </fo:block>
                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        Numéro de la carte d’identité nationale : AY68597
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        <xsl:param name="code"/>
                        Code nation de l’étudiant :  <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/Code_Apogee"/>
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        <xsl:param name="code"/>
                        Né à <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/VILLE"/>
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        Poursuit des études a l’école nationales des sciences appliquées de Tanger pour l’année universitaire 2022/2023
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        <xsl:param name="code"/>
                        Diplôme :<xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/FILIERE"/>
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        <xsl:param name="code"/>
                        Filière  : <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/FILIERE"/>
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="left" space-before="0.5in">
                        <xsl:param name="code"/>
                        Année : 2eme année <xsl:value-of select="etudiants/etudiant[Code_Apogee=$code]/FILIERE"/>
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="center" space-before="0.5in">
                        Fait à Tanger le 06/12/2023
                    </fo:block>

                    <fo:block font-size="10pt" text-align="center">
                        _______________________________
                    </fo:block>

                    <fo:block font-size="10pt"  text-align="center" space-before="0.5in" font-weight="bold">
                        Le directeur BENMOUSSA
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>