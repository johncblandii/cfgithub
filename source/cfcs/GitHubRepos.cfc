<!---
	Name         : GitHubRepos
	Author       : John C. Bland II
	Created      : January 11, 2010
	Last Updated : 1/11/2010
	Purpose		 : Repository integration for GitHub API (see - http://develop.github.com/p/repositories.html)
	
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
<cfcomponent displayname="GitHubRepos" extends="GitHubCore" output="false">
	<cfset variables.reposUrl = variables.baseUrl & "/repos/{verb}/" />

<!--- PRIVATE --->
	<cffunction name="$prepReposUrl" access="private">
		<cfargument name="targetUrl" type="string" required="true" />
		<cfargument name="verb" type="string" required="true" />
		<cfset arguments.targetUrl = variables.reposUrl & arguments.targetUrl />
		<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{verb}", arguments.verb, "all") />
		<cfreturn arguments.targetUrl />
	</cffunction>
	
<!--- REPOS --->
	<cffunction name="searchRepos" access="public" hint="Searching Repositories">
		<cfargument name="query" required="true" type="string" hint="Search query" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepReposUrl(arguments.query, "search"), format=arguments.format) />
	</cffunction>
	
	<cffunction name="getRepoInfo" access="public" hint="Gets repo info">
		<cfargument name="user" type="string" default="#variables.user#" hint="GitHub username" />
		<cfargument name="repo" type="string" default="#variables.repo#" hint="Repo name" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepReposUrl(arguments.user&"/"&arguments.repo, "show"), format=arguments.format) />
	</cffunction>
	
	<cffunction name="getUsersRepos" access="public" hint="Gets a list of users repos">
		<cfargument name="user" type="string" default="#variables.user#" hint="GitHub username" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepReposUrl(arguments.user, "show"), format=arguments.format) />
	</cffunction>
	
	<cffunction name="watchRepo" access="public" hint="Watches a repo">
		<cfargument name="user" type="string" default="#variables.user#" hint="GitHub username" />
		<cfargument name="repo" type="string" default="#variables.repo#" hint="Repo name" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepReposUrl(arguments.user&"/"&arguments.repo, "watch"), format=arguments.format) />
	</cffunction>
	
	<cffunction name="unwatchRepo" access="public" hint="Unwatches a repo">
		<cfargument name="user" type="string" default="#variables.user#" hint="GitHub username" />
		<cfargument name="repo" type="string" default="#variables.repo#" hint="Repo name" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn $getData(targetUrl=$prepReposUrl(arguments.user&"/"&arguments.repo, "unwatch"), format=arguments.format) />
	</cffunction>
	
<!--- STUB METHODS --->
	<cffunction name="forkRepo" access="public" hint="Creates a repo fork">
		<cfargument name="user" type="string" default="#variables.user#" hint="GitHub username" />
		<cfargument name="repo" type="string" default="#variables.repo#" hint="Repo name" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
		<!---
		<cfreturn $getData(targetUrl=$prepReposUrl(arguments.user&"/"&arguments.repo, "fork"), format=arguments.format) />
		--->
	</cffunction>
	
	<cffunction name="createRepo" access="public" hint="Creates a repo">
		<cfargument name="name" type="string" required="true" hint="The name of the new repo" />
		<cfargument name="description" type="string" required="true" hint="Description of the repo" />
		<cfargument name="homepage" type="string" required="true" hint="Repo homepage" />
		<cfargument name="public" type="boolean" required="true" hint="Public or private; true or false" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
		<!---
		<cfreturn $getData(targetUrl=$prepReposUrl(arguments.user&"/"&arguments.repo, "fork"), format=arguments.format, postArgs={//TODO}) />
		--->
	</cffunction>
	
	<cffunction name="getDeleteRepoToken" access="public" hint="Initiates a delete request and returns a delete token. See completeDeleteRepo method.">
		<cfargument name="repo" type="string" default="#variables.repo#" hint="Repo name" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
		<!---
		<cfreturn $postData(targetUrl=$prepReposUrl(arguments.repo, "fork"), format=arguments.format, postArgs={}) />
		--->
	</cffunction>
	
	<cffunction name="completeDeleteRepo" access="public" hint="Completes a delete by the delete token returned from getDeleteRepoToken.">
		<cfargument name="token" type="string" required="true" hint="Token received from getDeleteRepoToken" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
		<!---
		<cfreturn $postData(targetUrl=$prepReposUrl(arguments.repo, "fork"), format=arguments.format, postArgs={delete_token=arguments.token}) />
		--->
	</cffunction>
	
	<cffunction name="setRepoVisibility" access="public" hint="Sets the repo visibility">
		<cfargument name="repo" type="string" default="#variables.repo#" hint="Repo name" />
		<cfargument name="visible" type="boolean" hint="Sets the visibility to public or private" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
		<!---
		<cfset var verb = "private" />
		<cfif arguments.visible>
			<cfset verb = "public" />
		</cfif>
		<cfreturn $postData(targetUrl=$prepReposUrl(verb&"/"&arguments.repo, "set"), format=arguments.format, postArgs={}) />
		--->
	</cffunction>
	
	<cffunction name="listRepoDeployKeys" access="public" hint="List deploy keys for a repo">
		<cfargument name="repo" type="string" default="#variables.repo#" hint="Repo name" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
		<!---
		<cfreturn $getData(targetUrl=$prepReposUrl(arguments.repo, "keys"), format=arguments.format) />
		--->
	</cffunction>
	
	<cffunction name="addRepoDeployKey" access="public" hint="Adds a deploy key to a repo">
		<cfargument name="repo" type="string" default="#variables.repo#" hint="Repo name" />
		<cfargument name="title" type="string" required="true" hint="Deploy key title" />
		<cfargument name="key" type="string" required="true" hint="Deploy key" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
		<!---
		<cfreturn $postData(targetUrl=$prepReposUrl(arguments.repo&"/add", "key"), format=arguments.format, postArgs={title=arguments.title, key=arguments.key}) />
		--->
	</cffunction>
	
	<cffunction name="removeRepoDeployKey" access="public" hint="Removes a deploy key from a repo">
		<cfargument name="repo" type="string" default="#variables.repo#" hint="Repo name" />
		<cfargument name="id" type="string" required="true" hint="‘id’ variable with the key ID returned from the public listing or key creation" />
		<cfargument name="format" type="string" default="#variables.format#" />
		<cfreturn true />
		<!---
		<cfreturn $postData(targetUrl=$prepReposUrl(arguments.repo&"/remove", "key"), format=arguments.format, postArgs={id=arguments.id}) />
		--->
	</cffunction>
	
	<!---
		TODO
		Collaborators
		Network
		Language
		Refs
	--->
</cfcomponent>