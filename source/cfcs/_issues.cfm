<!--- 
	This page holds the issues API functions.
	(see - http://develop.github.com/p/issues.html);
--->

<cfset variables.issuesUrl = variables.baseUrl & "/issues/{verb}/{user}/{repo}/" />

<cffunction name="$prepIssuesUrl" access="private">
	<cfargument name="targetUrl" type="string" required="true" />
	<cfargument name="verb" type="string" required="true" />
	<cfargument name="state" type="string" default="" hint="'open' or 'closed'" />
	<cfset arguments.targetUrl = variables.issuesUrl & arguments.targetUrl />
	<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{verb}", arguments.verb, "all") />
	<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{state}", arguments.state, "all") />
	<cfreturn arguments.targetUrl />
</cffunction>

<cffunction name="listIssues" access="public" returntype="any">
	<cfargument name="state" type="string" required="true" hint="'open' or 'closed'" />
	<cfargument name="format" type="string" default="#variables.format#" />
	<cfreturn $getData(targetUrl=$prepIssuesUrl("{state}", "list", arguments.state), format=arguments.format) />
</cffunction>

<cffunction name="searchIssues" access="public" returntype="Any">
	<cfargument name="searchterm" type="string" required="true" hint="any search term you want to find" />
	<cfargument name="state" type="string" required="true" hint="'open' or 'closed'" />
	<cfargument name="format" type="string" default="#variables.format#" />
	<cfset var targetUrl = rereplace("{state}/{search_term}", "{search_term}", arguments.state, "all") />
	<cfreturn $getData(targetUrl=$prepIssuesUrl(targetUrl, "search", arguments.state), format=arguments.format) />
</cffunction>

<cffunction name="openIssue" access="public" returntype="any">
	<cfargument name="title" type="string" required="true" hint="any search term you want to find" />
	<cfargument name="body" type="string" required="true" hint="'open' or 'closed'" />
	<cfargument name="format" type="string" default="#variables.format#" />
	<cfreturn $postData(targetUrl=$prepIssuesUrl("", "open"), format=arguments.format, postArgs=arguments) />
</cffunction>

<cffunction name="editIssue" access="public" returntype="any">
	<cfargument name="id" type="numeric" required="true" hint="Issue ID from GitHub" />
	<cfargument name="title" type="string" required="true" hint="any search term you want to find" />
	<cfargument name="body" type="string" required="true" hint="'open' or 'closed'" />
	<cfargument name="format" type="string" default="#variables.format#" />
	<cfset var targetUrl = rereplace("{id}", "{id}", arguments.id, "all") />
	<cfreturn $postData(targetUrl=$prepIssuesUrl(targetUrl, "edit"), format=arguments.format, postArgs=arguments) />
</cffunction>

<cffunction name="closeIssue" access="public" returntype="any">
	<cfargument name="id" type="numeric" required="true" hint="Issue ID from GitHub" />
	<cfargument name="format" type="string" default="#variables.format#" />
	<cfset var targetUrl = rereplace("{id}", "{id}", arguments.id, "all") />
	<cfreturn $postData(targetUrl=$prepIssuesUrl(targetUrl, "close"), format=arguments.format, postArgs={}) />
</cffunction>

<cffunction name="reopenIssue" access="public" returntype="any">
	<cfargument name="id" type="numeric" required="true" hint="Issue ID from GitHub" />
	<cfargument name="format" type="string" default="#variables.format#" />
	<cfset var targetUrl = rereplace("{id}", "{id}", arguments.id, "all") />
	<cfreturn $postData(targetUrl=$prepIssuesUrl(targetUrl, "reopen"), format=arguments.format, postArgs={}) />
</cffunction>