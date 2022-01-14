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
    
    // override func if user login with correct email and password segue to homa page
    
    override func viewDidAppear(_ animated: Bool) {
        if let user  = Auth.auth().currentUser {
            print(user.email ?? "")
            //   performSegue(withIdentifier: "Home", sender: nil)
        }
    }
    
    //used advance password to sing up
    
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }
    
    //used advance Email to sing up
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func Login(email: String,password:String) {
        
        if isValidEmail(email) && isValidPassword(testStr: password) {
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                
                //alert if user don't but email and password for login
                
                if error != nil {
                    
                    self?.alertError(mesaage: "Error: \(error?.localizedDescription ?? "")")
                    
                } else {
                    
                    self?.performSegue(withIdentifier: "Home", sender: nil)
                    
                }
                
            }
            
            
        } else {
            
            //alert if user put information error
            
            alertError(mesaage: "Please put your Email and Passward correctly".localized)
            
        }
        
    }
    
    //func for used alert in login
    
    func alertError(mesaage: String) {
        let alertLogin = UIAlertController(title: "Error".localized, message: mesaage, preferredStyle: .alert)
        
        alertLogin.addAction(UIAlertAction(title: "OK".localized, style: .cancel))
        
        self.present(alertLogin, animated: true)
        
    }
    //button for performsegue in app
    
    @IBAction func loginButton(_ sender: Any) {
        
        let inputPassword = passwordLogin.text ?? ""
        if emailLogin.text != nil && inputPassword != "" {
            Login(email: emailLogin.text ?? "", password: passwordLogin.text ?? "")
            
        } else {
            
            //else alert show if user don't sing up in app
            
            alertError(mesaage: "Please SingUp to access the application".localized)
        }
        
    }
    
    // if user choose sing up button he going to another secrean to singup
    
    @IBAction func singup(_ sender: UIButton) {
        self.performSegue(withIdentifier: "singUp", sender: nil)
        
    }
    
}
