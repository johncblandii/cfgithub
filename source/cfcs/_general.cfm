<!--- 
	This page holds the general API functions.
	(see - http://develop.github.com/p/general.html);
--->

<cffunction name="$prepGeneralUrl" access="private">
	<cfargument name="targetUrl" type="string" required="true" />
	<cfreturn variables.baseUrl & "/" & arguments.targetUrl  />
</cffunction>

<cffunction name="authenticate" access="public" returntype="any">
	<cfargument name="user" type="string" default="#variables.user#" hint="GitHub username" />
	<cfargument name="token" type="string" default="#variables.token#" hint="GitHub token" />
	<cfargument name="format" type="string" default="#variables.format#" />
	<cfreturn $getData(targetUrl=$prepGeneralUrl("user/show/{user}"), format=arguments.format) />
</cffunction>