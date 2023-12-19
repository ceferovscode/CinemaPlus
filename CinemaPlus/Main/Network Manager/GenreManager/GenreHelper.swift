//
//  DetailsHelper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 18.12.2023.
//

import Foundation

enum  GenreEndPoint: String {
    case details  = "genre/movie/list"

    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
