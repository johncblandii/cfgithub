<!--- 
 TestCore.cfc
 @author johncblandii
 @description Core test cfc to setup test(s)
 --->
<cfcomponent extends="mxunit.framework.TestCase">
	<cfset this.github = "" />
	<cfset this.testCFC = "" /> <!--- REQUIRED FOR TESTS TO WORK --->
	
	<!--- TEST CONFIG INFO --->
	<cfset this.format = "json" />
	<cfset this.repo = "cfgithub" />
	<cfset this.user = "cfgithubtester" />
	<cfset this.login = "cfgithubtester" />
	<cfset this.token = "744d9f3ff80766cf09e880edb8f53326" />
	<cfset this.protocol = "http" />
	
<!--- SETUP/TEARDOWN --->
	<cffunction name="setUp" access="public" returntype="void">
		<cfset this.github = createobject("component", "cfcs."&this.testCFC).init(this.repo, this.user, this.login, this.token, this.format, this.protocol, true) />
	</cffunction>
	
	<cffunction name="tearDown" access="public" returntype="void">
	</cffunction>
</cfcomponent>