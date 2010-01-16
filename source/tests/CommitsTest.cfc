<!--- 
 IssuesTest.cfc
 @author johncblandii
 @description Tests issues GitHub calls
 --->
<cfcomponent extends="tests.TestCore">
	<cfset this.testCFC = "githubcommits" />
	
	<cffunction name="listCommitsOnBranch" access="public" returntype="void">
		<cfset var result = this.github.listCommitsOnBranch('') />
		<cfset debug(result) />
		<cfset assertTrue(result) />
	</cffunction>
	
	<cffunction name="listCommitsForFile" access="public" returntype="void">
		<cfset var result = this.github.listCommitsForFile('') />
		<cfset debug(result) />
		<cfset assertTrue(result) />
	</cffunction>
	
	<cffunction name="getCommit" access="public" returntype="void">
		<cfset var result = this.github.getCommit('') />
		<cfset debug(result) />
		<cfset assertTrue(result) />
	</cffunction>
</cfcomponent>