<!--- 
 ReposTest.cfc
 @author johncblandii
 @description Tests repo GitHub calls
 --->
<cfcomponent extends="tests.TestCore">
	<cfset this.testCFC = "githubrepos" />
	
	<cffunction name="searchRepos" access="public" returntype="void">
		<cfset var result = this.github.searchRepos('cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="getRepoInfo" access="public" returntype="void">
		<cfset var result = this.github.getRepoInfo('johncblandii', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="getUsersRepos" access="public" returntype="void">
		<cfset var result = this.github.getUsersRepos('johncblandii') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="watchRepo" access="public" returntype="void">
		<cfset var result = this.github.watchRepo('johncblandii', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="unwatchRepo" access="public" returntype="void">
		<cfset var result = this.github.unwatchRepo('johncblandii', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
</cfcomponent>