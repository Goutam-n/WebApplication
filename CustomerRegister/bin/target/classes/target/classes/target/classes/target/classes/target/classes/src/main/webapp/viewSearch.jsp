
<%@ page import="java.util.*" %> 
<html>
<head>
</head>
<body>

<br><br><br><br><br><br>
<table width="700px" align="center"
style="border:1px solid #000000;">
        <tr>
            <td colspan=8 align="center"
            style="background-color:ffeeff">
            <b>User Record</b></td>
        </tr>
        <tr style="background-color:efefef;">
            <td><b>PartyID</b></td>
            <td><b>First Name</b></td>
            <td><b>Last Name</b></td>
            <td><b>Address</b></td>
            <td><b>City No</b></td>
            <td><b>Zip</b></td>
            <td><b>State</b></td>
            <td><b>Country</b></td>
            <td><b>Phone Number</b></td>

        </tr>
        <%
            int count=0;
            String color = "#F9EBB3";

            if(request.getAttribute("userList")!=null)
            {
                ArrayList al = (ArrayList)request.getAttribute("userList");
                Iterator itr = al.iterator();
                while(itr.hasNext())
                {
                    if((count%2)==0){
                    color = "#eeffee";
                }
            else
            {
                color = "#F9EBB3";
            }
            count++;

            ArrayList userList = (ArrayList)itr.next();
        %>

        <tr style="background-color:<%=color%>;">
            <td><%=userList.get(0)%></td>
            <td><%=userList.get(1)%></td>
            <td><%=userList.get(3)%></td>
            <td><%=userList.get(4)%></td>
            <td><%=userList.get(5)%></td>
            <td><%=userList.get(6)%></td>
            <td><%=userList.get(7)%></td>
            <td><%=userList.get(8)%></td>

        </tr>
        <%
            }
            }
        %>
        <%
            if(count==0){
        %>
        <tr>
            <td colspan=8 align="center"
            style="background-color:eeffee"><b>No Record</b></td>
        </tr>
        <%
            }
        %>
</table>
</body>
</html>