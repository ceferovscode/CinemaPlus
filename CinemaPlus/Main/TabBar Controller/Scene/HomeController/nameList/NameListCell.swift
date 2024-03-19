//
//  NameListCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import UIKit

class NameListCell: UITableViewCell {

   
    @IBOutlet private weak var nameLabel: UILabel!
    
    
    func configureData(data: NameList) {
        nameLabel.text = data.results?.first?.name
    }
}
