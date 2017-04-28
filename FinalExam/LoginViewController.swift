//
//  LoginViewController.swift
//  FinalExam
//
//  Created by 楷岷 張 on 2017/4/28.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        if account.text != "" && password.text != "" {
            FIRAuth.auth()?.signIn(withEmail: account.text!, password: password.text!, completion: { (user, error) in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    print("登入成功")
                    let storyboard = UIStoryboard(name: "book", bundle: nil)
                    let bookTableViewController = storyboard.instantiateViewController(withIdentifier: "toStoryboard")
                    
//                  self.performSegue(withIdentifier: "goController", sender: nil)
                    
                    self.present(bookTableViewController, animated: true, completion: nil)
                    
                }
            })
        }
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
