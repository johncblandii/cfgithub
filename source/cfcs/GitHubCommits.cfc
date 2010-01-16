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
	<cffunction name="listCommitsOnBranch" access="public" hint="Listing Commits on a Branch">
		<cfargument name="branch" required="true" type="string" hint="[branch name]" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
	</cffunction>
	
	<cffunction name="listCommitsForFile" access="public" hint="Listing Commits for a File">
		<cfargument name="filePath" required="true" type="string" hint="[branch]/path/to/filename.ext" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
	</cffunction>
	
	<cffunction name="getCommit" access="public" hint="Listing Commits for a File">
		<cfargument name="sha" required="true" type="string" hint="See github.com for retrieving a commits 'sha''" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
	</cffunction>
</cfcomponent>