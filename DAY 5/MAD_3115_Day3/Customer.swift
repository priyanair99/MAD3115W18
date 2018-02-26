//
//  Customer.swift
//  MAD_3115_Day3
//
//  Created by MacStudent on 2018-02-22.
//  Copyright © 2018 Sonal. All rights reserved.
//

import UIKit

class Customer {
    
    var name: String?
    var email: String?
    var number: Int?
    var password: String?
    var dateOfBirth: Date!
    var city: String?
    var postalCode: String?
    private static var customerList = [String: Customer]()
    
     init(){
        self.name = ""
        self.email = ""
        self.number = 0
        self.password = ""
        self.dateOfBirth = Date()
        self.city = ""
        self.postalCode = ""
    }
    
    init(name: String, email: String, number: Int, password: String, dob: Date, city: String, postalCode: String){
        self.name = name      
        self.email = email
        self.number = number
        self.password = password
        self.dateOfBirth = dob
        self.city = city
        self.postalCode = postalCode
    }
    static func addCustomer(cust: Customer) -> Bool{
        if self.customerList[cust.email!] == nil{
            self.customerList[cust.email!] = cust
            return true
        }else{
            return false
        }
    }
    
    static func getCustomerByID(custEmail: String) -> Customer{
        
        if self.customerList[custEmail] != nil{
            return self.customerList[custEmail]!
        }
        return Customer()
    }
    
    static func getAllCustomers() -> [String:Customer] {
        return customerList
    }
}
