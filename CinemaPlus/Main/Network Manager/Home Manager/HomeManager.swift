//
//  HomeManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 16.11.2023.
//

import Foundation

class HomeManager {
    
    static let shared = HomeManager()
    
    
    func getPopularMovie(page: Int, complete: @escaping ((Movie?, String?) -> ())) {
        NetworkManager.shared.request(model: Movie.self,
                                      url: HomeEndPoint.popular.path + "&page=\(page)",
                                      complete: complete)
    }
    
    
}
