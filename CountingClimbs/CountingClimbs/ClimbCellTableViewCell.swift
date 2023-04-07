//
//  ClimbCellTableViewCell.swift
//  CountingClimbs
//
//  Created by Sophia Chiang on 3/31/23.
//

import UIKit

class ClimbCellTableViewCell: UITableViewCell {

    @IBOutlet weak var climbDescLabel: UILabel!
    @IBOutlet weak var climbNameLabel: UILabel!
    
    var climb: Climb?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
