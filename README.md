# gsoc
XSLT for `Jira -> Ideas List` converter


# How to
1. open JIRA list https://issues.apache.org/jira/issues/?jql=labels+%3D+gsoc2020
2. Export Issues to XML
3. Run `saxonb-xslt -s:SearchRequest.xml -xsl:preprocess.xslt  > xml.xml`
4. Run `saxonb-xslt -s:xml.xml -xsl:ideas.xslt  > test.html`

