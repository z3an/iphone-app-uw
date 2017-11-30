//
//  EmailViewController.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-11-30.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var EmailWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:"https://outlook.office.com/owa/?realm=edu.uwaterloo.ca")
        EmailWebView.loadRequest(URLRequest(url:url!))
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

}
