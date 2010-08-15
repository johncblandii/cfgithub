<!--- 
 IssuesTest.cfc
 @author johncblandii
 @description Tests issues GitHub calls
 --->
<cfcomponent extends="tests.TestCore">
	<cfset this.testIssueId = 1 />
	<cfset this.testCFC = "githubissues" />

<!--- ISSUES --->
	<cffunction name="listAsDefault" access="public" returntype="void">
		<cfset var result = this.github.listIssues('open') />
		<cfset debug(result) />
		<cfset assertIsStruct(result, "not json") />
	</cffunction>
	
	<cffunction name="listAsXML" access="public" returntype="void">
		<cfset var result = this.github.listIssues('open', 'xml') />
		<cfset debug(result) />
		<cfset assertIsXMLDoc(result, "not xml") />
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
		<cfset var result = this.github.editIssue(argumentCollection={id=this.testIssueId, title='[edited] cfgithub issue ' & randrange(1, 100), body='here is a test issue from cfgithub unit tests'}) />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
<!--- LABELS --->
	<cffunction name="listLabels">
		<cfset var result = this.github.listLabels() />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="addLabel">
		<cfset var result = this.github.addLabel(this.testIssueId, "Enhancement") />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="removeLabel">
		<cfset var result = this.github.removeLabel(this.testIssueId, "Enhancement") />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>

<!--- COMMENTS --->
	<cffunction name="addIssueComment">
		<cfset var result = this.github.addIssueComment(this.testIssueId, "Enhancement") />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
</cfcomponent>