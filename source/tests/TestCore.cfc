<!--- 
 TestCore.cfc
 @author johncblandii
 @description Core test cfc to setup test(s)
 --->
<cfcomponent extends="mxunit.framework.TestCase">
	<cfset this.github = "" />
	
	<!--- TEST CONFIG INFO --->
	<cfset this.format = "json" />
	<cfset this.repo = "cfgithub-test" />
	<cfset this.user = "user" />
	<cfset this.token = "1234" />
	
	<cffunction name="setUp" access="public" returntype="void">
		<cfset this.github = createobject("component", "cfcs.github").init(this.repo, this.user, this.token, this.format, true) />
	</cffunction>
	
	<cffunction name="tearDown" access="public" returntype="void">
	</cffunction>
</cfcomponent>