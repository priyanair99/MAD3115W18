//
//  webPageVC.swift
//  MAD_3115_Day4
//
//  Created by MacStudent on 2018-02-26.
//  Copyright © 2018 Sonal. All rights reserved.
//

import UIKit
import WebKit

class webPageVC: UIViewController {

    @IBOutlet weak var MyWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadWebPage()
        loadManualPage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebPage(){
        let url = NSURL (string: "https://www.google.com");
        let requestObj = NSURLRequest(url: url! as URL)
        MyWebView.load(requestObj as URLRequest)
    }
    
    func loadManualPage(){
        let localfilePath = Bundle.main.url(forResource: "Pizza", withExtension: "html")
        let myRequest = NSURLRequest(url: localfilePath!)
        MyWebView.load(myRequest as URLRequest)
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
