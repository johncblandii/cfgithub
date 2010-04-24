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
	
	<cffunction name="listUsersRepos" access="public" returntype="void">
		<cfset var result = this.github.listUsersRepos('johncblandii') />
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
	
<!--- COLLABORATORS --->
	<cffunction name="listRepoCollaborators" access="public" returntype="void">
		<cfset var result = this.github.listRepoCollaborators('johncblandii', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="addRepoCollaborators" access="public" returntype="void">
		<cfset var result = this.github.addRepoCollaborators('cfgithubtester', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="removeRepoCollaborators" access="public" returntype="void">
		<cfset var result = this.github.removeRepoCollaborators('cfgithubtester', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
<!--- DEPLOY KEYS --->
	<cffunction name="listRepoDeployKeys" access="public">
		<cfset var result = this.github.listRepoDeployKeys('cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="addRepoDeployKey" access="public" hint="This fail silently unless you pass a valid ssh key">
		<cfset var result = this.github.addRepoDeployKey('cfgithub', 'key'&randrange(1, 10), '1234567890') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="removeRepoDeployKey" access="public" hint="This will fail unless you pass in a valid id">
		<cfset var result = this.github.removeRepoDeployKey('cfgithub', '1234') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
<!--- NETWORK --->
	<cffunction name="getRepoNetwork" access="public">
		<cfset var result = this.github.getRepoNetwork('johncblandii', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
<!--- LANGUAGES --->
	<cffunction name="listRepoLanguages" access="public">
		<cfset var result = this.github.listRepoLanguages('johncblandii', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
<!--- REFS --->
	<cffunction name="listRepoTags" access="public">
		<cfset var result = this.github.listRepoTags('johncblandii', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
	
	<cffunction name="listRepoBranches" access="public">
		<cfset var result = this.github.listRepoBranches('johncblandii', 'cfgithub') />
		<cfset debug(result) />
		<cfset assertTrue(isStruct(result)) />
	</cffunction>
</cfcomponent>