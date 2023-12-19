//
//  GenreCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.12.2023.
//

import UIKit

class GenreCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
    
    func confiqure(data: GenreElement) {
        nameLabel.text = data.name
    }
}
