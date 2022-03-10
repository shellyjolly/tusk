<%@ page session="false" contentType="text/html" import="java.util.*,javax.portlet.*,mysimpleportlet.*"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet" %>
<portlet:defineObjects/>
<DIV style="margin: 6px">
<H3 style="margin-bottom: 3px">Available colors:</H3>
<ul><%PortletPreferences prefs = renderRequest.getPreferences();

	// loop through all the preferences to get the colors.

	// The three primary colors have been added to the portlet.xml so we do not 

	// need to test for no colors.

	Enumeration prefNames = prefs.getNames();

	while(prefNames.hasMoreElements()) { 

	String thisColor = (String)prefNames.nextElement();

	if((thisColor != null) && (!thisColor.startsWith("."))){

	%><li style="color:<%= thisColor %>"><%= thisColor %></li><%

		} 

	} %> </ul>

<br />
<div style="color:maroon">
(Only the following colors are supported:<br>
aqua, black, blue, fuchsia, gray, green, lime, maroon, <BR> 
navy, olive, purple, red, silver, teal, white, yellow)
</div>

  <FORM ACTION="<portlet:actionURL/>" METHOD="POST">
    <LABEL for="<%=MySimplePortletPortlet.EDIT_COLOR%>">New Color</LABEL><BR>
    <INPUT name="<%=MySimplePortletPortlet.EDIT_COLOR%>" type="text"/><BR>
    <INPUT name="<%=MySimplePortletPortlet.EDIT_SUBMIT%>" value="Save" type="submit"/>
  </FORM>
<FORM ACTION="<portlet:renderURL portletMode="view"/>" METHOD="POST">
	<INPUT NAME="back" TYPE="submit" VALUE="Back to view mode">
</FORM>
</DIV>