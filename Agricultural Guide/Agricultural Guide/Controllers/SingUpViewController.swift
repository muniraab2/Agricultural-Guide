//
//  SingUpViewController.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 03/05/1443 AH.
//

import UIKit
import FirebaseAuth

class SingUpViewController: UIViewController {
    
    @IBOutlet weak var emailSingup: UITextField!
    @IBOutlet weak var userNameSingup: UITextField!
    @IBOutlet weak var phoneNumberSingup: UITextField!
    @IBOutlet weak var paswwordSingup: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func SignUp(email: String,password:String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            //self?.performSegue(withIdentifier: "describHome", sender: nil)
           
            UserApi.addUser(name: "munira", uid: authResult?.user.uid ?? "", phone: "966503646702", email: email) { check in
                if check {
                    print("Done Saving in Database")
                } else {
            }
          
        }
        
    }
    
    }

    @IBAction func singupButton(_ sender: UIButton) {
        
        SignUp(email: emailSingup.text ?? "" , password: paswwordSingup.text ??  "")
    }
    

    
    }

