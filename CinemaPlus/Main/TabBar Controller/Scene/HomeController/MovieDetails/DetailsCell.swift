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
    @IBOutlet private weak var dateLabel        : UILabel!
    @IBOutlet private weak var IMDbLabel        : UILabel!
    @IBOutlet private weak var genreLabel1      : UILabel!
    
    
    
    func configureData(data: Details) {
        guard let url       = data.backdropPath else { return }
        namelabel.text      = data.originalTitle
        studiaLabel.text    = data.productionCompanies?.first?.name
        textInfo.text       = data.overview
        dateLabel.text      = data.releaseDate
        IMDbLabel.text      = data.voteAverage?.formatted()
        genreLabel1.text      = data.genres?.first?.name
        titleImageview.loadUrl(url)
    }
}
