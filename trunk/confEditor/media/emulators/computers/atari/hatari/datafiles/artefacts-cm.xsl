<?xml version="1.0" encoding="ISO-8859-1"?>

<!--
XSLT to transform SPS artefact DB into Clear MAME Pro complient DAT
To use, add the following line to the artefacts.xml file, under
the initial <?xml/> declaration.

<?xml-stylesheet type="text/xsl" href="artefacts-cm.xsl"?>

Example Clear MAME Pro entry:
game (
  name "WizardWarz"
  description "WizardWarz"
  rom ( name WizardWarz.ipf size 235820 crc 1DCD8A40 )
)
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

    <!-- Clear MAME Pro DAT header -->
    clrmamepro (<br />
      name "SPS IPF Images"<br />
      description "SPS IPF Images"<br />
      category "IPF"<br />
      version Releases 1-<xsl:value-of select="$releases"/><br />
      author "SPS Clear Mame Pro XSLT Transform v1.0"<br />
    )<br />
    <br />

    <!-- For each release in the XML -->
    <xsl:for-each select="artefacts/artefact">

      <!-- Sort in name-id sequence -->
      <xsl:sort select="name"/>
      <xsl:sort select="id"/>

      <!-- Build valid file archive name of the form <name>_<id> -->
      <!-- TODO toTitleCase(str) -->
      <xsl:variable name="archive">
        <!-- Replace or strip illegal characters -->
        <xsl:variable name="apos">'</xsl:variable>
        <xsl:value-of select="translate(translate(translate(translate(name,' ',''),'?',''),':/','--'),$apos,'')"/>
        <xsl:text>_</xsl:text>
        <xsl:value-of select="id"/>
      </xsl:variable>

      <!-- Game block -->
      game (
      <br />
      <xsl:text>name "</xsl:text>
      <xsl:value-of select="$archive"/>
      <xsl:text>"</xsl:text>
      <br />
      <xsl:text>description "</xsl:text>
      <xsl:value-of select="namereal"/>
      <xsl:text> (#</xsl:text>
      <xsl:value-of select="id"/>
      <xsl:text>)"</xsl:text>
      <br />

      <!-- IPF info for this release -->
      <xsl:for-each select="media/item">

        <!-- Sort by disk ID -->
        <xsl:sort select="id"/>

        rom ( name
        <xsl:value-of select="name"/>
        size
        <xsl:value-of select="size"/>
        crc
        <xsl:value-of select="crc"/>
        )

        <!-- Newline ready for next entry -->
        <br />

      <!-- Next IPF -->
      </xsl:for-each>
      )

      <!-- Release separator -->
      <br />
      <br />

    <!-- Next release -->
    </xsl:for-each>

  <!-- When finished, output closing HTML -->
  </font></body></html>

 <!-- End of template -->
 </xsl:template>

<!-- End of style sheet -->
</xsl:stylesheet>

