//
//  CourseDetailsViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-11-14.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sectionList = ["001", "002", "003", "004"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //sectionTable
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "sectionCell")
        sectionCell.textLabel?.text = sectionList[indexPath.row]
        return sectionCell
    }
    
    
}
