//
//  DetailsManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 18.12.2023.
//

import UIKit

class GenreManager  {
    
    static let shared = GenreManager()
    
    func getGenresMovies(complete: @escaping ((MovieGen?, String?) -> ())) {
        NetworkManager.shared.request(model: MovieGen.self,
                                      url: GenreEndPoint.details.path,
                                      complete: complete)
    }
    
    
}
