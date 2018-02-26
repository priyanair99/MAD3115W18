//
//  ViewController.swift
//  MAD_3115_Day3
//
//  Created by MacStudent on 2018-02-22.
//  Copyright © 2018 Sonal. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var switchRemember: UISwitch!
    
    
    @IBAction func btnRegister(_ sender: UIBarButtonItem) {
        let registerSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registerVC = registerSB.instantiateViewController(withIdentifier: "RegistrationScreen")
        
        //         self.present(registerVC, animated: true, completion: nil)
        
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @IBAction func btnLogin(_ sender: UIBarButtonItem) {
        if authenicateUser() {
            
            //save data
            if self.switchRemember.isOn {
                self.saveData()
            }else{
                self.removeData()
            }
            
            //display next screen
            displayMenuScreen()
        }
        else{
            //get an instance of AlertController
            let infoAlert = UIAlertController(title: "Incorrect Data", message: "Email or Password incorrect...Please retry", preferredStyle: .alert)
            
            //add Retry button
            infoAlert.addAction(UIAlertAction(title: NSLocalizedString("Retry", comment: "Default action"), style: .destructive, handler: nil))
            
            //display an alert
            self.present(infoAlert, animated: true, completion: nil)
        }
    }
    
    func saveData(){
        UserDefaults.standard.set(self.txtEmail.text, forKey: "userName")
        UserDefaults.standard.set(self.txtPassword.text, forKey: "password")
    }
    func getData(){
        if let email = UserDefaults.standard.value(forKey: "userName"){
            self.txtEmail.text = email as? String
        }
        
        if let password = UserDefaults.standard.value(forKey: "password")  {
            self.txtPassword.text = password as? String
        }
    }
    
    func removeData(){
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "password")
    }
    
    func authenicateUser() -> Bool{
        
        if (txtEmail.text == "sv@sv.com" && txtPassword.text == "sv"){
            return true
        }
        else{
            return false
        }
    }
    func displayMenuScreen() {
        let menuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC = menuSB.instantiateViewController(withIdentifier: "MenuScreen")
        navigationController?.pushViewController(menuVC, animated: true)
    }
    
}

