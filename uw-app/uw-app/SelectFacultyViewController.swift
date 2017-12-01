//
//  CourseRequirementsViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-11-29.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class SelectFacultyViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var facultyTextBox: UITextField!
    @IBOutlet weak var facultyPicker: UIPickerView!
    static var facultySelected: String = ""
    //let facultyList = [String]()
    let facultyList = ["MATH"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        // TODO: call getFacultyList()
        
        
        
        
        
        
        
        
        
        
    }
    
    //func getFacultyList(jsonData:JSON) -> Array<String>
    //{
        
    //}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NextAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "select_department", sender: self)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return facultyList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return facultyList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.facultyTextBox.text = self.facultyList[row]
        SelectFacultyViewController.facultySelected = self.facultyList[row]
        self.facultyPicker.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.facultyPicker.isHidden = false
        textField.endEditing(true)
    }
    
    
    
    
    
    
    
    
    
    
    
    


}
