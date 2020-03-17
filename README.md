# gsoc
XSLT for `Jira -> Ideas List` converter


# How to
1. open JIRA list https://issues.apache.org/jira/browse/?jql=status%20in%20(Open%2C%20Reopened%2C%20New)%20AND%20labels%20%3D%20gsoc2020
2. Export Issues to XML
3. Run `saxonb-xslt -s:SearchRequest.xml -xsl:preprocess.xslt  > xml.xml`
4. Run `saxonb-xslt -s:xml.xml -xsl:ideas.xslt  > test.html`

