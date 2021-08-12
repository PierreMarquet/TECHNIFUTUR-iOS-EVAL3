//
//  TableViewCell.swift
//  Marquet_Pierre_iOS_Eval3
//
//  Created by Student05 on 12/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class TableViewCell: UITableViewCell {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var backgroundImage2: UIImageView!
    @IBOutlet var cellNumber: UILabel!
    @IBOutlet var cryptoName: UILabel!
    @IBOutlet var cryptoValue: UILabel!
    @IBOutlet var cryptoPercent: UILabel!
    @IBOutlet var cellNumberImage: UIImageView!
    @IBOutlet var infoImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(table: Results){
                
        
        backgroundImage2.backgroundColor = .purple
        
        backgroundImage.backgroundColor = .white
        backgroundImage.layer.cornerRadius = 25
        backgroundImage.clipsToBounds = true
        
        cellNumber.text = table.rank
        cryptoName.text = table.id
        cryptoValue.text = table.priceUsd
        
        
        cryptoPercent.text = table.changePercent24Hr
        
        cellNumberImage.backgroundColor = .systemYellow
        cellNumberImage.layer.cornerRadius = cellNumberImage.frame.height/2
        
        
    }
    
    func formattedPrice(table: String) -> String {
        if let double = Double(table) {
                let doubleValue: String = String(format: "%2.2f", double)
                return "\(doubleValue)$"
            }
            return "- $"
        }
    
}
