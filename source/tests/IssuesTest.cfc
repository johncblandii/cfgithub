<!--- 
 IssuesTest.cfc
 @author johncblandii
 @description Tests issues GitHub calls
 --->
<cfcomponent extends="tests.TestCore">
	<cffunction name="getAsDefault" access="public" returntype="void">
		<cfset var result = this.github.listIssues('open') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result), "not json") />
	</cffunction>
	
	<cffunction name="getAsXML" access="public" returntype="void">
		<cfset var result = this.github.listIssues('open', 'xml') />
		<cfset debug(result) />
		<cfset assertTrue(isXML(result), "not xml") />
	</cffunction>
	
	<cffunction name="getAsYAML" access="public" returntype="void">
		<cfset var result = this.github.listIssues('open', 'yaml') />
		<cfset debug(result) />
		<cfset assertTrue(len(result) GT 0 && result CONTAINS "issues") />
	</cffunction>
	
	<cffunction name="getAsDefaultClosed" access="public" returntype="void">
		<cfset var result = this.github.listIssues('closed') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="searchForTestOpenAsDefault" access="public" returntype="void" displayname="search blah">
		<cfset var result = this.github.searchIssues('test', 'open') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
</cfcomponent>
