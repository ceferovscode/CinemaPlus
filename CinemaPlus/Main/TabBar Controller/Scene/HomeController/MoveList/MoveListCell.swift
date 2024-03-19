//
//  MoveListCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import UIKit

protocol ListLabelProtocol {
    var nameList : String { get }
}


class MoveListCell: UITableViewCell {

    @IBOutlet private weak var listLabel: UILabel!
    
    
    
    func confiqure(data: ListLabelProtocol) {
        listLabel.text = data.nameList
    }
    
}
