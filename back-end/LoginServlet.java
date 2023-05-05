import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

  // Handle POST request for login
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    // Connect to database
    Connection conn = null;
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        String connectionUrl = "jdbc:sqlserver://localhost;encrypt=true;database=AdventureWorks;integratedSecurity=true;";  
        conn = DriverManager.getConnection(connectionUrl);
    } catch (Exception e) {
      e.printStackTrace();
    }

    // Check login credentials
    boolean success = false;
    try {
      PreparedStatement stmt = conn.prepareStatement("SELECT * FROM " + role + " WHERE username = ? AND password = ?");
      stmt.setString(1, username);
      stmt.setString(2, password);
      ResultSet rs = stmt.executeQuery();
      success = rs.next();
    } catch (SQLException e) {
      e.printStackTrace();
    }

    // Redirect to appropriate page
    if (success) {
      if (role.equals("teacher")) {
        response.sendRedirect("/teacher");
      } else if (role.equals("student")) {
        response.sendRedirect("/student");
      }
    } else {
      response.sendRedirect("/login?error=true");
    }
  }
}
