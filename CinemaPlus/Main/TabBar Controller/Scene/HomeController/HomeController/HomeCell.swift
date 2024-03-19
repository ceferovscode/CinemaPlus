//
//  HomeCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 16.11.2023.
//

import UIKit

protocol ImageLabelCellProtocol {
    var imageUrl : String { get }
}

class HomeCell: UICollectionViewCell {

    
    @IBOutlet private weak var titleImage: UIImageView!
    
    override func layoutSubviews() {
        titleImage.layer.cornerRadius = 20
       
    }
    
    func confiqure(data: ImageLabelCellProtocol) {
        titleImage.loadUrl(data.imageUrl)
    }
}
