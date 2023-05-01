package org.app.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

public class ToPdf {
    public static void createStudentCard(File xml, File xslt, OutputStream outputStream,String code) throws Exception {
        // Create a FopFactory
        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());

        // Set up the XSL-FO transformer
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer(new StreamSource(xslt));

        // Set up the input and output streams
        StreamSource source = new StreamSource(xml);
        Result result = new SAXResult(fopFactory.newFop(MimeConstants.MIME_PDF, outputStream).getDefaultHandler());

        // Create the student card
        transformer.setParameter("code",code);
        transformer.transform(source, result);
    }
}
