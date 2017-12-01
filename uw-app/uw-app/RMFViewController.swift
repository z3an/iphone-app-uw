//
//  RMFViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-12-01.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class RMFViewController: UIViewController {
    @IBOutlet weak var RMFWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string:"http://www.ratemyprofessors.com/")
        RMFWebView.loadRequest(URLRequest(url:url!))
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
