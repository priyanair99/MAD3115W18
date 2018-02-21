//
//  ViewController.swift
//  Design
//
//  Created by MacStudent on 2018-02-20.
//  Copyright © 2018 Sonal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtnumber: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        let email = txtEmail.text!
        lblEmail.text = email
        lblNumber.text = txtnumber.text!
        lblName.text = txtName.text!
        
        //store alert controller
        let infoAlert = UIAlertController(title: "User Information", message: txtEmail.text, preferredStyle: .actionSheet)
        
        infoAlert.addAction(UIAlertAction(title: "Login", style: .default, handler: nil))
        
        infoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(infoAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

