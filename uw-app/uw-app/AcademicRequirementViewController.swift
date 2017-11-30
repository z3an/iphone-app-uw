//
//  AcademicRequirementViewController.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-11-30.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class AcademicRequirementViewController: UIViewController {

    @IBOutlet weak var academicWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:OptionViewController.URL)
        academicWebView.loadRequest(URLRequest(url:url!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
