//
//  ContactTVC.swift
//  Day9CollectionTabBar
//
//  Created by MacStudent on 2018-03-05.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit
import Contacts

struct  myContacts {
    var givenName: String
    var familyName: String
    var phoneNo: String
    var emailID: String
}

class ContactTVC: UITableViewController {

    var myContactsStore = CNContactStore()
    var myContactList = [myContacts]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        
        myContactsStore.requestAccess(for: .contacts) {
            (sucesss, error) in
            if sucesss {
                print("Authorization Successful")
            }
        }
         self.fetchContacts()
    }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myContactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactcell", for: indexPath) as! ContactsCell
        
        // Configure the cell...
        
        
        cell.lbltitle.text = "\(myContactList[indexPath.row].givenName) \(myContactList[indexPath.row].familyName)"
        cell.lblSubtitle.text = myContactList[indexPath.row].phoneNo
        
        return cell
    }
    
func fetchContacts() {
    let key = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey,CNContactEmailAddressesKey] as [CNKeyDescriptor]
    
    let request = CNContactFetchRequest(keysToFetch: key)
    
    try!myContactsStore.enumerateContacts(with: request) {
        (contact, stoppingPointer) in
        
        let givenName = contact.givenName as String
        let familyName = contact.familyName as String
        
        var phoneNo = ""
        if(!contact.phoneNumbers.isEmpty){
            phoneNo = contact.phoneNumbers[0].value.stringValue
        }
        
        var emailID = ""
        if(!contact.emailAddresses.isEmpty){
            emailID = contact.emailAddresses[0].value as String
        }
        
        self.myContactList.append(myContacts(givenName: givenName, familyName: familyName, phoneNo: phoneNo, emailID: emailID))
    }
    self.tableView.reloadData()
}
}





/*override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
 let cell = tableView.dequeueReusableCell(withIdentifier: "contactcell", for: indexPath)as!ContactsCell
 
 
 
 // Configure the cell...
 
 cell.contactTitle.text = "\(myContacts[indexPath.row].givenName)\(myContacts[indexPath.row].familyName)"
 
 cell.contactSubtitle.text = myContacts[indexPath.row].phoneNo
 
 return cell
 
 }*/
 
 









    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



