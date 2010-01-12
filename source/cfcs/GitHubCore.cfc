<!---
	Name         : GitHubCore
	Author       : John C. Bland II
	Created      : January 7, 2010
	Last Updated : 1/11/2010
	Purpose		 : Core GitHub API functionality; intended to be overwritten
	
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
<cfcomponent displayname="GitHub API" hint="Interface to GitHub API classes" output="false">
	<!--- GENERAL PROPERTIES --->
	<cfset variables.tab = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" /> <!--- this is only used for logging --->
	<cfset variables.loggingEnabled = false />
	
	<!--- URL PROPERTIES --->
	<cfset variables.protocol = "http" /> <!--- http or https --->
	<cfset variables.baseUrl = "{protocol}://github.com/api/v2/{format}" />
	<cfset variables.user = "" />
	<cfset variables.login = "" />
	<cfset variables.repo = "" />
	<cfset variables.token = "" />
	<cfset variables.format = "" /> <!--- json, xml, yaml --->
	
	<cffunction name="init">
		<cfargument name="repo" required="true" type="string" hint="Repository name" />
		<cfargument name="user" required="true" type="string" hint="Repository owner's GitHub name" />
		<cfargument name="login" required="false" type="string" hint="GitHub username" />
		<cfargument name="token" required="false" type="string" hint="GitHub token" />
		<cfargument name="format" required="false" type="string" hint="Default data return format" />
		<cfargument name="protocol" required="false" type="string" hint="http or https">
		<cfargument name="enableLogging" required="false" type="boolean" default="false" hint="At the moment it purely uses cftrace" />
		
		<cfscript>
			//store arguments
			variables.repo 				= arguments.repo;
			variables.user 				= arguments.user;
			variables.login				= arguments.login;
			variables.token 			= arguments.token;
			variables.format 			= arguments.format;
			variables.protocol			= arguments.protocol;
			variables.loggingEnabled	= arguments.enableLogging;
		</cfscript>
		
		<cfreturn this />
	</cffunction>
	
<!--- PRIVATE METHODS --->
	<cffunction name="$prepUrl" access="private">
		<cfargument name="targetUrl" type="string" required="true" />
		<cfargument name="format" type="string" required="false" />
		<cfif structkeyexists(arguments, "format")>
			<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{format}", arguments.format) />
		<cfelse>
			<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{format}/", "") />
		</cfif>
		<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{protocol}", variables.protocol, "all") />
		<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{repo}", variables.repo, "all") />
		<cfset arguments.targetUrl = rereplace(arguments.targetUrl, "{user}", variables.user, "all") />
		<cfreturn arguments.targetUrl /> 
	</cffunction>
	
	<cffunction name="$getData" access="private">
		<cfargument name="targetUrl" type="string" required="true" />
		<cfargument name="format" type="string" required="false" default="#variables.format#" />
		<cfset var result = "" />
		
		<!--- Pretty much all GET calls have a format --->
		<cfset arguments.targetUrl = $prepUrl(arguments.targetUrl, arguments.format) />
		
		<cfif variables.loggingEnabled>
			<cftrace category="cfgithub" text="Loading data from #targetUrl#" />
		</cfif>
		<cfhttp url="#arguments.targetUrl#" method="get" result="result" charset="utf-8">
			<cfhttpparam type="formfield" name="login" value="#variables.login#" />
			<cfhttpparam type="formfield" name="token" value="#variables.token#" />
		</cfhttp>
		
		<cfif trim(result.responseheader.status_code) NEQ 200>
			<cfthrow errorcode="#result.responseheader.status_code#" type="Custom" message="#result.statuscode#" detail="Attempted url: #arguments.targetUrl#">
			<cfabort />
		</cfif>
		<cfreturn $processData(result.filecontent, arguments.format) />
	</cffunction>
	
	<cffunction name="$postData" access="private">
		<cfargument name="targetUrl" type="string" required="true" />
		<cfargument name="format" type="string" required="false" default="#variables.format#" />
		<cfargument name="postArgs" type="struct" required="true" />
		<cfset var result = "" />
		
		<cfset arguments.targetUrl = $prepUrl(arguments.targetUrl, arguments.format) />
		
		<cfif variables.loggingEnabled>
			<cftrace category="cfgithub" text="Loading data from #targetUrl#" />
		</cfif>
		
		<cfset arguments.postArgs["login"] = variables.login />
		<cfset arguments.postArgs["token"] = variables.token />
		
		<cfhttp url="#arguments.targetUrl#" method="post" result="result" charset="utf-8">
			<cfloop collection="#arguments.postArgs#" item="item">
				<cfif variables.loggingEnabled>
					<cftrace category="cfgithub" text="#tab# #lcase(item)# - #arguments.postArgs[item]#" />
				</cfif>
				<cfhttpparam type="formfield" name="#lcase(item)#" value="#arguments.postArgs[item]#" />
			</cfloop>
		</cfhttp>
		
		<cfif trim(result.responseheader.status_code) NEQ 200>
			<cfthrow errorcode="#result.responseheader.status_code#" type="Custom" message="#result.statuscode#" detail="Attempted url: #arguments.targetUrl# <br />#result.filecontent.toString()#">
		</cfif>
		<cfreturn $processData(result.filecontent, arguments.format) />
	</cffunction>
	
	<cffunction name="$processData" access="private">
		<cfargument name="result" type="any" required="true" />
		<cfargument name="format" type="string" required="true" />
		<cfswitch expression="#arguments.format#">
			<cfcase value="json,yaml" delimiters=",">
				<cfset arguments.result = result.toString() />
				<cfif isjson(arguments.result)>
					<cfset arguments.result = deserializejson(arguments.result) />
				</cfif>
			</cfcase>
			<cfcase value="xml">
				<cfif isxml(arguments.result)>
					<cfset arguments.result = xmlparse(arguments.result, false) />
				</cfif>
			</cfcase>
		</cfswitch>
		
		<cfreturn arguments.result />
	</cffunction>
</cfcomponent>