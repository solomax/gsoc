# gsoc
XSLT for `Jira -> Ideas List` converter


# How to
1. open JIRA list https://issues.apache.org/jira/browse/AIRFLOW-5761?jql=resolution%20%3D%20Unresolved%20AND%20labels%20%3D%20gsoc2020%20ORDER%20BY%20project%20ASC%2C%20status%20DESC
2. Export Issues to XML
3. Run `saxonb-xslt -s:SearchRequest.xml -xsl:preprocess.xslt  > xml.xml`
4. Run `saxonb-xslt -s:xml.xml -xsl:ideas.xslt  > test.html`

