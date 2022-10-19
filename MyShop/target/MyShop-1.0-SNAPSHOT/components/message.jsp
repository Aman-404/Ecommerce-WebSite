<%
String message = (String)session.getAttribute("message");
if(message!=null)
{
//print
%>

<div class="myalert" role="alert">
    <strong><%= message%></strong>
    
</div>


<%
session.removeAttribute("message");

}

%>

<!--Message For Add Category Section-->
<%
String message1 = (String)session.getAttribute("message1");
if(message1!=null)
{
//print
%>

<div class="myalert1" role="alert">
    <strong><%= message1%></strong>
    
</div>


<%
session.removeAttribute("message1");

}

%>