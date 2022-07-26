<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jsp Page</title>
</head>
<body bgcolor = "#E3CBC6">
	<%
		String username = (String)session.getAttribute("username");
		if (username == null || username.trim().equals(""))
		{
			response.sendRedirect("login.html");
		}
		 UserDAO udao=new UserDAO();
         UserDTO user = udao.getUserData(username);
	%>
	<h2>Hello <%= username %> ..!</h2>
	<h1>Login Successful ..!</h1>
	<table>
                <tr>
                    <td><strong>First Name:</strong></td>
                    <td><strong><%=user.getFirstName()%></strong></td>
                </tr>
                <tr>
                    <td><strong>Last Name:</strong></td>
                    <td><strong><%=user.getLastName()%></strong></td>
                </tr>
                <tr>
                    <td><strong>Address:</strong></td>
                    <td><strong><%=user.getAddress()%></strong></td>
                </tr>
                <tr>
                    <td><strong>City:</strong></td>
                    <td><strong><%=user.getCity()%></strong></td>
                </tr>
                <tr>
                    <td><strong>Zipcode:</strong></td>
                    <td><strong><%=user.getZipcode()%></strong></td>
                </tr>
                <tr>
                    <td><strong>State:</strong></td>
                    <td><strong><%=user.getState()%></strong></td>
                </tr>
                <tr>
                    <td><strong>Country:</strong></td>
                    <td><strong><%=user.getCountry()%></strong></td>
                </tr>
                <tr>
                     <td><strong>Phone No.:</strong></td>
                     <td><strong><%=user.getPhone()%></strong></td>
                </tr>
            </table>
    <a href = "search.html">Search</a><br/>
    <a href = "logout.jsp">Sign out</a>
</body>
</html>	
