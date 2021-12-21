//
//  CommunicationVC.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 09/05/1443 AH.
//

import UIKit
import MessageUI

class CommunicationVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func emailCllec(_ sender: Any) {
        sendEmail(recipient: ["E-Services@mewa.gov.sa"], text: "Communication with  Ministry Of Agriculture ")
    }
    
    @IBAction func btnAction(_ sender: Any) {
        
        if let url = URL(string: "https://www.mewa.gov.sa/") {
            
            UIApplication.shared.open(url)
            
        }
    }
    
    func sendEmail(recipient: [String], text: String) {
        
        if MFMailComposeViewController.canSendMail()
        {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(recipient)
            mail.setMessageBody(text, isHTML: false)
            
            present(mail, animated: true, completion: nil)
        }
        else
        {
            
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}
