<!--- 
 IssuesTest.cfc
 @author johncblandii
 @description Tests issues GitHub calls
 --->
<cfcomponent extends="tests.TestCore">
	<cfset this.testIssueId = 1 />

	<cffunction name="listAsDefault" access="public" returntype="void">
		<cfset var result = this.github.listIssues('open') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result), "not json") />
	</cffunction>
	
	<cffunction name="listAsXML" access="public" returntype="void">
		<cfset var result = this.github.listIssues('open', 'xml') />
		<cfset debug(result) />
		<cfset assertTrue(isXML(result), "not xml") />
	</cffunction>
	
	<cffunction name="listAsYAML" access="public" returntype="void">
		<cfset var result = this.github.listIssues('open', 'yaml') />
		<cfset debug(result) />
		<cfset assertTrue(len(result) GT 0 && result CONTAINS "issues") />
	</cffunction>
	
	<cffunction name="listAsDefaultClosed" access="public" returntype="void">
		<cfset var result = this.github.listIssues('closed') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="searchForTestOpenAsDefault" access="public" returntype="void" displayname="search blah">
		<cfset var result = this.github.searchIssues('test', 'open') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="openIssue">
		<cfset var result = this.github.openIssue(argumentCollection={title='cfgithub issue ' & randrange(1, 100), body='here is a test issue from cfgithub unit tests'}) />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="closeIssue">
		<cfset var result = this.github.closeIssue(this.testIssueId) />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="reopenIssue">
		<cfset var result = this.github.reopenIssue(this.testIssueId) />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="editIssue">
		<cfset var result = this.github.editIssue(argumentCollection={id=this.testIssueId, title='cfgithub issue ' & randrange(1, 100), body='here is a test issue from cfgithub unit tests'}) />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
</cfcomponent>
