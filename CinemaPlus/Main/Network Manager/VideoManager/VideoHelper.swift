//
//  VideoHelper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import Foundation

enum  VideoEndPoint: String {
    case details  = "/videos"

    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
