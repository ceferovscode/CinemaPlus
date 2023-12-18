//
//  NetworkHelper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 16.11.2023.
//

import Foundation


class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let baseUrl       = "https://api.themoviedb.org/3/"
    let apiKey        = "0352d5121fca155df4ba7b0f29b4e4aa"
    let imageBaseUrl  = "https://image.tmdb.org/t/p/original/"

    func urlConfiqure(path: String) -> String {
        baseUrl + path + "?api_key=\(apiKey)"
    }

}
