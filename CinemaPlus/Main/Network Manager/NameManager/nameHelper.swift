//
//  nameHelper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 20.12.2023.
//

import Foundation

enum NameEndPoint: String {
    case popular    = "movie/popular"
    case topRated   = "movie/top_rated"
    case upcoming   = "movie/upcoming"

    
    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
