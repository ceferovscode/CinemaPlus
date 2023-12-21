//
//  NameCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 22.12.2023.
//

import UIKit

class NameCell: UICollectionViewCell {

    @IBOutlet private weak var titleImage   : UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureData(data: MovieResult) {
        guard let url       = data.backdropPath else { return }
        nameLabel.text = data.originalTitle
        titleImage.loadUrl(url)
    }
}

