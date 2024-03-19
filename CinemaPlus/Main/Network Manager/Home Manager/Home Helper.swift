//
//  Home Helper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 16.11.2023.
//

import Foundation

enum HomeEndPoint: String {
    case popular    = "movie/popular"
    case topRated   = "movie/top_rated"
    case upcoming   = "movie/upcoming"

    
    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
