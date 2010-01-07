<!--- 
	This page holds the issues API functions.
	(see - http://develop.github.com/p/issues.html);
--->

<cfset variables.issuesUrl = variables.baseUrl & "/issues/" />

<cffunction name="$prepIssuesUrl" access="private">
	<cfargument name="targetUrl" type="string" required="true" />
	<cfargument name="state" type="string" required="true" hint="'open' or 'closed'" />
	<cfset arguments.targetUrl = variables.issuesUrl & rereplace(arguments.targetUrl, "{state}", arguments.state, "all") />
	<cfreturn arguments.targetUrl />
</cffunction>

<cffunction name="listIssues" access="public" returntype="any">
	<cfargument name="state" type="string" required="true" hint="'open' or 'closed'" />
	<cfargument name="format" type="string" required="false" default="#variables.format#" />
	<cfreturn $getData(targetUrl=$prepIssuesUrl("list/{username}/{repo}/{state}", arguments.state), format=arguments.format) />
</cffunction>

<cffunction name="searchIssues" access="public" returntype="Any">
	<cfargument name="searchterm" type="string" required="true" hint="any search term you want to find" />
	<cfargument name="state" type="string" required="true" hint="'open' or 'closed'" />
	<cfargument name="format" type="string" required="false" default="#variables.format#" />
	<cfset var targetUrl = rereplace("search/{user}/{repo}/{state}/{search_term}", "{search_term}", arguments.state, "all") />
	<cfreturn $getData(targetUrl=$prepIssuesUrl(targetUrl, arguments.state), format=arguments.format) />
</cffunction>