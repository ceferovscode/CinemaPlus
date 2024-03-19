//
//  Image Extension.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 16.11.2023.
//

import Foundation
import SDWebImage


extension UIImageView {
    func loadUrl(_ posterPath: String) {
        let posterBaseURL = "https://image.tmdb.org/t/p/original"
        if let url = URL(string: posterBaseURL + posterPath) {
            self.sd_setImage(with: url)
        }
    }
}

