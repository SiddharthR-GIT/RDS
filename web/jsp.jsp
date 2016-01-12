

<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="asdeft">

        <%
            Properties prop=new Properties();
            prop.load(new FileInputStream(new File("/opt/rds")));
            String su = request.getParameter(prop.getProperty("USERNAME"));
            String sp = request.getParameter(prop.getProperty("PASSWORD"));
            Connection con = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                //Class.forName("com.ibm.db2.jcc.DB2Driver");
                //Class.forName("COM.ibm.db2os390.sqlj.jdbc.DB2SQLJDriver");
                out.println("jdbc:mysql://"+prop.getProperty("URL")+":"+prop.getProperty("PORT"));
                con = DriverManager.getConnection("jdbc:mysql://"+prop.getProperty("URL")+":"+prop.getProperty("PORT"),prop.getProperty("USERNAME"),prop.getProperty("PASSWORD"));
                Statement stmt = con.createStatement();
      
                String sql = "CREATE DATABASE STUDENT1";
                stmt.executeUpdate(sql);
                out.println("Database created successfully...");
                
                /*PreparedStatement ps = con.prepareStatement("select * from test where username=? and password=?");
                ps.setString(1, su);
                ps.setString(2, sp);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    session.setAttribute("cname", su);
                    response.sendRedirect("success.jsp");
                } else {
                    out.print("<h2><center>you are not valid user,please</h2></center><a href=html2.html><h1><center>Register</center></h1></a>");

                }*/
            } catch (Exception e) {
                out.println("Exception"+e);
            }
        %>
    </body>
</html>

