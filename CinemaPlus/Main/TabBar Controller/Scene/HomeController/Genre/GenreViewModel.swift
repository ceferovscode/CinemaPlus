//
//  GenreViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.12.2023.
//

import UIKit

class GenreViewModel {
    
    var items = [GenreElement]()
    var movie: MovieGen?
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
 
    func getMoviesGenres() {
        GenreManager.shared.getGenresMovies { movies, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let movie = movies {
                self.movie = movie
                self.items.append(contentsOf: movie.genres ?? [])
                self.successCallback?()
            }
        }
    }
    
    func reset() {
        items.removeAll()
        movie = nil
    }
}
