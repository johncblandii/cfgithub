<!--- 
 GeneralTest.cfc
 @author johncblandii
 @description Tests General GitHub calls
 @history
 --->
 
<cfcomponent extends="tests.TestCore">
	<cfset this.testCFC = "githubgeneral" />
	
<!--- GENERAL --->
	<cffunction name="authenticate">
		<cfscript>
			var result = this.github.authenticate();
			assertTrue(isStruct(result));
		</cfscript>
	</cffunction>
	
<!--- NETWORK --->
	
<!--- GIT OBJECT --->

</cfcomponent>