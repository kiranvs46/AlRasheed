//
//  DocumentsViewController.swift
//  app
//
//  Created by Kiran on 13/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class DocumentsViewController: BaseViewController {

    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var requestContainerView:UIView!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    @IBOutlet weak var pickerView:UIPickerView!
    @IBOutlet weak var pickerBgView:UIView!
    @IBOutlet weak var shipmentSelectionButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //addBackButton()
        hideKeyboardWhenTappedAround()
        self.tableView.register(UINib.init(nibName:"DocumentsTableViewCell", bundle: nil), forCellReuseIdentifier: "DocumentsCellIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK - IBAction
    
    @IBAction func segmentedControlAction(segmentedControl:UISegmentedControl) {
        
        let selectedIndex = segmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            
            requestContainerView.isHidden = false
            break
        case 1:
            
            requestContainerView.isHidden = true
            break
        case 2:
            
            requestContainerView.isHidden = true
            break
        default:
            break
        }
    }
    
    @IBAction func searchDropDownAction() {
        
        if self.pickerView.isHidden {
            self.pickerView.isHidden = false
            self.pickerBgView.isHidden = false
        }
        else {
            self.pickerView.isHidden = true
            self.pickerBgView.isHidden = true
        }
    }
    
    @IBAction func pickerDoneAction() {
        
        self.pickerView.isHidden = true
        self.pickerBgView.isHidden = true
    }
    
    //MARK -
    
    private func addBackButton() {
        
        self.navigationItem.leftBarButtonItem = nil//UIBarButtonItem.init(image: UIImage.init(named: "back_arrow"), style: .plain, target: self, action: #selector(backAction))
        //self.navigationItem.rightBarButtonItem = nil
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DocumentsViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentsCellIdentifier", for: indexPath) as! DocumentsTableViewCell
        return cell
    }
}

extension DocumentsViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension DocumentsViewController:UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 40))
        let label = UILabel.init(frame: view.frame)
        label.text = (row == 0) ? "Vessel name" : "Document number"
        label.textColor = UIColor.black
        label.font = UIFont.init(name: "Helvetica", size: 15.0)
        view.addSubview(label)
        return view
    }
}

extension DocumentsViewController:UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.shipmentSelectionButton.setTitle((row == 0) ? "Vessel name" : "Document number", for: UIControlState.normal)
    }
}
