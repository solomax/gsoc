# gsoc
XSLT for `Jira -> Ideas List` converter


# How to
1. open JIRA list https://issues.apache.org/jira/issues/?jql=labels%20in%20(gsoc2021)%20AND%20labels%20in%20(mentor%2C%20Mentor)%20and%20resolution%20%3D%20Unresolved%20ORDER%20BY%20project%20DESC
2. Export Issues to XML

OR

`wget "https://issues.apache.org/jira/sr/jira.issueviews:searchrequest-xml/temp/SearchRequest.xml?jqlQuery=labels+in+%28gsoc2021%29+AND+labels+in+%28mentor%2C+Mentor%29+and+resolution+%3D+Unresolved+ORDER+BY+project+DESC&tempMax=100000" -O SearchRequest.xml`

3. Run `saxonb-xslt -s:SearchRequest.xml -xsl:preprocess.xslt  > xml.xml && saxonb-xslt -s:xml.xml -xsl:ideas.xslt  > test.html`

