//
//  PINViewController.swift
//  app
//
//  Created by Kiran on 15/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit
import KYDrawerController
import RSFloatInputView


class PINViewController: UIViewController {

    @IBOutlet weak var pinField:RSFloatInputView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton() 
        pinField.textField.delegate = self
        pinField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK -
    
    private func setHomeVC() {
        
        let homeViewController = HomeViewController()
        let drawerViewController = SlideMenuViewController()
        let drawerController     = KYDrawerController.init(drawerDirection: .left, drawerWidth: 250)
        drawerController.mainViewController = UINavigationController(
            rootViewController: homeViewController
        )
        drawerController.drawerViewController = drawerViewController
        
        let window = UIApplication.shared.windows[0]
        window.rootViewController = drawerController
    }
    
    //MARK -
    
    private func addBackButton() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back_arrow"), style: .plain, target: self, action: #selector(backAction))
        //self.navigationItem.rightBarButtonItem = nil
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PINViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.setHomeVC()
        return true;
    }
}
