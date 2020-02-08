//
//  InvoiceComposer.swift
//  Print2PDF
//
//  Created by MaibaMM01 on 24/01/20.
//  Copyright © 2020 Appcoda. All rights reserved.
//

import Foundation
import WebKit

class InvoiceComposer: NSObject {
   var webView = WKWebView()
    var HTMLContent = ""
    let pathToInvoiceHTMLTemplate = Bundle.main.path(forResource: "invoice", ofType: "html")

    let pathToSingleItemHTMLTemplate = Bundle.main.path(forResource: "single_item", ofType: "html")

    let pathToLastItemHTMLTemplate = Bundle.main.path(forResource: "last_item", ofType: "html")

    let senderInfo = "Gabriel Theodoropoulos<br>123 Somewhere Str.<br>10000 - MyCity<br>MyCountry"

    let dueDate = ""

    let paymentMethod = "Wire Transfer"

    let logoImageURL = "http://www.appcoda.com/wp-content/uploads/2015/12/blog-logo-dark-400.png"

    var invoiceNumber: String!

    var pdfFilename: String!
    
    func renderInvoice(invoiceNumber: String, invoiceDate: String, recipientInfo: String, items: [[String: String]], totalAmount: String) -> String! {
        
          self.invoiceNumber = invoiceNumber
      do {
          
     var HTMLContent = try String(contentsOfFile: pathToInvoiceHTMLTemplate!)
           // The invoice items will be added by using a loop.
           HTMLContent = HTMLContent.replacingOccurrences(of: "#LOGO_IMAGE#", with: logoImageURL)
           
                  // Invoice number.
                  HTMLContent = HTMLContent.replacingOccurrences(of: "#INVOICE_NUMBER#", with: invoiceNumber)
           
                  // Invoice date.
                  HTMLContent = HTMLContent.replacingOccurrences(of: "#INVOICE_DATE#", with: invoiceDate)
    
           
                  // Due date (we leave it blank by default).
                  HTMLContent = HTMLContent.replacingOccurrences(of: "#DUE_DATE#", with: dueDate)
   
           
                  // Sender info.
                  HTMLContent = HTMLContent.replacingOccurrences(of: "#SENDER_INFO#", with: senderInfo)
   
                  // Recipient info.
                  HTMLContent = HTMLContent.replacingOccurrences(of: "#RECIPIENT_INFO#", with: recipientInfo.replacingOccurrences(of: "\n", with: "<br>"))
   
           
                  // Payment method.
                  HTMLContent = HTMLContent.replacingOccurrences(of: "#PAYMENT_METHOD#", with: paymentMethod)
    
  
                  // Total amount.
                  HTMLContent = HTMLContent.replacingOccurrences(of: "#TOTAL_AMOUNT#", with: totalAmount)
    
           
           // The HTML code is ready.
           return HTMLContent
       }
       catch {
           print("Unable to open and use HTML template files.")
       }
    
       return nil
        
    }
    func exportHTMLContentToPDF(HTMLContent: String) {
        
        
        let printPageRenderer = CustomPrintPageRenderer()

        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)

        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)

        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)

        // pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Invoice\(invoiceNumber).pdf"

        // pdfData?.write(to: pdfFilename, options: true)

        pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Invoice\(invoiceNumber!).pdf"
 
        let pdfURL = URL(fileURLWithPath: pdfFilename)
        do{
            try! pdfData?.write(to: pdfURL, options: .atomic)
        }
       
        print(pdfURL)
//        let printPageRenderer = CustomPrintPageRenderer()
//
//        let printFormatter = webView.viewPrintFormatter()
//        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
//
//        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)
////      let resourceDocPath = NSHomeDirectory().appending("/Document/\(invoiceNumber!).pdf")
////        pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Invoice\(invoiceNumber!).pdf"
//        pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Invoice" + invoiceNumber + ".pdf"
//        pdfData!.write(toFile: pdfFilename, atomically: true)
////         pdfData!.writeToURL(pdfFilename, atomically: true)
//        //        let pdfURL = URL(string: pdfFilename)
////
////        pdfData?.write(to: pdfURL!, options: true)
////        let filePath = Bundle.main.path(forResource: "\(invoiceNumber!)", ofType: "pdf")
////        let fileData = NSData(contentsOfFile: filePath!)
//        print(pdfFilename!)
        
        
    }
    
    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {

        let data = NSMutableData()

        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)

        UIGraphicsBeginPDFPage()

        printPageRenderer.drawPage(at: 0, in: UIGraphicsGetPDFContextBounds())

        UIGraphicsEndPDFContext()

        return data

    }
    
  
}

