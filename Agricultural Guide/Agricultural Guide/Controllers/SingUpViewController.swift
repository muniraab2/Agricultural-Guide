//
//  SingUpViewController.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 03/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseAuth

// used UIViewController for sing up user

class SingUpViewController: UIViewController {
    
    @IBOutlet weak var emailSingup: UITextField!
    @IBOutlet weak var userNameSingup: UITextField!
    @IBOutlet weak var phoneNumberSingup: UITextField!
    @IBOutlet weak var paswwordSingup: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        
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
    
    
    
    //func sing up for user in FirebaseAuth
    
    func SignUp(email: String,password:String) {
        
        if isValidEmail(email) && isValidPassword(testStr: password) {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                
                print("email:\(String(describing: authResult?.user.email))")
                print("uid:\(String(describing: authResult?.user.uid))")
                
                //alert if user don't but email and password for sing up
                
                if error != nil {
                    
                    
                    self.alertErrorSingUp(message: "Error:\(error?.localizedDescription ?? "")")
                    
                } else {
                    
                    // else if user sing up segue for home page
                    
                    UserApi.addUser(name: "munira", uid: authResult?.user.uid ?? "", phone: "966503646702", email: authResult?.user.email ?? "", completion:  { singup in
                        if singup {
                            self.performSegue(withIdentifier: "Home", sender: nil)
                        }
                        
                    })
                    
                }
            }
            
            
        } else {
            
            //else alert for error information
            
            alertErrorSingUp(message: "Error Pleas put your currect information".localized)
        }
    }
    
    //func for used alert in sing up
    
    func alertErrorSingUp(message : String) {
        let alertSingup = UIAlertController(title: "Error".localized, message: message , preferredStyle: .alert)
        
        alertSingup.addAction(UIAlertAction(title: "OK".localized, style: .cancel))
        
        self.present(alertSingup, animated: true)
    }
    
    //button for performsegue to app
    
    @IBAction func singupButton(_ sender: Any) {
        
        let inputPasswordSingUp = paswwordSingup.text ?? ""
        if emailSingup.text != nil && inputPasswordSingUp != "" {
            SignUp(email: emailSingup.text ?? "", password: paswwordSingup.text ??  "")
        } else {
            
            //else alert for correct sing up in app
            
            alertErrorSingUp(message: "Please singup with Email and Password at least one uppercase, one digit, one lowercase , 8 characters total".localized)
        }
        
    }
}
