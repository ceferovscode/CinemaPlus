//
//  DetailsHelper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 18.12.2023.
//

import Foundation

enum  DetailsEndPoint: String {
    case details  = "movie/"

    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
