<cfparam name="isMultiSuite" default="true">
<cfparam name="URL.output" default="extjs">

<cfscript>
 testSuite = createObject("component","mxunit.framework.TestSuite").TestSuite();
 testSuite.addAll("tests.GeneralTest");
 results = testSuite.run();
</cfscript>

<cfinclude template="_suiteoutput.cfm" />