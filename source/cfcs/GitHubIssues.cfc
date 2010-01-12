<!---
	Name         : GitHubIssues
	Author       : John C. Bland II
	Created      : January 11, 2010
	Last Updated : 1/11/2010
	Purpose		 : Issues integration for GitHub API (see - http://develop.github.com/p/issues.html)
	
	LICENSE 
	Copyright 2010 John C. Bland II
	
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
	   http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
--->
<cfcomponent displayname="GitHubIssues" extends="GitHubCore" output="false">
	<cfset variables.issuesUrl = variables.baseUrl & "/issues/{verb}/{user}/{repo}/" />

<!--- PRIVATE --->
	<cffunction name="$prepIssuesUrl" access="private">
		<cfargument name="targetUrl" type="string" required="true" />
		<cfargument name="verb" type="string" required="true" />
		<cfargument name="state" type="string" default="" hint="'open' or 'closed'" />
		<cfset arguments.targetUrl = variables.issuesUrl & arguments.targetUrl />
		<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{verb}", arguments.verb, "all") />
		<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{state}", arguments.state, "all") />
		<cfreturn arguments.targetUrl />
	</cffunction>

<!--- ISSUES --->
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
		<cfreturn $postData(targetUrl=$prepIssuesUrl("", "open"), format=arguments.format, postArgs={title=arguments.title, body=arguments.body}) />
	</cffunction>
	
	<cffunction name="editIssue" access="public" returntype="any">
		<cfargument name="id" type="numeric" required="true" hint="Issue ID from GitHub" />
		<cfargument name="title" type="string" required="true" hint="any search term you want to find" />
		<cfargument name="body" type="string" required="true" hint="'open' or 'closed'" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfset var targetUrl = arguments.id />
		<cfreturn $postData(targetUrl=$prepIssuesUrl(targetUrl, "edit"), format=arguments.format, postArgs={title=arguments.title, body=arguments.body}) />
	</cffunction>
	
	<cffunction name="closeIssue" access="public" returntype="any">
		<cfargument name="id" type="numeric" required="true" hint="Issue ID from GitHub" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfset var targetUrl = arguments.id />
		<cfreturn $postData(targetUrl=$prepIssuesUrl(targetUrl, "close"), format=arguments.format, postArgs={}) />
	</cffunction>
	
	<cffunction name="reopenIssue" access="public" returntype="any">
		<cfargument name="id" type="numeric" required="true" hint="Issue ID from GitHub" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfset var targetUrl = arguments.id />
		<cfreturn $postData(targetUrl=$prepIssuesUrl(targetUrl, "reopen"), format=arguments.format, postArgs={}) />
	</cffunction>

<!--- LABELS --->
	<cffunction name="listLabels" access="public" returntype="any">
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepIssuesUrl("", "labels"), format=arguments.format) />
	</cffunction>
	
	<cffunction name="addLabel" access="public" returntype="Any">
		<cfargument name="id" type="numeric" required="true" hint="Issue ID from GitHub" />
		<cfargument name="label" type="string" required="true" hint="Label to add" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfset var targetUrl = arguments.label & "/" & arguments.id />
		<cfreturn $getData(targetUrl=$prepIssuesUrl(targetUrl, "label/add"), format=arguments.format) />
	</cffunction>
	
	<cffunction name="removeLabel" access="public" returntype="Any">
		<cfargument name="id" type="numeric" required="true" hint="Issue ID from GitHub" />
		<cfargument name="label" type="string" required="true" hint="Label to remove" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfset var targetUrl = arguments.label & "/" & arguments.id />
		<cfreturn $getData(targetUrl=$prepIssuesUrl(targetUrl, "label/remove"), format=arguments.format) />
	</cffunction>

<!--- COMMENTS --->
	<cffunction name="addIssueComment" access="public" returntype="any">
		<cfargument name="id" type="numeric" required="true" hint="Issue ID from GitHub" />
		<cfargument name="comment" type="string" required="true" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $postData(targetUrl=$prepIssuesUrl(arguments.id, "comment"), format=arguments.format, postArgs={comment=comment}) />
	</cffunction>
</cfcomponent>