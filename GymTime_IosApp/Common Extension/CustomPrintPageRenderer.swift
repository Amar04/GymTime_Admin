//
//  CustomPrintPageRenderer.swift
//  Print2PDF
//
//  Created by MaibaMM01 on 24/01/20.
//  Copyright © 2020 Appcoda. All rights reserved.
//

import UIKit
import PDFKit

class CustomPrintPageRenderer:UIPrintPageRenderer {
    let A4PageWidth: CGFloat = 595.2

    let A4PageHeight: CGFloat = 841.8

    var headerText = ""
 
   
   override init() {
       super.init()
    
       // Specify the frame of the A4 page.
       let pageFrame = CGRect(x: 0.0, y: 0.0, width: A4PageWidth, height: A4PageHeight)
    
       // Set the page frame.
    self.setValue(NSValue(cgRect: pageFrame), forKey: "paperRect")
    
       // Set the horizontal and vertical insets (that's optional).
    self.setValue(NSValue(cgRect: pageFrame), forKey: "printableRect")
   }
    
// func drawHeaderForPageAtIndex(pageIndex: Int, inRect headerRect: CGRect) {
//        // Specify the header text.
//        let headerText: NSString = "Invoice"
//     
//        // Set the desired font.
//        let font = UIFont(name: "AmericanTypewriter-Bold", size: 30.0)
//     
//        // Specify some text attributes we want to apply to the header text.
//    let textAttributes = [NSAttributedString.Key.font: font!, NSAttributedString.Key.foregroundColor: UIColor(red: 243.0/255, green: 82.0/255.0, blue: 30.0/255.0, alpha: 1.0), NSAttributedString.Key.kern: 7.5] as [NSAttributedString.Key : Any]
//     
//        // Calculate the text size.
//    let textSize = getTextSize(text: headerText as String, font: nil, textAttributes: textAttributes)
//     
//        // Determine the offset to the right side.
//        let offsetX: CGFloat = 20.0
//     
//        // Specify the point that the text drawing should start from.
//        let pointX = headerRect.size.width - textSize.width - offsetX
//        let pointY = headerRect.size.height/2 - textSize.height/2
//     
//        // Draw the header text.
//        headerText.drawAtPoint(CGPointMake(pointX, pointY), withAttributes: textAttributes)
//    }
//    
//    func getTextSize(text: String, font: UIFont!, textAttributes: [String: AnyObject]! = nil) -> CGSize {
//        let testLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: self.paperRect.size.width, height: footerHeight))
//        if let attributes = textAttributes {
//            testLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
//        }
//        else {
//            testLabel.text = text
//            testLabel.font = font!
//        }
//     
//        testLabel.sizeToFit()
//     
//        return testLabel.frame.size
//    }
//    
//    
//    func drawFooterForPageAtIndex(pageIndex: Int, inRect footerRect: CGRect) {
//        let footerText: NSString = "Thank you!"
//     
//        let font = UIFont(name: "Noteworthy-Bold", size: 14.0)
//        let textSize = getTextSize(text: footerText as String, font: font!)
//     
//        let centerX = footerRect.size.width/2 - textSize.width/2
//        let centerY = footerRect.origin.y + self.footerHeight/2 - textSize.height/2
//        let attributes = [NSAttributedString.Key.font: font!, NSAttributedString.Key.foregroundColor: UIColor(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255, alpha: 1.0)]
//     
//        footerText.draw(at: CGPoint(x: centerX, y: centerY), withAttributes: attributes)
//    }
}
