//
//  ViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import Foundation

class NameListViewModel {
    
    
    var movie: NameList?
    var successCallback : (()->())?
    var errorCallback   : ((String)->())?
    var movieID         : Int?
    var items = [NameResult]()


    
    func getNameList() {
        VideoManager.shared.getmovieDetails(id: movieID ?? 0) { movieDetails, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let movieDetails = movieDetails {
                self.movie = movieDetails
                self.successCallback?()
            }
        }
    }
}
