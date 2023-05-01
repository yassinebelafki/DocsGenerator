package org.app.controller;

import java.awt.*;
import java.io.*;

import org.apache.pdfbox.pdmodel.PDDocument;

public class NoteGen {
	public static void generate(String xmlPath,String xsltPath,String code) throws Exception {
		File xml = new File(xmlPath);
		File xslt = new File(xsltPath);
		OutputStream outputStream = new FileOutputStream("C:\\Users\\YASSINE\\Desktop\\JAVA\\JAKARTA\\z999_xmlProject\\src\\main\\webapp\\pdfiles\\output.pdf");
		ToPdf.createStudentCard(xml, xslt, outputStream,code);
		outputStream.close();

	}

	public static void openPDF(String file) throws Exception {
		if (Desktop.isDesktopSupported()) {
			try {
				File myFile = new File(file);
				Desktop.getDesktop().open(myFile);
			} catch (IOException ex) {
				// no application registered for PDFs
			}
		}

	}

}
