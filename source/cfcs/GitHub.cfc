<cfcomponent displayname="GitHub API" hint="Interface to GitHub API classes" output="false">
	<!--- GENERAL PROPERTIES --->
	<cfset variables.tab = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />
	
	<!--- URL PROPERTIES --->
	<cfset variables.baseUrl = "http://github.com/api/v2/{format}" />
	<cfset variables.user = "" />
	<cfset variables.repo = "" />
	<cfset variables.token = "" />
	<cfset variables.format = "" />
	<cfset variables.loggingEnabled = false />
	
	<cffunction name="init">
		<cfargument name="repo" required="true" type="string" />
		<cfargument name="user" required="true" type="string" />
		<cfargument name="token" required="false" type="string" />
		<cfargument name="format" required="false" type="string" />
		<cfargument name="enableLogging" required="false" type="boolean" default="false" />
		
		<cfscript>
			//store arguments
			variables.repo 				= arguments.repo;
			variables.user 				= arguments.user;
			variables.token 			= arguments.token;
			variables.format 			= arguments.format;
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
		<cfhttp url="#arguments.targetUrl#" method="get" result="result" charset="utf-8" />
		
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
		
		<cfset arguments.postArgs["login"] = variables.user />
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
			<cfthrow errorcode="#result.responseheader.status_code#" type="Custom" message="#result.statuscode#" detail="Attempted url: #arguments.targetUrl# <br />">
			<cfabort />
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
	
<!--- METHOD INCLUDES --->
	<cfinclude template="_issues.cfm" />
	<cfinclude template="_general.cfm" />
</cfcomponent>