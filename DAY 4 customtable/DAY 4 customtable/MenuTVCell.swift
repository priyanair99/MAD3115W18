//
//  MenuTVCell.swift
//  DAY 4 customtable
//
//  Created by MacStudent on 2018-02-23.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class MenuTVCell: UITableViewCell
{

    @IBOutlet weak var lblItemTitle: UILabel!
    
    @IBOutlet weak var lblSpecial: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblRegularPrice: UILabel!
    func show(isSpecial: Bool, price: Double){
        if !isSpecial{
            lblSpecial.text = ""
            lblRegularPrice.text = ""
            lblPrice.text = "$\(price)"
            contentView.backgroundColor = UIColor.white
        }else{
            lblSpecial.text = "Special"
            lblRegularPrice.text = "Regular price $\(price)"
            lblPrice.text = "$ \(price-1.0)"
            contentView.backgroundColor = UIColor.init(red: 0.2, green: 1.0, blue: 0.7, alpha: 0.4)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
