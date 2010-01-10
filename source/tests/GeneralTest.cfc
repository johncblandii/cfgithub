<!--- 
 GeneralTest.cfc
 @author johncblandii
 @description Tests General GitHub calls
 @history
 --->
 
<cfcomponent extends="tests.TestCore">
	<cffunction name="authenticate">
		<cfscript>
			var result = this.github.authenticate();
			assertTrue(isStruct(result));
		</cfscript>
	</cffunction>
</cfcomponent>