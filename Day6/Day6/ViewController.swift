//
//  ViewController.swift
//  Day6
//
//  Created by MacStudent on 2018-02-27.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtCarColor: UITextField!
    @IBOutlet weak var txtCarPlate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writePropertyList()
    {
        let myCar = NSMutableDictionary()
        myCar["CarPlate"] = self.txtCarPlate.text
        myCar["CarColor"] = self.txtCarColor.text
        if let plistPath = Bundle.main.path(forResource: "cars", ofType: "plist")
        {
            let carsplist = NSMutableArray(contentsOfFile: plistPath)
            carsplist?.add(myCar)
            if (carsplist?.write(toFile: plistPath, atomically: true))!
            {
                print("carslist : \(String(describing: carsplist))")
            }
        }
        else
        {
            print("Unable to locate plist file")
        }
        
    }
        
    
    @IBAction func btnAddNew(_ sender: Any) {
        self.writePropertyList()
    }
        
    @IBAction func btnlistAll(_ sender: Any) {
    }
}
    




