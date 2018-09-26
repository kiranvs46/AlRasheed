//
//  ShipInfoViewController.swift
//  app
//
//  Created by Kiran on 15/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class ShipInfoViewController: BaseViewController {

    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var dateFromView:UIView!
    @IBOutlet weak var dateToView:UIView!
    @IBOutlet weak var fromDayLabel:UILabel!
    @IBOutlet weak var fromDateLabel:UILabel!
    @IBOutlet weak var toDayLabel:UILabel!
    @IBOutlet weak var toDateLabel:UILabel!
    @IBOutlet weak var datePicker:UIDatePicker!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    @IBOutlet weak var pickerContainer:UIView!
    
    var didTapFromDate = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib.init(nibName:"ShipInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "ShipInfoCellIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - IBActions
    
    @IBAction func fromDateAction() {
        
        didTapFromDate = true
        showPickerView()
    }
    
    @IBAction func toDateAction() {
        
        didTapFromDate = false
        showPickerView()
    }
    
    @IBAction func datePickerDoneAction() {
        
        let date = self.datePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        formatter.dateFormat = "MMM yyyy \n EEE"
        let monthYear = formatter.string(from: date)
        
        if self.didTapFromDate {
            setNewDateToFromView(day: day, monthYear: monthYear)
        }
        else {
            setNewDateToView(day: day, monthYear: monthYear)
        }
        
        hidePickerView()
    }
    
    @IBAction func segmentedControlAction(segmentedControl:UISegmentedControl) {
        
        self.tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
    }
    
    //MARK -
    
    private func showPickerView() {
        
        self.datePicker.isHidden = false
        self.pickerContainer.isHidden = false
    }
    
    
    private func hidePickerView() {
        
        self.datePicker.isHidden = true
        self.pickerContainer.isHidden = true
    }
    
    private func setNewDateToFromView(day:String, monthYear:String) {
        
        self.fromDayLabel.text = day
        self.fromDateLabel.text = monthYear
    }
    
    private func setNewDateToView(day:String, monthYear:String) {
        
        self.toDayLabel.text = day
        self.toDateLabel.text = monthYear
    }
}


extension ShipInfoViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 207
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let shipInfoCell = tableView.dequeueReusableCell(withIdentifier: "ShipInfoCellIdentifier") as! ShipInfoTableViewCell
        return shipInfoCell
    }
}

extension ShipInfoViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
