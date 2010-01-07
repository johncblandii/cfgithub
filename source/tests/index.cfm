<!--- Simple Test scripts --->

<cfdirectory name="tests" action="list" filter="*-*.cfm" type="file" directory="#ExpandPath('./')#" />

<cfoutput query="tests">
	<a href="#name#">#name#</a><br />
</cfoutput>