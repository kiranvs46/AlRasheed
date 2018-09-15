//
//  LoginViewController.swift
//  app
//
//  Created by Kiran on 15/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK - IBActions
    
    @IBAction func loginAction() {
        
    }
    
    @IBAction func forgotPasswordAction() {
        
        let forgotVC = ForgotPasswordViewController.init(nibName: "ForgotPasswordViewController", bundle: nil)
        let navController = UINavigationController.init()
        navController.pushViewController(forgotVC, animated: true)
    }
    
    @IBAction func signupAction() {
        
        let signupVC = SIgnUpViewController.init(nibName: "SIgnUpViewController", bundle: nil)
        let navController = UINavigationController.init()
        navController.pushViewController(signupVC, animated: true)
    }
    
}
