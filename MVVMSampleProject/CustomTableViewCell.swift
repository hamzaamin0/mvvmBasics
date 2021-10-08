//
//  CustomTableViewCell.swift
//  MVVMSampleProject
//
//  Created by MAC on 08/10/2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    public func configure(with viewModel: CellViewModel){
        
        nameLabel.text = viewModel.name
    }
    
}
