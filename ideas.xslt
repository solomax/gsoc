<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="html"/>

	<xsl:variable name="style-toc-container" select="'background-color: #cccccc;'" />
	<xsl:variable name="style-item" select="'padding: 10px;'" />
	<xsl:variable name="style-item_h3" select="'border-bottom: 1px solid #cccccc;'" />
	<xsl:variable name="style-item_desc" select="'padding: 20px 0;'" />
	<xsl:variable name="style-item_actions" select="'padding-left: 30px;'" />

	<xsl:template match="/">
	<html>
	<body>
		<xsl:apply-templates select="rss/channel" mode="toc"/>
		<xsl:apply-templates select="rss/channel" mode="content"/>
	</body>
	</html>
	</xsl:template>
	
	<xsl:template match="rss/channel" mode="toc">
	<div id="toc_container" style="{$style-toc-container}">
	<p class="toc_title">Contents</p>
	<ul class="toc_list">
		<xsl:for-each-group select="item" group-by="project/@key">
			<li><a href="#{replace(concat('GSoC2020Ideaslist-', project/text()), ' ', '')}"><xsl:value-of select="project/text()"/></a></li>
			<xsl:for-each select="current-group()">
			<ul>
				<li><a href="#{replace(concat('GSoC2020Ideaslist-', summary/text()), ' ', '')}"><xsl:value-of select="summary/text()"/></a></li>
			</ul>
			</xsl:for-each>
		</xsl:for-each-group>
	</ul>
	</div>
	</xsl:template>

	<xsl:template match="rss/channel" mode="content">
		<xsl:for-each-group select="item" group-by="project/@key">
			<h1 id="{replace(concat('GSoC2020Ideaslist-', project/text()), ' ', '')}"><xsl:value-of select="project/text()"/></h1> <!-- {current-grouping-key()} -->
			<xsl:for-each select="current-group()">
				<div class="item" style="{$style-item}">
					<h3 id="{replace(concat('GSoC2020Ideaslist-', summary/text()), ' ', '')}" style="{$style-item_h3}"><xsl:value-of select="summary/text()"/></h3> <!-- {key/text()} -->
					<div class="desc" style="{$style-item_desc}">
						<xsl:value-of select="description" disable-output-escaping="yes"/>
					</div>
					<div class="actions" style="{$style-item_actions}">
						<div>
							<strong>Difficulty:</strong><xsl:text> </xsl:text><xsl:value-of select="priority/text()"/>
						</div>
					</div>
				</div>
			</xsl:for-each>
		</xsl:for-each-group>
	</xsl:template>
</xsl:stylesheet>
