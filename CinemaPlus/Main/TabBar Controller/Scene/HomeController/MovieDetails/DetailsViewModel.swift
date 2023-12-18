//
//  DetailsViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 18.12.2023.
//

import UIKit

class DetailsViewModel {
    
    
    var movie: Details?
    var successCallback : (()->())?
    var errorCallback   : ((String)->())?
    var movieID         : Int?
    
    
    func getMovieDetails() {
        DetailsManager.shared.getmovieDetails(id: movieID ?? 0) { movieDetails, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let movieDetails = movieDetails {
                self.movie = movieDetails
                self.successCallback?()
            }
        }
    }
}
