<?xml version="1.0" encoding="ISO-8859-1"?>

<!--
XSLT to transform SPS artefact DB into Rom Center complient DAT
To use, add the following line to the artefacts.xml file, under
the initial <?xml/> declaration.

<?xml-stylesheet type="text/xsl" href="artefacts-rc.xsl"?>

Example Rom Center entry:
¬WizardWarz_1¬WizardWarz_1¬WizardWarz_1¬WizardWarz_1¬WizardWarz.ipf¬1DCD8A40¬235820¬¬¬
-->

<!-- Stylesheet header -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Specify HTML output to allow natural conversion of HTML entities -->
<xsl:output media-type="text/html" indent="no" method="html" />

 <!-- Match on the root element -->
 <xsl:template match="/">

  <!-- HTML start block -->
  <html><body><font size="1">

    <!-- Count number of releases (for version header) -->
    <xsl:variable name="releases">
      <xsl:value-of select="count(artefacts/artefact)"/>
    </xsl:variable>

    <!-- Rom Center DAT header -->
    [CREDITS]<br />
    Author=SPS Rom Center XSLT Transform v1.0<br />
    Version=Releases 1-<xsl:value-of select="$releases"/><br />
    Comment=SPS IPF Images<br />
    [DAT]<br />
    version=2.00<br />
    [EMULATOR]<br />
    refname=SPS IPF Images<br />
    version=Releases 1-<xsl:value-of select="$releases"/><br />
    [GAMES]<br />

    <!-- For each IPF in the XML -->
    <xsl:for-each select="artefacts/artefact/media/item">

    <!-- Sort in name-id-diskid sequence -->
    <xsl:sort select="../../name"/>
    <xsl:sort select="../../id"/>
    <xsl:sort select="id"/>

    <!-- Build valid file archive name of the form <name>_<id> -->
    <!-- TODO toTitleCase(str) -->
    <xsl:variable name="archive">
        <!-- Replace or strip illegal characters -->
      <xsl:variable name="apos">'</xsl:variable>
      <xsl:value-of select="translate(translate(translate(translate(../../name,' ',''),'?',''),':/','--'),$apos,'')"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="../../id"/>
    </xsl:variable>

    <!-- RC archive name block -->
    <xsl:text>¬</xsl:text>
    <xsl:value-of select="$archive"/>
    <xsl:text>¬</xsl:text>
    <xsl:value-of select="$archive"/>
    <xsl:text>¬</xsl:text>
    <xsl:value-of select="$archive"/>
    <xsl:text>¬</xsl:text>
    <xsl:value-of select="$archive"/>

    <!-- IPF info -->
    <xsl:text>¬</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>¬</xsl:text>
    <xsl:value-of select="crc"/>
    <xsl:text>¬</xsl:text>
    <xsl:value-of select="size"/>
    <xsl:text>¬¬¬</xsl:text>

    <!-- Newline ready for next entry -->
    <br />

    <!-- Next IPF -->
    </xsl:for-each>

  <!-- When finished, output closing html -->
  </font></body></html>

 <!-- End of template -->
 </xsl:template>

<!-- End of style sheet -->
</xsl:stylesheet>
