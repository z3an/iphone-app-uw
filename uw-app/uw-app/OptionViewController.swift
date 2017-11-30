//
//  OptionViewController.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-11-29.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var optionTextField: UITextField!
    @IBOutlet weak var optionPicker: UIPickerView!
    var departmentSelected = SelectDepartmentViewController.departmentSelected
    var optionList = [String]()
    static var URL: String = ""
    
    
    @IBAction func optionButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "academicRequirement", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let programJSON = facultyJSON[departmentSelected]
        for (key,_) in programJSON!{
            optionList.append(key)
        }
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
        return optionList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return optionList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.optionTextField.text = self.optionList[row]
        OptionViewController.URL = facultyJSON[departmentSelected]![self.optionList[row]]!
        self.optionPicker.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.optionPicker.isHidden = false
        textField.endEditing(true)
    }

}
