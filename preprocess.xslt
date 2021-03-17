<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml"/>

	<xsl:template match="/">
	<rss>
	<channel>
		<xsl:for-each select="rss/channel/item"> <!--  rss/channel/item[status[@id='1']]  -->
			<xsl:variable name="project">
				<xsl:choose>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'RocketMQ']) &gt; 0">
						<xsl:value-of select="'ROCKETMQ'"/>
					</xsl:when>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'SkyWalking']) &gt; 0">
						<xsl:value-of select="'SKYWALKING'"/>
					</xsl:when>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'ShardingSphere']) &gt; 0">
						<xsl:value-of select="'SHARDINGSPHERE'"/>
					</xsl:when>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'TrafficControl']) &gt; 0">
						<xsl:value-of select="'TRAFFICCONTROL'"/>
					</xsl:when>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'IoTDB']) &gt; 0">
						<xsl:value-of select="'IOTDB'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="project/@key"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="projectName">
				<xsl:choose>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'RocketMQ']) &gt; 0">
						<xsl:value-of select="'RocketMQ'"/>
					</xsl:when>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'SkyWalking']) &gt; 0">
						<xsl:value-of select="'SkyWalking'"/>
					</xsl:when>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'ShardingSphere']) &gt; 0">
						<xsl:value-of select="'ShardingSphere'"/>
					</xsl:when>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'TrafficControl']) &gt; 0">
						<xsl:value-of select="'TrafficControl'"/>
					</xsl:when>
					<xsl:when test="project/@key='COMDEV' and count(labels/label[text() = 'IoTDB']) &gt; 0">
						<xsl:value-of select="'IoTDB'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="project/text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="difficulty">
				<xsl:choose>
					<xsl:when test="project/@key='CASSANDRA'">
						<xsl:value-of select="customfields/customfield[@id = 'customfield_12313821']/customfieldvalues/customfieldvalue"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="priority/text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="mentorName">
				<xsl:choose>
					<xsl:when test="project/@key='CASSANDRA'">
						<xsl:value-of select="customfields/customfield[@id = 'customfield_12313420']/customfieldvalues/customfieldvalue[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="reporter/text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="mentorLogin">
				<xsl:choose>
					<xsl:when test="project/@key='CASSANDRA'">
						<xsl:value-of select="customfields/customfield[@id = 'customfield_12313420']/customfieldvalues/customfieldvalue[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="reporter/@username"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<item>
				<project key="{$project}"><xsl:value-of select="$projectName"/></project>
				<xsl:copy-of select="title"/>
				<xsl:copy-of select="link"/>
				<xsl:copy-of select="summary"/>
				<xsl:copy-of select="description"/>
                                <difficulty><xsl:value-of select="$difficulty"/></difficulty>
                                <mentor username="{$mentorLogin}"><xsl:value-of select="$mentorName"/></mentor>
			</item>
		</xsl:for-each>
	</channel>
	</rss>
	</xsl:template>
</xsl:stylesheet>

