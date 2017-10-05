//
//  SearchViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-10-04.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var termPicker: UIPickerView!
    @IBOutlet weak var termTextBox: UITextField!
    @IBOutlet weak var catalogTextBox: UITextField!

    var termList = ["1111","2222","3333","4444","5555"]
    var subjectList = ["MATH","CS","STAT"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return termList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return termList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.termTextBox.text = self.termList[row]
        self.termPicker.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.termTextBox {
            self.termPicker.isHidden = false
            textField.endEditing(true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = subjectList[indexPath.row]
        return cell
    }
    

}
