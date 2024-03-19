//
//  NameManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 20.12.2023.
//

import Foundation

class NameManager {
    
    static let shared = NameManager()
    
    
    func getPopularMovie(page: Int, complete: @escaping ((Movie?, String?) -> ())) {
        NetworkManager.shared.request(model: Movie.self,
                                      url: HomeEndPoint.popular.path + "&page=\(page)",
                                      complete: complete)
    }
    
    
}
