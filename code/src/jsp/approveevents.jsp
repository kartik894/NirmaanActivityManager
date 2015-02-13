<%@page import="nirmaan.Activity"%>
<!DOCTYPE html>
<%
boolean approve = false;
String designation;
String username ="";
Cookie[] cookies = request.getCookies();
for(Cookie cookie: cookies) {
if(cookie.getName().equals("designation")) {
if(cookie.getValue().equals("PRHEAD"))
approve = true;
designation = cookie.getValue();
}
if(cookie.getName().equals("username")) {
username = cookie.getValue();
}
}
if(!approve) {
response.sendRedirect("login.jsp");
}
%>
<%@ page import="nirmaan.Designation,nirmaan.Event,java.util.*" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>Approve Event - Nirmaan</title>
<link href="css/bootstrap-min.css" rel="stylesheet">
<link href="css/navbar-static-top.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
</head>
<body>
   <nav class="navbar navbar-default navbar-static-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">NIRMAAN</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li ><a href="main.jsp">Home</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Events<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="events.jsp">Add Event</a></li>
                <li><a href="calendar.jsp">View Calendar</a></li>
                <li><a href="approveevents.jsp">Approve Event</a></li>
               
              </ul>
            </li>
            <li><a href="search.jsp">Search</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Add<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="register.jsp">Member</a></li>
                <li><a href="addinstitution.jsp">Institution</a></li>
                <li><a href="addVolunteer.jsp">Volunteer</a></li>
                <li><a href="addBloodDonor.jsp">Blood Donor</a></li>
                <li><a href="addStudent.jsp">Student</a></li>
                <li><a href="addmarket.jsp">Market</a></li>
                 <li><a href="AddFaculty.jsp">Faculty</a></li>
                <li><a href="AddSHGworker.jsp">SHG Worker</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Transaction <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="addFunds.jsp">Add Funds</a></li>
                <li><a href="addTransaction.jsp">Make Transaction</a></li>
                <li><a href="approve.jsp">Approve Transactions</a></li>
               <li><a href="viewTransactions.jsp">View Transactions</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
           
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
<%
int j =0;
ArrayList<Event> even = Event.getPending();
for(Event tran: even) {
if(request.getParameter("" + j) != null) {
System.out.println(j);
Event.ApproveEvent(tran);
}
j++;
}
%>
<div class="container">
<form role="form" method="post" action="approveevents.jsp">
<h1 style="margin-left:50px"> Approve Events </h1>
<%
int i = 0;
ArrayList<Event> trans = Event.getPending();
%>
<table style =" width : 100% ">
    <tr>
        <th>Approve</th>
        <th>Name</th>
        <th>StartDate</th>
        <th>EndDate</th>
        <th>Activity</th>
        
    </tr>
    <% for(Event events: trans) {
%>
<tr>
    <td><input name="<%=""+ i %>" type="checkbox" class="form-control" value="<%=i%>" > </td>
<td><%=events.getEvent()%>  </td>
<td><i><%= events.getStartDate()%></i></td>
<td><i> <%= events.getEndDate() %></i></td>
<td>
<% for(Activity a : events.showallactivity())
{   out.println(a.getname());
    }
 %>
</td>
</tr>
<%i++;}%>
</table>

<button class="btn btn-lg btn-primary btn-block" type="submit" style="margin-top:10px">Approve</button>
</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="css/bootstrap.min.js"></script>
</body>
</html>