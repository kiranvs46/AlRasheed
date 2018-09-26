//
//  LoginViewController.swift
//  app
//
//  Created by Kiran on 15/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit
import KYDrawerController

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK - IBActions
    
    @IBAction func loginAction() {
        
        let otpVC = OTPViewController.init(nibName: "OTPViewController", bundle: nil)
        self.navigationController?.pushViewController(otpVC, animated: true)
    }
    
    @IBAction func forgotPasswordAction() {
        
        let forgotVC = ForgotPasswordViewController.init(nibName: "ForgotPasswordViewController", bundle: nil)
        self.navigationController?.pushViewController(forgotVC, animated: true)
    }
    
    @IBAction func signupAction() {
        
        let signupVC = SIgnUpViewController.init(nibName: "SIgnUpViewController", bundle: nil)
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
}

