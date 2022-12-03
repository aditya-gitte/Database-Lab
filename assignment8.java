import java.sql.*;
import java.util.*;

class jdbc {
public static void main(String args[]){ try{
int emp_id = 0;
String fname = ""; String lname = ""; String designation = ""; int salary = 0;
int joinDate = 0;
int dept_id = 0;
Scanner sc = new Scanner(System.in);
System.out.println("Enter the employee emp_id = sc.nextInt();
sc.nextLine();
System.out.println("Enter the employee fname = sc.nextLine(); System.out.println("Enter the employee lname = sc.nextLine(); System.out.println("Enter the employee designation = sc.nextLine(); System.out.println("Enter the employee salary = sc.nextInt(); System.out.println("Enter the employee joinDate = sc.nextInt(); System.out.println("Enter the employee dept_id = sc.nextInt();
id:");
fname:"); lname:"); designation:"); Salary:");
join Date:"); dept_id:");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection( "jdbc:mysql://10.10.12.108:3306/t31233db","t31233","t31233"); System.out.println(
"Connection Established successfully");
Statement stmt=con.createStatement();
stmt.executeUpdate("insert into Employee values("+emp_id+",'"+fname+"','"+lname+"','"+designation+"',"+salary+","+joinDate+","+dept_id+ ")");
//stmt.executeUpdate("delete from Employee where Emp_id=5"); stmt.executeUpdate("update Employee set fname='Arun' where fname='Arunima'"); ResultSet rs=stmt.executeQuery("select * from Employee");
while(rs.next())
System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
 
con.close();
}catch(Exception e){ System.out.println(e);} }
}