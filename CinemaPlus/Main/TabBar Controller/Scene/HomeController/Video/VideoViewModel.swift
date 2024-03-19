//
//  VideoViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//


import Foundation
import Alamofire

class VideoViewModel {
    var videos: [Video] = []
    let apiKey: String
    var movieID         : String?

    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func fetchVideoData(completion: @escaping () -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/1011985/videos?api_key=\(apiKey)"
        
        AF.request(urlString).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let results = json["results"] as? [[String: Any]] {
                    self.videos = results.compactMap { Video(dictionary: $0) }
                    completion()
                }
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
}
