//
//  OTPViewController.swift
//  app
//
//  Created by Kiran on 15/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit
import RSFloatInputView

class OTPViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var otpField:RSFloatInputView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton()
        hideKeyboardWhenTappedAround()
        setTextFieldDelegate()
        self.otpField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK -
    
    private func setTextFieldDelegate() {
        
        self.otpField.textField.delegate = self
    }
    
    private func addBackButton() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back_arrow"), style: .plain, target: self, action: #selector(backAction))
        self.navigationItem.rightBarButtonItem = nil
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
   	
        let pinVC = PINViewController.init(nibName: "PINViewController", bundle: nil)
        self.navigationController?.pushViewController(pinVC, animated: true)
        return true
    }
}

