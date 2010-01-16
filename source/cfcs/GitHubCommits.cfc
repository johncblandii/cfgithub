<!---
	Name         : GitHubCommits
	Author       : John C. Bland II
	Created      : January 11, 2010
	Last Updated : 1/11/2010
	Purpose		 : Commits integration for GitHub API (see - http://develop.github.com/p/commits.html)
	
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
<cfcomponent displayname="GitHubCommits" extends="GitHubCore" output="false">
	<cfset variables.commitsUrl = variables.baseUrl & "/commits/{verb}/{user}/{repo}/" />

<!--- PRIVATE --->
	<cffunction name="$prepCommitsUrl" access="private">
		<cfargument name="targetUrl" type="string" required="true" />
		<cfargument name="verb" type="string" required="true" />
		<cfset arguments.targetUrl = variables.commitsUrl & arguments.targetUrl />
		<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{verb}", arguments.verb, "all") />
		<cfreturn arguments.targetUrl />
	</cffunction>
	
<!--- COMMITS --->
	<cffunction name="listCommitsOnBranch" access="public" hint="Lists Commits on a Branch">
		<cfargument name="branch" required="true" type="string" hint="[branch name] - (ex: master, branch1, etc)" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepCommitsUrl(arguments.branch, "list"), format=arguments.format) />
	</cffunction>
	
	<cffunction name="listCommitsForFile" access="public" hint="Lists Commits for a File">
		<cfargument name="filePath" required="true" type="string" hint="[branch]/path/to/filename.ext (ex - master/README)" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepCommitsUrl(arguments.filePath, "list"), format=arguments.format) />
	</cffunction>
	
	<cffunction name="getCommit" access="public" hint="Shows a Specific Commit">
		<cfargument name="sha" required="true" type="string" hint="See github.com for retrieving a commits 'sha''" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepCommitsUrl(arguments.sha, "show"), format=arguments.format) />
	</cffunction>
</cfcomponent>