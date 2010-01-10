<cfcomponent extends="mxunit.framework.TestCase">
	<cfset this.github = "" />
	
	<!--- TEST CONFIG INFO --->
	<cfset this.repo = "cfwheels" />
	<cfset this.user = "johncblandii" />
	<cfset this.format = "json" />
	<cfset this.token = "1234" />
	
	<cffunction name="setUp" access="public" returntype="void">
		<cfset this.github = createobject("component", "cfcs.github").init(this.repo, this.user, this.token, this.format, true) />
	</cffunction>
	
	<cffunction name="tearDown" access="public" returntype="void">
	</cffunction>
</cfcomponent>