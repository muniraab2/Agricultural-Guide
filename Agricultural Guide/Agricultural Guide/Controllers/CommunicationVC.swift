//
//  CommunicationVC.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 09/05/1443 AH.
//

import UIKit


// used UIViewController to communication url agricultural guide

class CommunicationVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //localized for title in Arabic
        
        self.title = "Ministry Of Agriculture".localized
        
    }
    
    //action button to open url
    
    
    @IBAction func buttonAction(_ sender: Any) {
        
        if let url = URL(string: "https://www.mewa.gov.sa/") {
            
            UIApplication.shared.open(url)
            
        }
    }
    
}
