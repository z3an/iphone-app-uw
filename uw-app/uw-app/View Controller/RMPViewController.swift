//
//  RMFViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-12-01.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class RMPViewController: UIViewController {
    @IBOutlet weak var RMPWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var instructor: String = SectionDetailsViewController.firstInstructor.replacingOccurrences(of: " ", with: "+")
        instructor = instructor.replacingOccurrences(of: ",", with: "+")
        let url = URL(string:"http://www.ratemyprofessors.com/search.jsp?queryoption=HEADER&queryBy=teacherName&schoolName=University+of+Waterloo&schoolID=1490&query=" + instructor)
        RMPWebView.loadRequest(URLRequest(url:url!))
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
