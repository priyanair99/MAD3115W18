//
//  ViewController.swift
//  Day2
//
//  Created by MacStudent on 2018-02-21.
//  Copyright © 2018 Himauli. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var txtEmail: UITextField!
   
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnLoginAction(_ sender: UIBarButtonItem) {
        
        let Email = txtEmail.text
        let Password = txtPassword.text
        
        if(Email == "test" && Password == "test")
        {
            let infoAlert = UIAlertController(title: "Login Sucessful", message: "You are authenticated", preferredStyle: .alert)
            
            infoAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            self.present(infoAlert, animated: true, completion: nil)
        }
    }
   // @IBAction func btnLoginAction(_ sender: UIButton) {
        
        
   // }
    
    @IBAction func btnRegisterAction(_ sender: UIBarButtonItem) {
        
        let registerSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registerVC = registerSB.instantiateViewController(withIdentifier: "RegestrationScreen")
        
       // self.present(registerVC, animated: true, completion: nil)
        
        navigationController?.pushViewController(registerVC, animated: true)
    }
   // @IBAction func btnRegisterAction(_ sender: UIButton) {
        
   // }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

