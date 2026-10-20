<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">

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
          :root { color-scheme: light dark; }
          body {
            font-family: system-ui, -apple-system, sans-serif;
            max-width: 720px;
            margin: 60px auto;
            padding: 0 20px;
            line-height: 1.65;
          }
          h1 { font-family: Georgia, serif; font-weight: 400; margin-bottom: 0.2em; }
          .lead { color: #666; margin-top: 0; }
          .meta { font-size: 13px; color: #888; margin-bottom: 24px; }
          ul { list-style: none; padding: 0; }
          li { padding: 14px 0; border-bottom: 1px solid #ddd; }
          .title { font-weight: 600; }
          .dur { color: #888; font-variant-numeric: tabular-nums; font-size: 13px; margin-left: 8px; }
          .date { color: #888; font-size: 13px; display: block; margin-top: 2px; }
          a { color: inherit; }
        </style>
      </head>
      <body>
        <h1>
          <xsl:value-of select="rss/channel/title"/>
        </h1>
        <p class="lead">
          <xsl:value-of select="rss/channel/description"/>
        </p>
        <p class="meta">
          Flux RSS : <a href="podcast.xml">podcast.xml</a>
        </p>
        <h2>Épisodes</h2>
        <ul>
          <xsl:for-each select="rss/channel/item">
            <li>
              <span class="title">
                <xsl:value-of select="title"/>
              </span>
              <span class="dur">
                <xsl:text>(</xsl:text>
                <xsl:value-of select="*[local-name()='duration']"/>
                <xsl:text>)</xsl:text>
              </span>
              <span class="date">
                <xsl:value-of select="pubDate"/>
                <xsl:text> · </xsl:text>
                <a href="{enclosure/@url}">Écouter</a>
              </span>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
