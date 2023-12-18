//
//  DetailsCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 17.12.2023.
//

import UIKit

class DetailsCell: UICollectionViewCell {

    @IBOutlet private weak var titleImageview   : UIImageView!
    @IBOutlet private weak var namelabel        : UILabel!
    @IBOutlet private weak var studiaLabel      : UILabel!
    @IBOutlet private weak var textInfo         : UITextView!
    
    func configureData(data: Details) {
        guard let url = data.backdropPath else { return }
        namelabel.text = data.originalTitle
        studiaLabel.text = data.productionCompanies?.first?.name
        textInfo.text = data.overview
        titleImageview.loadUrl(url)
    }
}
