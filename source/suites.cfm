<cfdirectory name="suites" action="list" directory="#ExpandPath('./')#" filter="*Suite.cfm">
<cfoutput query="suites">
	<a href="#name#">#name#</a><br />
</cfoutput>