<cfdump expand="false" label="Open - default" var="#application.github.listIssues('open')#" />
<br />
<cfdump expand="false" label="Closed - xml" var="#application.github.listIssues('closed', 'xml')#" />
<br />
<cfdump expand="false" label="Open - yaml" var="#application.github.listIssues('open', 'yaml')#" />