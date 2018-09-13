//
//  HomeViewController.swift
//  app
//
//  Created by Kiran on 02/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit
import KYDrawerController



class HomeViewController: BaseViewController {

    @IBOutlet weak var launchView:UIView!
    @IBOutlet weak var progressBar:UIProgressView!
    @IBOutlet weak var mainView:UIView!
    @IBOutlet weak var searchContainerView:UIView!
    @IBOutlet weak var searchButton:UIButton!
    @IBOutlet weak var searchTextField:UITextField!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var viewAllShipmentButton:UIButton!
    @IBOutlet weak var pickerView:UIPickerView!
    @IBOutlet weak var pickerBgView:UIView!
    
    var currentTableType:TableType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showLaunchScreen()
        setUpNavigationBar()
        setSlideMenuDelegate()
        
        self.currentTableType = TableType.shipments
        self.tableView.register(UINib.init(nibName:"RecentShipmentTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentShipmentCellIdentifier")
        self.tableView.register(UINib.init(nibName:"PaymentsTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentsCellIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK -
    
    private func showLaunchScreen() {
        
        
        //animateProgressView()
    }
    
    private func setSlideMenuDelegate() {
        
        let slideMenu = (self.navigationController?.parent as! KYDrawerController).drawerViewController as! SlideMenuViewController
        slideMenu.slideMenuDelegate = self
    }
    
    private func hideSlideMenu() {
        
        let slideMenu = self.navigationController?.parent as! KYDrawerController
        slideMenu.setDrawerState(.closed, animated: true)
    }
    
    private func setViewControllerAsMain(vc:UIViewController) {
        
        if let drawer:KYDrawerController = self.navigationController?.parent as? KYDrawerController {
         
            drawer.mainViewController = vc
            drawer.setDrawerState(.closed, animated: true)
        }
    }
    
    override func showSlideMenu() {
        
        self.searchTextField.resignFirstResponder()
        let slideMenu = self.navigationController?.parent as! KYDrawerController
        slideMenu.setDrawerState(.opened, animated: true)
    }
    
    //MARK -IBActions
    
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
    
    @IBAction func viewAllShipmentsAction() {
        
        let allShipmentAndPaymentsVC = AllShipmentAndPaymentViewController.init(nibName: "AllShipmentAndPaymentViewController", bundle: nil)
        allShipmentAndPaymentsVC.currentTableType = self.currentTableType
        self.navigationController?.pushViewController(allShipmentAndPaymentsVC, animated: true)
    }
    
    @IBAction func segmentedControlAction(segmentedControl:UISegmentedControl) {
        
        self.viewAllShipmentButton.setTitle((segmentedControl.selectedSegmentIndex == 0) ? "View all shipments" : "View all payments", for: .normal)
        self.currentTableType = (segmentedControl.selectedSegmentIndex == 0) ? TableType.shipments : TableType.payments
        self.tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: false)
    }
    
    //MARK -
    
    func animateProgressView() {
        
        while progressBar.progress != 100 {
            
            UIView.animate(withDuration: 0.1, animations: {
                self.progressBar.setProgress(self.progressBar.progress + 0.1, animated: true)
            })
            
        }
    }

}


extension HomeViewController:SlideMenuDelegate {
    
    func didTapVisitProfile() {
        
        hideSlideMenu()
        let profileVC = ProfileViewController.init(nibName: "ProfileViewController", bundle: nil)
        setViewControllerAsMain(vc: profileVC)
    }
    
    func didTapSearchShipment() {
        
        hideSlideMenu()
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    func didTapShipInfo() {
        
        hideSlideMenu()
    }
    
    func didTapDocuments() {
        
        hideSlideMenu()
        let docVC = DocumentsViewController.init(nibName: "DocumentsViewController", bundle: nil)
        self.navigationController?.pushViewController(docVC, animated: true)
    }
    
    func didTapSupport() {
        
        hideSlideMenu()
        let supportVC = SupportViewController.init(nibName: "SupportViewController", bundle: nil)
        self.navigationController?.pushViewController(supportVC, animated: true)
    }
    
    func didTapAbout() {
        
        hideSlideMenu()
        let aboutVC = AboutViewController.init(nibName: "AboutViewController", bundle: nil)
        self.navigationController?.pushViewController(aboutVC, animated: true)
    }
    
    func didTapLogOut() {
        
    }
}

extension HomeViewController:UITableViewDataSource {
    
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

extension HomeViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = ShipmentDetailViewController.init(nibName: "ShipmentDetailViewController", bundle: nil)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController:UIPickerViewDataSource {
    
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

extension HomeViewController:UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.searchButton.setTitle((row == 0) ? "Vessel name" : "Document number", for: UIControlState.normal)
    }
}

extension HomeViewController:UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.searchTextField.resignFirstResponder()
        return false
    }
}
