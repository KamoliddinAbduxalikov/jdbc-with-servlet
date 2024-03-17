package org.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.datasource.DatabaseManager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SignUpServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.setAttribute("requestAttribute","Hello");
        session.setAttribute("sessionAttribute","Hello session");
        req.getRequestDispatcher("signup.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
         String username = req.getParameter("username");
         String email = req.getParameter("email");
         String password = req.getParameter("password");

         try (Connection connection = DatabaseManager.connect()){
             PreparedStatement preparedStatement = connection.prepareStatement("insert into users(username,email,password) values (?,?,?)");
             preparedStatement.setString(1,username);
             preparedStatement.setString(2,email);
             preparedStatement.setString(3,password);
             preparedStatement.execute();
         } catch (SQLException e) {
             throw new RuntimeException(e);
         }

         resp.sendRedirect("/");
    }
}
