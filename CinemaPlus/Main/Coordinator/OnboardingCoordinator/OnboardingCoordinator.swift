//
//  OnboardingController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 14.11.2023.
//

import UIKit

class OnboardingCoordinator{
    
    @IBOutlet var CustomView: UIView!
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func getLoginController() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginControllerr") as! LoginControllerr
        navigationController.show(controller, sender: nil)
    }
}
