//
//  LoginViewController.swift
//  IOSDP
//
//  Created by Andy on 5/26/16.
//  Copyright (c) 2016 Mot. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var logname: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad(){
       logname.text="cps";
        password.text="cps";
    }
    
    @IBAction func clickLogin() {
        if(HttpUtility.ValdateUser(logname.text, password: password.text)){
            self.performSegueWithIdentifier("loginSegue", sender: self)
        }
    }
    
}