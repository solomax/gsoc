<xsl:stylesheet
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xmlns:gsoc="http://github.com/solomax/gsoc"
		exclude-result-prefixes="gsoc"
		version="2.0">
	<xsl:output method="xml"/>

	<xsl:function name="gsoc:prepTitle">
		<xsl:param name="title" as="xs:string"/>
		<xsl:sequence
			select="replace($title, ':', '')" />
	</xsl:function>
	<xsl:function name="gsoc:getHref">
		<xsl:param name="name" as="xs:string"/>
		<xsl:sequence
			select="gsoc:prepTitle(replace(concat('#GSoC2026Ideaslist-', $name), ' ', ''))" />
	</xsl:function>
	<xsl:template match="/">
	<rss>
	<channel>
		<xsl:for-each select="rss/channel/item"> <!--  rss/channel/item[status[@id='1']]  -->
			<xsl:variable name="project">
				<xsl:choose>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Airflow']) &gt; 0">
						<xsl:value-of select="'AIRFLOW'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'APISIX']) &gt; 0">
						<xsl:value-of select="'APISIX'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Beam']) &gt; 0">
						<xsl:value-of select="'BEAM'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'CloudStack']) &gt; 0">
						<xsl:value-of select="'CLOUDSTACK'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'CouchDB']) &gt; 0">
						<xsl:value-of select="'COUCHDB'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'DolphinScheduler']) &gt; 0">
						<xsl:value-of select="'DOLPHINSCHEDULER'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Doris']) &gt; 0">
						<xsl:value-of select="'DORIS'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'EventMesh']) &gt; 0">
						<xsl:value-of select="'EVENTMESH'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'fory']) &gt; 0">
						<xsl:value-of select="'FORY'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'HertzBeat']) &gt; 0">
						<xsl:value-of select="'HERTZBEAT'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'HugeGraph']) &gt; 0">
						<xsl:value-of select="'HUGEGRAPH'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'IoTDB']) &gt; 0">
						<xsl:value-of select="'IOTDB'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Kvrocks']) &gt; 0">
						<xsl:value-of select="'KVROCKS'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'LuceneNet']) &gt; 0">
						<xsl:value-of select="'LUCENENET'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Mahout']) &gt; 0">
						<xsl:value-of select="'MAHOUT'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'OpenDAL']) &gt; 0">
						<xsl:value-of select="'OPENDAL'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'RocketMQ']) &gt; 0">
						<xsl:value-of select="'ROCKETMQ'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Seata']) &gt; 0">
						<xsl:value-of select="'SEATA'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'SeaTunnel']) &gt; 0">
						<xsl:value-of select="'SEATUNNEL'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'ShardingSphere']) &gt; 0">
						<xsl:value-of select="'SHARDINGSPHERE'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'ShenYu']) &gt; 0">
						<xsl:value-of select="'SHENYU'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'SkyWalking']) &gt; 0">
						<xsl:value-of select="'SKYWALKING'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'StreamPipes']) &gt; 0">
						<xsl:value-of select="'STREAMPIPES'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Teaclave']) &gt; 0">
						<xsl:value-of select="'TEACLAVE'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'TrafficControl']) &gt; 0">
						<xsl:value-of select="'TRAFFICCONTROL'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="project/@key"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="projectName">
				<xsl:choose>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Airflow']) &gt; 0">
						<xsl:value-of select="'Airflow'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'APISIX']) &gt; 0">
						<xsl:value-of select="'APISIX'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Beam']) &gt; 0">
						<xsl:value-of select="'Beam'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'CloudStack']) &gt; 0">
						<xsl:value-of select="'CloudStack'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'CouchDB']) &gt; 0">
						<xsl:value-of select="'CouchDB'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'DolphinScheduler']) &gt; 0">
						<xsl:value-of select="'DolphinScheduler'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Doris']) &gt; 0">
						<xsl:value-of select="'Doris'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'EventMesh']) &gt; 0">
						<xsl:value-of select="'EventMesh'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'fory']) &gt; 0">
						<xsl:value-of select="'Apache Fory'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'HertzBeat']) &gt; 0">
						<xsl:value-of select="'HertzBeat'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'HugeGraph']) &gt; 0">
						<xsl:value-of select="'HugeGraph'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'IoTDB']) &gt; 0">
						<xsl:value-of select="'IoTDB'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Kvrocks']) &gt; 0">
						<xsl:value-of select="'Kvrocks'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'LuceneNet']) &gt; 0">
						<xsl:value-of select="'Lucene.NET'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Mahout']) &gt; 0">
						<xsl:value-of select="'Mahout'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'OpenDAL']) &gt; 0">
						<xsl:value-of select="'OpenDAL'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'RocketMQ']) &gt; 0">
						<xsl:value-of select="'RocketMQ'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Seata']) &gt; 0">
						<xsl:value-of select="'Seata'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'SeaTunnel']) &gt; 0">
						<xsl:value-of select="'SeaTunnel'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'ShardingSphere']) &gt; 0">
						<xsl:value-of select="'ShardingSphere'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'ShenYu']) &gt; 0">
						<xsl:value-of select="'ShenYu'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'SkyWalking']) &gt; 0">
						<xsl:value-of select="'SkyWalking'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'StreamPipes']) &gt; 0">
						<xsl:value-of select="'StreamPipes'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'Teaclave']) &gt; 0">
						<xsl:value-of select="'Teaclave'"/>
					</xsl:when>
					<xsl:when test="project/@key='GSOC' and count(labels/label[text() = 'TrafficControl']) &gt; 0">
						<xsl:value-of select="'TrafficControl'"/>
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
			<xsl:variable name="projectSize">
				<xsl:choose>
					<xsl:when test="count(labels/label[text() = 'part-time']) &gt; 0">
						<xsl:value-of select="'~175 hour (medium)'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'~350 hour (large)'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<item>
				<project key="{$project}" href="{gsoc:getHref($projectName)}"><xsl:value-of select="gsoc:prepTitle($projectName)"/></project>
				<xsl:copy-of select="title"/>
				<xsl:copy-of select="link"/>
				<summary href="{gsoc:getHref(summary/text())}"><xsl:value-of select="gsoc:prepTitle(summary/text())"/></summary>
				<xsl:copy-of select="description"/>
				<difficulty><xsl:value-of select="$difficulty"/></difficulty>
				<mentor username="{$mentorLogin}"><xsl:value-of select="$mentorName"/></mentor>
				<size><xsl:value-of select="$projectSize"/></size>
			</item>
		</xsl:for-each>
	</channel>
	</rss>
	</xsl:template>
</xsl:stylesheet>

