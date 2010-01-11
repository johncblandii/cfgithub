<!---
	Name         : GitHubUsers
	Author       : John C. Bland II
	Created      : January 11, 2010
	Last Updated : 1/11/2010
	Purpose		 : Users integration for GitHub API (see - http://develop.github.com/p/users.html)
--->
<cfcomponent displayname="GitHubUsers" extends="GitHubCore" output="false">
	<cfset variables.usersUrl = variables.baseUrl & "/user/{verb}" />

<!--- PRIVATE --->
	<cffunction name="$prepUsersUrl" access="private">
		<cfargument name="targetUrl" type="string" required="true" />
		<cfargument name="verb" type="string" required="true" />
		<cfset arguments.targetUrl = variables.issuesUrl & arguments.targetUrl />
		<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{verb}", arguments.verb, "all") />
		<cfreturn arguments.targetUrl />
	</cffunction>

<!--- SEARCH --->
	
	
<!--- NETWORK --->
	

<!--- WATCHING --->
</cfcomponent>