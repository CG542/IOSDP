//
//  LoginViewController.swift
//  IOSDP
//
//  Created by Andy on 5/26/16.
//  Copyright (c) 2016 Mot. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginname: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad(){
       loginname.text="cps";
        password.text="cps";
    }
    
    @IBAction func login_Click(sender: AnyObject) {
        if HttpUtility.ValdateUser(loginname.text, password: password.text){
            GlobalPara.UserName=loginname.text
            GlobalPara.PSW=password.text
            self.performSegueWithIdentifier("loginSegue", sender: self)
        }
    }
    
//    @IBAction func clickLogin() {
//        if(HttpUtility.ValdateUser(logname.text, password: password.text)){
//            self.performSegueWithIdentifier("loginSegue", sender: self)
//        }
//    }
    
}