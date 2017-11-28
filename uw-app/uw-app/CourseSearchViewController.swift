//
//  SearchViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-10-04.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit


class CourseSearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var termTextBox: UITextField!
    @IBOutlet weak var termPicker: UIPickerView!
    @IBOutlet weak var subjectTextBox: UITextField!
    @IBOutlet weak var subjectPicker: UIPickerView!
    @IBOutlet weak var catalogTextBox: UITextField!
    @IBOutlet weak var catalogPicker: UIPickerView!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    
    var termList = ViewController.termList                      // get previous term, current term and next term
    var subjectList = [String]()                                // get term course subject
    var catalogNumberList = [String]()                          // get corresponding catalog based on chosen term and course subject

    var termSelected: String = ""
    var subjectSelected: String = ""
    var catalogSelected: String = ""
    var ifSleep: Bool = true
    
    var lastTermCourse = ViewController.lastTermCourse          // get last term course subject
    var currentTermCourse = ViewController.currentTermCourse    // get current term course subject
    var nextTermCourse = ViewController.nextTermCourse          // get next term course subject
    
    static var classInfoList = JSON(AnyObject.self)                  // get the class information based on subject, catalog and term
    static var courseDescription: String = ""
    //var yearList = [String]()                                 // get previous year, current year and next year
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchButton.layer.cornerRadius = 10
        searchButton.clipsToBounds = true
        searchButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        clearButton.layer.cornerRadius = 10
        clearButton.clipsToBounds = true
        clearButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
    
        //let date = Date()
        //let calendar = Calendar.current
        //let curr_year = calendar.component(.year, from: date)
        //yearList.append(String(curr_year-1))
        //yearList.append(String(curr_year))
        //yearList.append(String(curr_year+1))
        
    }
    
    func getClassInfoList(_ termID: String, subjectID: String, catalogID: String){
        // get the array of JSON class information
        WatSwift.Terms.schedule(catalogNumber: catalogID, subject: subjectID, term: termID) { response in
            let schedule_data: JSON = response.data
            CourseSearchViewController.classInfoList = schedule_data
            self.getCourseDescription()
        }
    }

    func getSubjectList(_ termID: String){
        var subjectListTmp = JSON(AnyObject.self)
        if (termID == self.termList[0]){
            subjectListTmp = self.lastTermCourse
        }
        else if (termID == self.termList[1]){
            subjectListTmp = self.currentTermCourse
        }
        else{
            subjectListTmp = self.nextTermCourse
        }
        for coursesJSON in subjectListTmp.array!{
            if self.subjectList.contains(coursesJSON["subject"].string!){
            }
            else{
                self.subjectList.append(coursesJSON["subject"].string!)
            }
        }
    }

    func getCatalogNumberList(_ termID: String, subject: String){
        WatSwift.Terms.schedule(forSubject: subject, inTerm: termID) { response in
            let catalog_data: JSON = response.data
            for catalog in catalog_data.array!{
                if self.catalogNumberList.contains(catalog["catalog_number"].string!){
                }
                else{
                    self.catalogNumberList.append(catalog["catalog_number"].string!)
                }
            }
            self.ifSleep = false;
        }
    }
    
    func getCourseDescription(){
        // add course description here
        WatSwift.Courses.courseInformation(subject: self.subjectSelected, catalogNumber: self.catalogSelected) { response in
            let description_data: JSON = response.data
            CourseSearchViewController.courseDescription = description_data["description"].string!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // termPicker, subjectPicker, catalogPicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        
        if pickerView == self.termPicker {
            return termList[row]
        }
        else if pickerView == self.subjectPicker {
            return subjectList[row]
        }
        else {
            return catalogNumberList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == self.termPicker {
            return termList.count
        }
        else if pickerView == self.subjectPicker {
            return subjectList.count
        }
        else {
            return catalogNumberList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == self.termPicker {
            self.termTextBox.text = self.termList[row]
            self.termSelected = self.termList[row]
            self.termPicker.isHidden = true
            getSubjectList(self.termSelected) //read the value chosen by user
        }
        if pickerView == self.subjectPicker {
            self.subjectTextBox.text = self.subjectList[row]
            self.subjectSelected = self.subjectList[row]
            self.subjectPicker.isHidden = true
            getCatalogNumberList(self.termSelected, subject: self.subjectSelected)
        }
        if pickerView == self.catalogPicker {
            self.catalogTextBox.text = self.catalogNumberList[row]
            self.catalogSelected = self.catalogNumberList[row]
            self.catalogPicker.isHidden = true
            getClassInfoList(self.termSelected,subjectID: self.subjectSelected,catalogID: self.catalogSelected)
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.termTextBox {
            self.termPicker.isHidden = false
            textField.endEditing(true)
        }
        if textField == self.subjectTextBox	 {
            self.subjectPicker.reloadAllComponents()
            self.subjectPicker.isHidden = false
            textField.endEditing(true)
        }
        if textField == self.catalogTextBox {
            sleep(1)
            self.catalogPicker.reloadAllComponents()
            self.catalogPicker.isHidden = false
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
        // TODO: add course checking
            
            
            
            
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
