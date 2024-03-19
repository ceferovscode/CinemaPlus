//
//  MoveListViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import Foundation

class MoveListViewModel {
    
    var items = [MovieResult]()
    var movie: Movie?
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
 
    func getMovieDetails() {
        NameManager.shared.getPopularMovie(page: (movie?.page ?? 0) + 1) { movieDetails, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let movie = movieDetails {
                self.movie = movie
                self.items.append(contentsOf: movie.results ?? [])
                self.successCallback?()
            }
        }
    }
    
    func pagination(index: Int) {
        if (index == items.count - 1) && (movie?.page ?? 0 <= movie?.totalPages ?? 0 ) {
            getMovieDetails()
        }
    }
    
    func reset() {
        items.removeAll()
        movie = nil
    }
}
