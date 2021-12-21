//
//  LoginViewController.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 03/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func Login(email: String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if error != nil {
                let alertLogin = UIAlertController(title: "Error", message: "Please put your Email and Passward", preferredStyle: .alert)
                
                alertLogin.addAction(UIAlertAction(title: "OK", style: .cancel))
                
                self?.present(alertLogin, animated: true)
                
            
            } else {
                
                self?.performSegue(withIdentifier: "describHome", sender: nil)
                
            }
            
        }
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
    Login(email: emailLogin.text ?? "", password: passwordLogin.text ?? "")
            
            
        
    }
    
}
