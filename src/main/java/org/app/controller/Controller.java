package org.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		String code=request.getParameter("code");
		System.out.println(code);
		if (code.isEmpty() && !action.equals("timetable")){
			request.setAttribute("error","choisir une option ou taper le code apogee");
			request.getRequestDispatcher("index.jsp").forward(request,response);
			return;
		}
		switch(action) {
		  case "student-card":
			  try {
				  cradGenerator(request, response, code);
			  } catch (Exception e) {
				  throw new RuntimeException(e);
			  }
			  break;
		  case "notes":
			  try {
				  notesGenerator(request, response, code);
			  } catch (Exception e) {
				  throw new RuntimeException(e);
			  }
			  break;
		  case "scolarity":
			  try {
				  scolarityGenerator(request,response,code);
			  } catch (Exception e) {
				  throw new RuntimeException(e);
			  }
			  break;

			case "timetable":
				try {
					timeTableGenerator(request,response,code);
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
				break;
		  default:
			  request.setAttribute("error","choisir une option");
		   request.getRequestDispatcher("index.jsp").forward(request,response);
		}

	}

	private void timeTableGenerator(HttpServletRequest request, HttpServletResponse response, String code) throws Exception {
		NoteGen.generate("C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\xmlfiles\\timetable.xml",
				"C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\xsltfiles\\timetable.xslt"
				,code);
		NoteGen.openPDF("C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\pdfiles\\output.pdf");
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}

	private void scolarityGenerator(HttpServletRequest request, HttpServletResponse response, String code) throws Exception {
		NoteGen.generate("C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\xmlfiles\\data.xml",
				"C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\xsltfiles\\scolarity.xsl"
				,code);
		NoteGen.openPDF("C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\pdfiles\\output.pdf");
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}

	private void cradGenerator(HttpServletRequest request, HttpServletResponse response, String code) throws Exception {
		NoteGen.generate("C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\xmlfiles\\data.xml",
				"C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\xsltfiles\\carte.xslt"
				,code);
		NoteGen.openPDF("C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\pdfiles\\output.pdf");
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}

	private void notesGenerator(HttpServletRequest request, HttpServletResponse response,String code) throws Exception {
		NoteGen.generate("C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\xmlfiles\\data.xml",
				"C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\xsltfiles\\relve.xsl"
				,code);
		NoteGen.openPDF("C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\pdfiles\\output.pdf");
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}

}
