package com.csci4830.bookboxd;

import java.io.IOException;

import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.csci4830.datamodel.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Login() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		if (request.getSession().getAttribute("user") != null) {
			response.sendRedirect("dashboard.jsp");
        } else {
			response.sendRedirect("login.jsp");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
				
		try {
			User user = Utility.checkLogin(username, password);
			
			// Log the user in
			HttpSession session = request.getSession();
            session.setAttribute("user", user);
            request.removeAttribute("errorMessage");
            String destination = "dashboard.html";
            
            // Forward request
			RequestDispatcher dispatcher = request.getRequestDispatcher(destination);
            dispatcher.forward(request, response);			
		} catch (NoResultException e) {
			// Failed to login, set message
			String destination = "login.jsp";
			String message = "The username or password is incorrect.<br><br>";
			request.setAttribute("errorMessage", message);
			
			// Forward request
			RequestDispatcher dispatcher = request.getRequestDispatcher(destination);
            dispatcher.forward(request, response);
		}
	}

}
