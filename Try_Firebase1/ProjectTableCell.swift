//
//  ProjectTableCell.swift
//  Try_Firebase1
//
//  Created by Thomas Linton on 3/26/18.
//  Copyright © 2018 Thomas Linton. All rights reserved.
//

import UIKit

class ProjectTableCell: UITableViewCell {
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectPartCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
