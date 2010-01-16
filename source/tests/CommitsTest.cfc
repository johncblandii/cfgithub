<!--- 
 IssuesTest.cfc
 @author johncblandii
 @description Tests issues GitHub calls
 --->
<cfcomponent extends="tests.TestCore">
	<cfset this.testCFC = "githubcommits" />
	
	<cffunction name="listCommitsOnBranch" access="public" returntype="void">
		<cfset var result = this.github.listCommitsOnBranch('master') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="listCommitsForFile" access="public" returntype="void">
		<cfset var result = this.github.listCommitsForFile('master/README') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="getCommit" access="public" returntype="void">
		<cfset var result = this.github.getCommit('1d710d03a17a266d785b78d70aacdc28b0864994') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
</cfcomponent>