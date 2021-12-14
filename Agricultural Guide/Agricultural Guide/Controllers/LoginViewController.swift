//
//  LoginViewController.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 03/05/1443 AH.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func Login(email: String,password:String) {
      
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in

            if let error = error {
                print(error.localizedDescription)
            }
            if authResult?.user.email != nil {
                
            }
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            self?.performSegue(withIdentifier: "describHome", sender: nil)
          // ...
        }
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        Login(email: emailLogin.text ?? "", password: passwordLogin.text ?? "")
    }
    
}
