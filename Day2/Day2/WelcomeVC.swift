//
//  WelcomeVC.swift
//  Day2
//
//  Created by MacStudent on 2018-02-21.
//  Copyright © 2018 Himauli. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    var welcomeTitle: String = ""
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Welcome"
    }
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

}
