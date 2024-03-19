//
//  VideoManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import Foundation

class VideoManager  {
    
    static let shared = VideoManager()
    
    func getmovieDetails(id: Int, completion: @escaping ((NameList?, String?) -> ())) {
        NetworkManager.shared.request(model: NameList.self,
                                      url: NetworkHelper.shared.urlConfiqure(path: "movie/\(id)/videos"),
                                      complete: completion)
        
        
    }
    
    
}
