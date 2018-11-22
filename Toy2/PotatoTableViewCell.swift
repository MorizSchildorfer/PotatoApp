//
//  PotatoTableViewCell.swift
//  Toy2
//
//  Created by Moriz Schildorfer on 11/22/18.
//  Copyright © 2018 Moriz Schildorfer. All rights reserved.
//

import UIKit

class PotatoTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var potatoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
