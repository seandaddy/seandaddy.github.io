<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/rss">
    <html>
      <head>
        <title><xsl:value-of select="channel/title"/> - RSS Feed</title>
        <style>
          body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
            background: #f9fafb;
            color: #1f2937;
          }
          .header {
            background: white;
            padding: 30px;
            border-radius: 8px;
            margin-bottom: 30px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
          }
          h1 {
            margin: 0 0 10px 0;
            color: #111827;
            font-size: 28px;
          }
          .description {
            color: #6b7280;
            font-size: 16px;
            margin: 10px 0;
          }
          .subscribe-info {
            background: #dbeafe;
            padding: 15px;
            border-radius: 6px;
            margin-top: 15px;
            font-size: 14px;
            color: #1e40af;
          }
          .item {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
          }
          .item h2 {
            margin: 0 0 10px 0;
            font-size: 20px;
          }
          .item h2 a {
            color: #1f2937;
            text-decoration: none;
          }
          .item h2 a:hover {
            color: #3b82f6;
          }
          .item-description {
            color: #4b5563;
            line-height: 1.6;
            margin: 10px 0;
          }
          .item-date {
            color: #9ca3af;
            font-size: 14px;
          }
          .footer {
            text-align: center;
            color: #9ca3af;
            margin-top: 40px;
            padding: 20px;
            font-size: 14px;
          }
        </style>
      </head>
      <body>
        <div class="header">
          <h1>📰 <xsl:value-of select="channel/title"/></h1>
          <p class="description"><xsl:value-of select="channel/description"/></p>
          <div class="subscribe-info">
            <strong>🔔 This is an RSS feed.</strong> Subscribe by copying this URL into your RSS reader (Feedly, NewsBlur, etc.) to get automatic updates when new posts are published.
          </div>
        </div>
        
        <xsl:for-each select="channel/item">
          <div class="item">
            <h2>
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="link"/>
                </xsl:attribute>
                <xsl:value-of select="title"/>
              </a>
            </h2>
            <p class="item-date">
              📅 <xsl:value-of select="pubDate"/>
            </p>
            <p class="item-description">
              <xsl:value-of select="description"/>
            </p>
          </div>
        </xsl:for-each>
        
        <div class="footer">
          <p>RSS Feed • Updated automatically when new posts are published</p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
