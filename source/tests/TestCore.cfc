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
	<cfset this.user = "johncblandii" />
	<cfset this.token = "0f2cae4dbcc75081579a14273d217f56" />
	
	<cffunction name="setUp" access="public" returntype="void">
		<cfset this.github = createobject("component", "cfcs.github").init(this.repo, this.user, this.token, this.format, true) />
	</cffunction>
	
	<cffunction name="tearDown" access="public" returntype="void">
	</cffunction>
</cfcomponent>