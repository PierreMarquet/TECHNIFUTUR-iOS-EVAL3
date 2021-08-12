//
//  LogoTableViewCell.swift
//  Marquet_Pierre_iOS_Eval3
//
//  Created by Student05 on 12/08/2021.
//

import UIKit

class LogoTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var logoImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(table: LogoResults){
        
        nameLable.text = table.name
        
        let url = URL(string: table.icon)
        logoImage.af.setImage(withURL: url!)
    }
    
}
