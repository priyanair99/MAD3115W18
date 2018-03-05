//
//  ContactDetailVC.swift
//  Day9CollectionTabBar
//
//  Created by MacStudent on 2018-03-05.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit
import CallKit
import MessageUI

class ContactDetailVC: UIViewController {

    @IBOutlet var lblCall: UILabel!
    @IBOutlet var lblText: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var happy: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCallAction(_ sender: Any) {
        print("calling....")
        let url = URL(string: "tel://+11231231231")
        
        if UIApplication.shared.canOpenURL(url!){
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url!)
            }
            else{
                UIApplication.shared.openURL(url!)
            }
        }
    }
    
    
    @IBAction func btnTextAction(_ sender: Any) {
        print("Messaging.....")
        if MFMessageComposeViewController.canSendText() {
            
            let messageVC = MFMessageComposeViewController()
                
                messageVC.body = "Hello, How are You?"
                messageVC.recipients = ["+11232232232"]
                messageVC.messageComposeDelegate = self as?
                MFMessageComposeViewControllerDelegate
                self.present(messageVC,animated: true,completion: nil)
            
        }
        
        
    }
    
    // MFMailComposeViewControllerDelegate for Message
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        //for Message
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        }
        
        //for Email
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnEmailAction(_ sender: Any) {
        print("sending email....")
        
        if MFMailComposeViewController.canSendMail(){
            
            let EmailPicker = MFMailComposeViewController()
            
            EmailPicker.mailComposeDelegate = self as MFMailComposeViewControllerDelegate
            EmailPicker.setSubject("Test Email")
            EmailPicker.setMessageBody("Hello, How are You!", isHTML: true)
            
            self.present(EmailPicker, animated: true, completion: nil)
        }
        else{
            print("can't sent email...")
        }
        
        
    }
    @objc func goToContacts(){
        self.navigationController?.popViewController(animated: true)
    }
}

extension ContactDetailVC: MFMailComposeViewControllerDelegate{
    func mailComposeController(controller: MFMailComposeViewController,
                               didFinishWithResult result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
}


