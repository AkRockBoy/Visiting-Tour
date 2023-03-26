<%@page import="java.sql.*"%>
<html>
<head>
	<title>Lets Talk</title>
	<style>
		.h{background-color:rgba(124, 110, 143, 0.822);width:97%;height:95%;font-size:18px}
	</style>
</head>
<body>
<div style="position:absolute;left:17.45%;width:100%;height:100%"><img width="100%" height="100%" src="signup2.jfif"></div>
<form name="f2" method="post" action="">
<div style=" position:absolute; left:70.40%;top:28.10%;height:60%; width:65%">
<table style="width:41%;height:50%" bgcolor="white">
	<tr>
		<td width="32%">First Name</td><td><input class="h" type="text" name="fn" placeholder="Enter your First name" required></td>
	</tr>
	<tr>
		<td width="32%">Last Name</td><td><input class="h" type="text" name="ln" placeholder="Enter your Last name" ></td>
	</tr>
	<tr>
		<td width="32%">Phone No.</td><td><input class="h" type="text" name="pn" placeholder="Enter your Phone number" required></td>
	</tr>
		<td width="32%">Create Password</td><td><input class="h" type="password" name="pwd1" placeholder="Create Password" required></td>
	</tr>
		<td width="30%">Repeat Password</td><td><input class="h" type="password" name="pwd2" placeholder="Repeat Password" required></td>
	</tr>
</table>
<div style="position:absolute;top:66.25%;left:0.75%;height:13.5%;width:17%">
	<input style="width:100%;height:63.85%;border-radius:15px;background-color:black;color:white;text-align:center;" type="submit" value="Register" name="re">
</div>
</div>
</form>
<%
if(request.getParameter("re")!=null)
{
	String gpwd1 = request.getParameter("pwd1");
	String gpwd2 = request.getParameter("pwd2");
	String gname = request.getParameter("fn");
	long phn = Long.valueOf(request.getParameter("pn"));
	if (gpwd1.equals(gpwd2))
	{ 
		Connection con;
		Statement st;
		ResultSet rs;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521:";
			con=DriverManager.getConnection(url,"system","oracle");
			st=con.createStatement();
			String sql="select * from people where id = "+phn+" ";
			rs=st.executeQuery(sql);
			if(rs.next())
			{%>
					<script>alert("Already Exit");</script>
<%
			}
			else
			{
				sql="create table " + gname + phn + " (send_to_id number(10),send_msg varchar(1000), get_from_id number(10), get_msg varchar(1000))";
				st.executeQuery(sql);
				sql="insert into people values ("+phn+",'"+gname+"','"+gpwd1+"')";
				int res=st.executeUpdate(sql);
                        	response.sendRedirect("index.jsp");					
			}
		
		con.close();
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}		
	}
	else
	{
%>		<script>alert("Password Doesn't match");</script><%
	}
}
%>	
</body>
</html>

