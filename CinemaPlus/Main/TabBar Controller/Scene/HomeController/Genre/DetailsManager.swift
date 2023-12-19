//
//  DetailsManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.12.2023.
//

import UIKit

class DetailsManager {
    
    static let shared = DetailsManager()
    
    func getmovieDetails(id: Int, completion: @escaping ((Details?, String?) -> ())) {
        NetworkManager.shared.request(model: Details.self,
                                      url: NetworkHelper.shared.urlConfiqure(path: "movie/\(id)"),
                                      complete: completion)
        
        
    }
}

