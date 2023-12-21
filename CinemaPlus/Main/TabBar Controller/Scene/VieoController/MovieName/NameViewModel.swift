//
//  NameViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 20.12.2023.
//

import Foundation

class NameViewModel {
    
    var items = [MovieResult]()
    var movie: Movie?
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getMovieName() {
        NameManager.shared.getMovieName(page: (movie?.page ?? 0) + 1) { movies, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let movie = movies {
                self.movie = movie
                self.items.append(contentsOf: movie.results ?? [])
                self.successCallback?()
            }
        }
    }
    
    func pagination(index: Int) {
        if (index == items.count - 1) && (movie?.page ?? 0 <= movie?.totalPages ?? 0 ) {
            getMovieName()
        }
    }
    
    func reset() {
        items.removeAll()
        movie = nil
    }
}
