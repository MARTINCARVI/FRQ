
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="/">
    <html lang="fr">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport"
              content="width=device-width, initial-scale=1"/>
        <title>
          <xsl:value-of select="rss/channel/title"/>
        </title>
        <style>
          body {
            font-family: system-ui, sans-serif;
            max-width: 680px;
            margin: 60px auto;
            padding: 0 20px;
            line-height: 1.7;
          }
          li { margin: 12px 0; }
          a { color: inherit; }
        </style>
      </head>
      <body>
        <h1>
          <xsl:value-of select="rss/channel/title"/>
        </h1>
        <p>
          <xsl:value-of select="rss/channel/description"/>
        </p>
        <h2>Les épisodes</h2>
        <ul>
          <xsl:for-each select="rss/channel/item">
            <li>
              <strong>
                <xsl:value-of select="title"/>
              </strong>
              <xsl:text> — </xsl:text>
              <xsl:value-of
                select="*[local-name()='duration']"/>
              <xsl:text> — </xsl:text>
              <a href="{enclosure/@url}">
                Écouter
              </a>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
