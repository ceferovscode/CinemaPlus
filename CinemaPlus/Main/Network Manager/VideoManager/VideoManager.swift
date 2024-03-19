//
//  VideoManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import Foundation

class VideoManager  {
    
    static let shared = VideoManager()
    
    func getGenresMovies(complete: @escaping ((MovieGen?, String?) -> ())) {
        NetworkManager.shared.request(model: MovieGen.self,
                                      url: VideoEndPoint.details.path,
                                      complete: complete)
    }
    
    
}
