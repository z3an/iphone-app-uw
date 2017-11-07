//
//  SearchViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-10-04.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var termTextBox: UITextField!
    @IBOutlet weak var termPicker: UIPickerView!
    @IBOutlet weak var subjectTextBox: UITextField!
    @IBOutlet weak var subjectPicker: UIPickerView!
    @IBOutlet weak var catalogTextBox: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    let termList = ["1111","2222","3333","4444","5555"]
    let subjectList = ["MATH","CS","STAT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //searchButton.layer.borderWidth = 5.0
        //searchButton.layer.borderColor = UIColor.white.cgColor
        searchButton.layer.cornerRadius = 10
        searchButton.clipsToBounds = true
        searchButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        clearButton.layer.cornerRadius = 10
        clearButton.clipsToBounds = true
        clearButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // termPicker and subjectPicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        
        if pickerView == self.termPicker {
            return termList[row]
        }
        else {
            return subjectList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == self.termPicker {
            return termList.count
        }
        else { // pickerView == subjectPicker
            return subjectList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == self.termPicker {
            self.termTextBox.text = self.termList[row]
            self.termPicker.isHidden = true
        }
        
        if pickerView == self.subjectPicker {
            self.subjectTextBox.text = self.subjectList[row]
            self.subjectPicker.isHidden = true
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.termTextBox {
            self.termPicker.isHidden = false
            textField.endEditing(true)
        }
        
        if textField == self.subjectTextBox {
            self.subjectPicker.isHidden = false
            textField.endEditing(true)
        }
    }
    
    // clearButton
    @IBAction func ClearButtonAction(_ sender: UIButton) {
        termTextBox.text = ""
        subjectTextBox.text = ""
        catalogTextBox.text = ""
    }
    
    // searchButton
    @IBAction func SearchButtonAction(_ sender: UIButton) {
        if termTextBox.text == "" || subjectTextBox.text == "" || catalogTextBox.text == "" {
            let emptyAlert = UIAlertController(title: "Error", message: "Please fill up all the fields.", preferredStyle: UIAlertControllerStyle.alert)
            emptyAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(emptyAlert, animated: true, completion: nil)
        }
        
        else {
            self.performSegue(withIdentifier: "course_search", sender: self)
        }
    }
    
    // subjectTable
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return subjectList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text = subjectList[indexPath.row]
//        return cell
//    }
    

}
