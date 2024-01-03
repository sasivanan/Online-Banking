<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% long acNumber = Long.parseLong(request.getParameter("acNumber")); 
	//long fromAccount = Long.parseLong(request.getParameter("fromAccount"));
	long toAccount = Long.parseLong(request.getParameter("toAccount"));
	long amount = Long.parseLong(request.getParameter("amount"));
	
	try{
		 String url = "jdbc:mysql://localhost:3306/atm";
	     String user = "root";
	     String password = "";	
	     Connection con = DriverManager.getConnection(url, user, password);
	     String query="SELECT * FROM BankDetails WHERE acNumber = ?";
	     PreparedStatement ps = con.prepareStatement(query);
	     ps.setLong(1, toAccount);
	     ResultSet rs=ps.executeQuery();
	     if(!rs.next()){
	        String temp="No such account found";
	 		request.setAttribute("temp", temp);
	 		request.getRequestDispatcher("transferMoney.jsp").forward(request, response);
	     }
	     else{
	    	 Double toAmount=rs.getDouble(4);
	    	 ps.setLong(1, acNumber);
		     rs=ps.executeQuery();
		     if(rs.next()){
		    	 Long currentAmount=rs.getLong(4);
		    	 if(currentAmount>amount){
		    		 query="update bankdetails set acBalance= ? where acNumber=? ";
		    		 currentAmount-=amount;
		    		 ps = con.prepareStatement(query);
		    		 ps.setLong(1,currentAmount);
		    		 ps.setLong(2, acNumber);
		    		 ps.executeUpdate();
		    		 toAmount+=amount;
		    		 ps.setDouble(1, toAmount);
		    		 ps.setLong(2, toAccount);
		    		 ps.executeUpdate();
		    		 String temp="Transfer Successfully";
		 	 		request.setAttribute("temp", temp);
		 	 		Calendar calendar = Calendar.getInstance();
		 	 	    Time currentTime = new Time(calendar.getTimeInMillis());
		 	 	    Date currentDate = calendar.getTime();

		 	 		String tableName="acNumber_"+String.valueOf(acNumber);
		 			String createTableSQL = "CREATE TABLE IF NOT EXISTS  "+tableName
		 					+" (id INT AUTO_INCREMENT PRIMARY KEY,"
		    	 			+"type VARCHAR(20),"
		 					+"tranction_account bigint(20),"
		 					+"amount INT,"
		 	                + "acBalance INT,"
		 	                +"datecol DATE,"
		 	                +"timecol TIME"+
		 	                ")";
		 			out.print(createTableSQL);
		 			 Statement statement = con.createStatement();
		 		    statement.execute(createTableSQL);
		 		   query="insert into "+tableName+"(type,tranction_account,amount,acBalance,datecol,timecol)values(?,?,?,?,?,?)";
		 		  ps = con.prepareStatement(query);
		 		  ps.setString(1,"send");
		 		  ps.setLong(2,toAccount);
		 		 ps.setLong(3,amount);
		 		 ps.setLong(4,currentAmount);
		 		 ps.setDate(5, new java.sql.Date(currentDate.getTime()));  
		 	    ps.setTime(6, new java.sql.Time(currentTime.getTime()));  
				ps.executeUpdate();
				String tableName1="acNumber_"+String.valueOf(toAccount);
				createTableSQL = createTableSQL.replace(tableName, tableName1);
				statement.execute(createTableSQL);
				query = query.replace(tableName, tableName1);
				ps = con.prepareStatement(query);
		 		  ps.setString(1,"received");
		 		  ps.setLong(2,acNumber);
		 		 ps.setLong(3,amount);
		 		 ps.setDouble(4,toAmount);
		 		 ps.setDate(5, new java.sql.Date(currentDate.getTime()));  
		 	    ps.setTime(6, new java.sql.Time(currentTime.getTime()));  
				ps.executeUpdate();
		 	 		request.getRequestDispatcher("transferMoney.jsp").forward(request, response); 
		    	 }
		    	 else{
		    		 String temp="Insufficent Balance in your account";
		 	 		request.setAttribute("temp", temp);
		 	 		request.getRequestDispatcher("transferMoney.jsp").forward(request, response);
		    	 }
		     }
	     }
	 }
	catch (SQLException e) {
        e.printStackTrace();
    } 
       
	%>
</body>
</html>