//
//  SelectDepartmentViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-11-29.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class SelectDepartmentViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var departmentTextField: UITextField!
    @IBOutlet weak var departmentPicker: UIPickerView!
    var facultySelected = SelectFacultyViewController.facultySelected
    var departmentList = [String]()
    static var departmentSelected: String = ""

    @IBAction func nextAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "select_option", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (self.facultySelected == "MATH"){
            self.departmentList.append("Actuarial Science")
            self.departmentList.append("Applied Math")
            self.departmentList.append("Combinatorics and Optimization including Mathematical Optimization")
            self.departmentList.append("Computational Mathematics")
            self.departmentList.append("Computer Science")
            self.departmentList.append("Computing and Financial Management")
            self.departmentList.append("Health Informatics Option")
            self.departmentList.append("Mathematics/Business")
            self.departmentList.append("Mathematical Studies")
            self.departmentList.append("Mathematics/Teaching")
            self.departmentList.append("Plans for Students outside the Mathematics Faculty")
            self.departmentList.append("Pure Mathematics")
            self.departmentList.append("Software Engineering")
            self.departmentList.append("Statistics")
        }
        else{
            print("Only support Math")
        }
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
        return departmentList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return departmentList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.departmentTextField.text = self.departmentList[row]
        SelectDepartmentViewController.departmentSelected = self.departmentList[row]
        self.departmentPicker.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.departmentPicker.isHidden = false
        textField.endEditing(true)
    }

}
