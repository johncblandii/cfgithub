<cfinclude template="_init.cfm" />

<cfdump expand="false" label="Open - default" var="#github.listIssues('open')#" />
<br />
<cfdump expand="false" label="Closed - xml" var="#github.listIssues('closed', 'xml')#" />
<br />
<cfdump expand="false" label="Open - yaml" var="#github.listIssues('open', 'yaml')#" />