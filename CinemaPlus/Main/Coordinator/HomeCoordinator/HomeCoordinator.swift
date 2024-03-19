//
//  HomeCoordinator.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 17.12.2023.
//

import UIKit

class HomeCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showMovieDetails(movieId: Int) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsController") as! DetailsController
        controller.viewModel.movieID = movieId
        navigationController.show(controller, sender: nil)
    }
    
    func showMoviesGenre() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GenreController") as! GenreController
        navigationController.show(controller, sender: nil)
    }
    
    func showVideoList() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MovelistController") as! MovelistController
        navigationController.show(controller, sender: nil)
    }
    
    func showNameList(movieId: Int) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NameListController") as! NameListController
        controller.viewModel.movieID = movieId
        navigationController.show(controller, sender: nil)
    }
    
    func showVideo(videoId: String) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VideoController") as! VideoController
        controller.viewModel.movieID = videoId
        navigationController.show(controller, sender: nil)
    }
}
    

    
