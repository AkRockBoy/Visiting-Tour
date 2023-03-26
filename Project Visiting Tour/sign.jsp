<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<header>
<div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="bg-secondary text-white " class="text-danger" style="text-align:center;">Winter Training Management System</h1>
                </div>
            </div>	
</div>    
<h2  style="text-align:center">Sign Up Page</h2>
<div class="sign">
<form id="login" method="get" action="">
<label><b>First Name</b></label><br>
<input type="text" name="t1" id="name" placeholder="First Name" required=""><br>
<label><b>Last Name</b></label><br>
<input type="text" name="t2" id="name" placeholder="Last Name" required=""><br>
<label><b>Email</b></label><br>
<input type="Email" name="t3" id="name" placeholder="xyz@gmail.com" required=""><br>
<label><b>Password</b></label><br>
<input type="password" name="t4" id="pass" placeholder="Password" required=""><br>
<label><b>Confirm Password</b></label><br>
<input type="password" name="t5" id="name" placeholder="Again Password" required=""><br><br>
<select name="t6" class="from-control" name="log" id="log">
 <option class="text-primary"><b>Select Your State</b></option>
                       <option>Utter Pradesh</option>
                       <option>Delhi</option>
                       <option>Mumbai</option>
                       <option>Goa</option>
					   <option>Karnataka</option>
                       <option>Arunachal Pradesh</option>
                       <option>Assam</option>
					   <option>Gujarat</option>
                       <option>Himachal Pradesh</option>
                       <option>Meghalaya</option>
					   <option>Mizoram</option>
                       <option>Maharashtra</option>
                       <option>Rajasthan</option>
					   <option>Andhra Pradesh</option>
                       <option>Haryana</option>
                       <option>Manipur</option>
					   <option>Nagaland</option>
                       <option>Kerala</option>
                       <option>Odisha</option>
					   <option>Madhya Pradesh</option>
                       <option>Bihar</option>
                       <option>Jharkhand</option>
					   <option>Tamil Nadu</option>
					   <option>Sikkim</option>
                       <option>Panjab</option>
                       <option>Chhattisgarh</option></select>
					 

<br><br><b><input type="submit" name="log" id="log" value="Sign In Here" name="b1" class="btn btn-success" /></b>
<%
    if(request.getParameter("b1")!=null)
	{                   
         String gfname=request.getParameter("t1");
         String glname=request.getParameter("t2");
         String gemail=request.getParameter("t3");
         String gpwd=request.getParameter("t4");
         String gcpwd=request.getParameter("t5");
         String gcity=request.getParameter("t6");
         Connection con;
         Statement st;
         try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
          String url="jdbc:oracle:thin:@localhost:1521:";
          con=DriverManager.getConnection(url,"system","geek");
          st=con.createStatement();
          String sql="insert into stu values('"+gfname+"','"+glname+"','"+gemail+"','"+gpwd+"','"+gcpwd+"','"+gcity+"')";
          int res=st.executeUpdate(sql);
           if(res!=0)
	       {
                     response.sendRedirect("place.jsp");
           }
      }catch(Exception e)
      {
            out.println(e.toString());
	  } 
  }
                       %>
</form>
</div>
</body>
</html>
