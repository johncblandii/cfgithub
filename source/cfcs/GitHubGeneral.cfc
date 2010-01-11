<!---
	Name         : GitHubGeneral
	Author       : John C. Bland II
	Created      : January 11, 2010
	Last Updated : 1/11/2010
	Purpose		 : General integration for GitHub API (see - http://develop.github.com/p/general.html)
				 : ...and also covers Git Object APi (see - http://develop.github.com/p/object.html)
				 : ...and Network API (see - http://develop.github.com/p/network.html)
--->
<cfcomponent displayname="GitHubGeneral" extends="GitHubCore" output="false">
<!--- PRIVATE --->
	<cffunction name="$prepGeneralUrl" access="private">
		<cfargument name="targetUrl" type="string" required="true" />
		<cfreturn variables.baseUrl & "/" & arguments.targetUrl  />
	</cffunction>

<!--- GENERAL --->
	<cffunction name="authenticate" access="public" returntype="any">
		<cfargument name="user" type="string" default="#variables.user#" hint="GitHub username" />
		<cfargument name="token" type="string" default="#variables.token#" hint="GitHub token" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepGeneralUrl("user/show/{user}"), format=arguments.format) />
	</cffunction>
	
<!--- NETWORK --->


<!--- Git OBJECT --->
</cfcomponent>