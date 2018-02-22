//
//  Customer.swift
//  Login
//
//  Created by Mac on 2018-02-22.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
class Customer{
    var Name: String!
    var ContactNumber: String!
    var DateOfBirth: Date!
    var City: String!
    var PostalCode: String!
    var Email: String!
    var Password: String!
    private static var customerList = [String: Customer]()
    
    init(){
        self.Name = ""
        self.ContactNumber = ""
        self.DateOfBirth = Date()
        self.City = ""
        self.PostalCode = ""
        self.Email = ""
        self.Password = ""
    }
    
    init(_ Name: String, _ ContactNumber: String, _ DateOfBirth: Date, _ City: String, _ PostalCode: String, _ Email: String, _ Password: String){
        self.Name = Name
        self.ContactNumber = ContactNumber
        self.DateOfBirth = DateOfBirth
        self.City = City
        self.PostalCode = PostalCode
        self.Email = Email
        self.Password = Password
    }
    
    static func addCustomer(cust: Customer) -> Bool{
        if self.customerList[cust.Email] == nil{
            self.customerList[cust.Email] = cust
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
