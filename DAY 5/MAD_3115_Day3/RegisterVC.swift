//
//  RegisterVCViewController.swift
//  MAD_3115_Day3
//
//  Created by MacStudent on 2018-02-22.
//  Copyright © 2018 Sonal. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var txtPostalCode: UITextField!
    
    var cityList: [String] = ["Vancouver", "Ottawa", "Toronto", "Calgary", "Windsor", "Ajax", "Pickering","Brampton", "Mississauga", "NorthYork", "Scarborough"]
    var selectedCityIndex: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Register"
        
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(displayValues))
        
        self.navigationItem.rightBarButtonItem = btnSubmit
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cityList[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add data in picker
        self.cityPicker.delegate = self
        self.cityPicker.dataSource = self

        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc private func displayValues(){
        self.selectedCityIndex = self.cityPicker.selectedRow(inComponent: 0)
        
        let allData: String = "\(self.txtName.text!) \n \(self.txtNumber.text!) \n \(self.dateOfBirth.date) \n \(self.cityList[selectedCityIndex]) \n \(self.txtPostalCode.text!) \n \(self.txtEmail.text!)"
        
        //Action Sheet
        let infoAlert = UIAlertController(title: "Verify your details", message: allData, preferredStyle: .actionSheet)
        
        infoAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        infoAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: nil))
        self.present(infoAlert, animated: true, completion: nil)
    }
    
    @objc func displayMenuScreen() {
        let newCustomer = Customer()
        
        if Customer.addCustomer(cust: newCustomer){
            let menuSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let menuVC = menuSB.instantiateViewController(withIdentifier: "MenuScreen")
            navigationController?.pushViewController(menuVC, animated: true)}
        else{
            print("Something goes wrong")
        }
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
