//
//  AllShipmentAndPaymentViewController.swift
//  app
//
//  Created by Kiran on 13/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class AllShipmentAndPaymentViewController: BaseViewController {

    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var subTitleLabel:UILabel!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var pickerView:UIPickerView!
    @IBOutlet weak var pickerBgView:UIView!
    @IBOutlet weak var searchButton:UIButton!
    @IBOutlet weak var searchTextField:UITextField!
    
    var currentTableType:TableType?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        addBackButton()
        self.tableView.register(UINib.init(nibName:"RecentShipmentTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentShipmentCellIdentifier")
        self.tableView.register(UINib.init(nibName:"PaymentsTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentsCellIdentifier")
        prepareViewHeaders()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK -
    
    private func prepareViewHeaders() {
        
        if self.currentTableType == TableType.shipments {
            
            self.titleLabel.text = "Track your shipment"
            self.subTitleLabel.text = "All shipments"
        }
        else {
            self.titleLabel.text = "Track your payments"
            self.subTitleLabel.text = "All payments"
        }
        
        self.tableView.reloadData()
    }
    
    private func addBackButton() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back_arrow"), style: .plain, target: self, action: #selector(backAction))
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK - IBActions
    
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
    
}

extension AllShipmentAndPaymentViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.currentTableType == TableType.shipments {
            
            let shipmentCell = tableView.dequeueReusableCell(withIdentifier: "RecentShipmentCellIdentifier", for: indexPath) as! RecentShipmentTableViewCell
            return shipmentCell
        }
        else {
            
            let shipmentCell = tableView.dequeueReusableCell(withIdentifier: "PaymentsCellIdentifier", for: indexPath) as! PaymentsTableViewCell
            return shipmentCell
        }
    }
    
}

extension AllShipmentAndPaymentViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = ShipmentDetailViewController.init(nibName: "ShipmentDetailViewController", bundle: nil)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


extension AllShipmentAndPaymentViewController:UIPickerViewDataSource {
    
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

extension AllShipmentAndPaymentViewController:UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.searchButton.setTitle((row == 0) ? "Vessel name" : "Document number", for: UIControlState.normal)
    }
}
