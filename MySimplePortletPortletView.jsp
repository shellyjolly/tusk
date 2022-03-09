<%@ page session="false" contentType="text/html" import="java.util.*,javax.portlet.*,mysimpleportlet.*" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet" %>
<portlet:defineObjects/>

<%
	MySimplePortletPortletSessionBean sessionBean = (MySimplePortletPortletSessionBean)renderRequest.getPortletSession().getAttribute(MySimplePortletPortlet.SESSION_BEAN);
	String name = sessionBean.getUserName();
    String greeting = sessionBean.getGreeting();
    String color = sessionBean.getColor();
	if((color == null) || (color.length() == 0)){
    	color = "black";
    }
%>

<H3 style="margin-bottom: 3px; color:<%= color %>"><%= greeting + " " + name %></H3>

<DIV style="margin: 6px">

	<FORM method="POST" action="<portlet:actionURL/>">
	<LABEL  for="<%=MySimplePortletPortlet.FORM_NAME%>">Enter your name:</LABEL><BR>
	<INPUT name="<%=MySimplePortletPortlet.FORM_NAME%>" value="<%= name %>" type="text"/>
	<SELECT name="<%= MySimplePortletPortlet.FORM_COLOR %>">
<%
	PortletPreferences prefs = renderRequest.getPreferences();
	// loop through all the preferences to get the colors.
	// The three primary colors have been added to the portlet.xml so we do not 
	// need to test for no colors.
	Enumeration prefNames = prefs.getNames();
	while(prefNames.hasMoreElements()) { 
	String thisColor = (String)prefNames.nextElement();
	if((thisColor != null) && (!thisColor.startsWith("."))){
%>
	<option <% if(color.equalsIgnoreCase(thisColor)) { %> 						
		selected="selected" <% } %> value="<%= thisColor %>" >
		<%= thisColor %></option> 
	<%} 
	}
%>
	</SELECT>
	<INPUT name="<%=MySimplePortletPortlet.FORM_SUBMIT%>" type="submit" value="Submit"/>
	</FORM>
<% /******** End of sample code *********/ %>
</DIV>