<!--- Only a simple include for the token object --->

<cfset repo = "cfwheels" />
<cfset user = "johncblandii" />
<cfset format = "json" />
<cfset token = "1234" />

<cfset github = createobject("component", "github").init(repo, user, token, format, true) />