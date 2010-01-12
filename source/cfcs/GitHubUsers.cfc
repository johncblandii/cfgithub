<!---
	Name         : GitHubUsers
	Author       : John C. Bland II
	Created      : January 11, 2010
	Last Updated : 1/11/2010
	Purpose		 : Users integration for GitHub API (see - http://develop.github.com/p/users.html)
	
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