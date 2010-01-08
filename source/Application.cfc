<cfcomponent>
	<!--- TEST CONFIG INFO --->
	<cfset this.repo = "cfwheels" />
	<cfset this.user = "johncblandii" />
	<cfset this.format = "json" />
	<cfset this.token = "1234" />
	
	<cffunction name="onRequestStart">
		<cfif NOT structkeyexists(application, "github") OR structkeyexists(url, "reGit")>
			<cfset application.github = createobject("component", "github").init(this.repo, this.user, this.token, this.format, true) />
		</cfif>
	</cffunction>
</cfcomponent>