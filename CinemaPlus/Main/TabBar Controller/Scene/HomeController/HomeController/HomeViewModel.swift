//
//  HomeViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 16.11.2023.
//

import Foundation

class HomeViewModel {
    
    var items = [MovieResult]()
    var movie: Movie?
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getPopularMovie() {
        HomeManager.shared.getPopularMovie(page: (movie?.page ?? 0) + 1) { movies, errorMessage in
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
            getPopularMovie()
        }
    }
    
    func reset() {
        items.removeAll()
        movie = nil
    }
}
