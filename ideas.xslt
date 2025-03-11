<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="html"/>

	<!-- styles -->
	<xsl:variable name="style-toc-container" select="'background-color: #cccccc;'" />
	<xsl:variable name="style-item" select="'padding: 10px;'" />
	<xsl:variable name="style-item_h3" select="'border-bottom: 1px solid #cccccc;'" />
	<xsl:variable name="style-item_desc" select="'padding: 20px 0;'" />
	<xsl:variable name="style-item_actions" select="'padding-left: 30px;'" />
	<xsl:variable name="style-item_actions_mentors" select="'padding-left: 30px;'" />

	<!-- project emails -->
	<xsl:variable name="emails">
		<entry key="APISIX">dev (at) apisix.apache.org</entry>
		<entry key="AIRAVATA">dev (at) airavata.apache.org</entry>
		<entry key="AIRFLOW">dev (at) airflow.apache.org</entry>
		<entry key="BEAM">dev (at) beam.apache.org</entry>
		<entry key="CAMEL">dev (at) camel.apache.org</entry>
		<entry key="CASSANDRA">dev (at) cassandra.apache.org</entry>
		<entry key="CLOUDSTACK">dev (at) cloudstack.apache.org</entry>
		<entry key="COUCHDB">dev (at) couchdb.apache.org</entry>
		<entry key="DOLPHINSCHEDULER">dev (at) dolphinscheduler.apache.org</entry>
		<entry key="DORIS">dev (at) doris.apache.org</entry>
		<entry key="EVENTMESH">dev (at) eventmesh.apache.org</entry>
		<entry key="FINERACT">dev (at) fineract.apache.org</entry>
		<entry key="FINCN">dev (at) fineract.apache.org</entry>
		<entry key="GORA">dev (at) gora.apache.org</entry>
		<entry key="HERTZBEAT">dev (at) hertzbeat.apache.org</entry>
		<entry key="HUDI">dev (at) hudi.apache.org</entry>
		<entry key="HUGEGAPH">dev (at) hugegraph.apache.org</entry>
		<entry key="IOTDB">dev (at) iotdb.apache.org</entry>
		<entry key="JAMES">dev (at) james.apache.org</entry>
		<entry key="KVROCKS">dev (at) kvrocks.apache.org</entry>
		<entry key="LUCENENET">dev (at) lucenenet.apache.org</entry>
		<entry key="MATH">dev (at) commons.apache.org</entry>
		<entry key="MAHOUT">dev (at) mahout.apache.org</entry>
		<entry key="NEMO">dev (at) nemo.apache.org</entry>
		<entry key="NUMBERS">dev (at) commons.apache.org</entry>
		<entry key="NUTTX">dev (at) nuttx.apache.org</entry>
		<entry key="OPENDAL">dev (at) opendal.apache.org</entry>
		<entry key="OPENMEETINGS">dev (at) openmeetings.apache.org</entry>
		<entry key="OWB">dev (at) openwebbeans.apache.org</entry>
		<entry key="ROCKETMQ">dev (at) rocketmq.apache.org</entry>
		<entry key="SEATA">dev (at) seata.apache.org</entry>
		<entry key="SEATUNNEL">dev (at) seatunnel.apache.org</entry>
		<entry key="SHARDINGSPHERE">dev (at) shardingsphere.apache.org</entry>
		<entry key="SHENYU">dev (at) shenyu.apache.org</entry>
		<entry key="SKYWALKING">dev (at) skywalking.apache.org</entry>
		<entry key="STREAMPIPES">dev (at) streampipes.apache.org</entry>
		<entry key="TEACLAVE">dev (at) teaclave.apache.org</entry>
		<entry key="TRAFFICCONTROL">dev (at) trafficcontrol.apache.org</entry>
		<entry key="UIMA">dev (at) uima.apache.org</entry>
	</xsl:variable>

	<xsl:template match="/">
	<html>
	<body>
		<xsl:apply-templates select="rss/channel" mode="toc"/>
		<xsl:apply-templates select="rss/channel" mode="content"/>
	</body>
	</html>
	</xsl:template>
	
	<xsl:template match="rss/channel" mode="toc">
	<p style="color: red; font: bold;">This page is auto-generated! Please do NOT edit it, all changes will be lost on next update</p>
	<div id="toc_container" style="{$style-toc-container}">
	<p class="toc_title">Contents</p>
	<ul class="toc_list">
		<xsl:for-each-group select="item" group-by="project/@key">
			<li><a href="{project/@href}"><xsl:value-of select="project/text()"/></a></li>
			<xsl:for-each select="current-group()">
			<ul>
				<li><a href="{summary/@href}"><xsl:value-of select="summary/text()"/></a></li>
			</ul>
			</xsl:for-each>
		</xsl:for-each-group>
	</ul>
	</div>
	</xsl:template>

	<xsl:template match="rss/channel" mode="content">
		<xsl:for-each-group select="item" group-by="project/@key">
			<h1 id="{project/@href}"><xsl:value-of select="project/text()"/></h1> <!-- {current-grouping-key()} -->
			<xsl:for-each select="current-group()">
				<div class="item" style="{$style-item}">
					<h3 id="{summary/@href}" style="{$style-item_h3}"><a href="{link/text()}"><xsl:value-of select="summary/text()"/></a></h3> <!-- {key/text()} -->
					<div class="desc" style="{$style-item_desc}">
						<xsl:value-of select="description" disable-output-escaping="yes"/>
					</div>
					<div class="actions" style="{$style-item_actions}">
						<div>
							<strong>Difficulty:</strong><xsl:text> </xsl:text><xsl:value-of select="difficulty/text()"/>
						</div>
						<div>
							<strong>Project size:</strong><xsl:text> </xsl:text><xsl:value-of select="size/text()"/>
						</div>
						<div>
							<div><strong>Potential mentors:</strong></div>
							<div style="{$style-item_actions_mentors}">
								<i><xsl:value-of select="mentor/text()"/></i>,<xsl:text> </xsl:text>mail: <xsl:value-of select="mentor/@username"/><xsl:text> </xsl:text>(at)<xsl:text> </xsl:text>apache.org
							</div>
							<div style="{$style-item_actions_mentors}">
								<i>Project Devs</i>,<xsl:text> </xsl:text>mail: <xsl:value-of select="$emails/entry[@key=current-grouping-key()]"/>
							</div>
						</div>
					</div>
				</div>
			</xsl:for-each>
		</xsl:for-each-group>
	</xsl:template>
</xsl:stylesheet>

