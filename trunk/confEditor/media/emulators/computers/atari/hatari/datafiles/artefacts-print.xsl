<?xml version="1.0" encoding="ISO-8859-1"?>

<!--
XSLT to transform SPS artefact DB into something that looks similar
to the online release database (http://www.softpres.org/?id=games).
Sorting and filtering requires editing this file (unless somebody
wants to submit some clever JavaScript to mimic the online form selector
;).

To use, add the following line to the artefacts.xml file, under
the initial <?xml/> declaration.

<?xml-stylesheet type="text/xsl" href="artefacts-html.xsl"?>

This is actually the default.
-->

<!-- Stylesheet header -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Specify HTML output to allow natural conversion of HTML entities -->
<xsl:output media-type="text/html" indent="no" method="html" />

 <!-- Match on the root element -->
 <xsl:template match="/">

  <!-- HTML start block -->
  <html>
  <head>
  <style type="text/css">
    body { }
    th { font-size: 13px; text-align: left; }
    td { font-size: 13px; }
  </style>
  </head>
  <body>

    <!--Table header -->

      <!-- For each release in the XML -->
      <xsl:for-each select="artefacts/artefact">

        <!-- Enable to sort in name-id sequence
             (when undefined, uses XML sorting order (by ID)) -->

        <xsl:sort select="name"/>

        <!-- Build platform string -->
        <xsl:variable name="platforms">
          <xsl:for-each select="system/target">
            <xsl:value-of select="name"/>
            <xsl:if test="not(position() = last())">, </xsl:if> 
          </xsl:for-each>
        </xsl:variable>

        <!-- Release Info -->
        <xsl:value-of select="name"/>
        <xsl:if test="string-length(version) != 0"> (<xsl:value-of select="version"/>)</xsl:if> 
        [<xsl:value-of select="$platforms"/>]
        <br />

      <!-- Next release -->
      </xsl:for-each>

  <!-- When finished, output closing HTML -->
  </body></html>

 <!-- End of template -->
 </xsl:template>

<!-- End of style sheet -->
</xsl:stylesheet>
