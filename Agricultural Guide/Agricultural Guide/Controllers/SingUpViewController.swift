//
//  SingUpViewController.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 03/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseAuth

class SingUpViewController: UIViewController {
    
    @IBOutlet weak var emailSingup: UITextField!
    @IBOutlet weak var userNameSingup: UITextField!
    @IBOutlet weak var phoneNumberSingup: UITextField!
    @IBOutlet weak var paswwordSingup: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func SignUp(email: String,password:String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            
            if error != nil {
                let alertSingup = UIAlertController(title: "Eroor", message: "Please SingUp for the Application", preferredStyle: .alert)
                
                alertSingup.addAction(UIAlertAction(title: "OK", style: .cancel))
                
                self.present(alertSingup, animated: true)
            
            } else {
            
                UserApi.addUser(name: "munira", uid: authResult?.user.uid ?? "", phone: "966503646702", email: authResult?.user.email ?? "", completion:  { singup in
                if singup {
                    self.performSegue(withIdentifier: "describHome", sender: nil)
                }
                    
                })
                
            }
            
        }
        
    }
    
    @IBAction func singupButton(_ sender: UIButton) {
        
            
            SignUp(email: emailSingup.text ?? "", password: paswwordSingup.text ??  "")

        
        
    }
}
