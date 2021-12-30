//
//  LoginViewController.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 03/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

// used UIViewController for login user

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    /*
    fileprivate func checkUserIsLogin() {
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "Home", sender: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkUserIsLogin()
    }
    
  */
    
    //func login for user in FirebaseAuth
    
    func Login(email: String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            //alert if user don't but email and password for login
            
            if error != nil {
                let alertLogin = UIAlertController(title: "Error", message: "Please put your Email and Passward", preferredStyle: .alert)
                
                alertLogin.addAction(UIAlertAction(title: "OK", style: .cancel))
                
                self?.present(alertLogin, animated: true)
                
                
            } else {
                
                self?.performSegue(withIdentifier: "Home", sender: nil)
                
            }
            
        }
        
    }
    
    //button for performsegue in app
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        Login(email: emailLogin.text ?? "", password: passwordLogin.text ?? "")
        
    }
    
    
    @IBAction func singup(_ sender: UIButton) {
        self.performSegue(withIdentifier: "singUp", sender: nil)
   
    }
    
}
