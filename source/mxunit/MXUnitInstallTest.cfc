<cfcomponent displayname="MxunitInstallVerificationTest" extends="mxunit.framework.TestCase">
			<cffunction name="testThis" >
				<cfset assertEquals("this","this") />
			</cffunction>
			
			<cffunction name="testThat" >
				<cfset assertEquals("this","that", "This is an intentional failure so you see what it looks like") />
			</cffunction>
			
			<cffunction name="testSomething" >
				<cfset assertEquals(1,1) />
			</cffunction>
			
			<cffunction name="testSomethingElse">
				<cfset assertTrue(true) />
			</cffunction>
		</cfcomponent>
