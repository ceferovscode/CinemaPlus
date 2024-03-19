//
//  LoginCoordinator.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 14.11.2023.
//

import UIKit

class LoginCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func registerClicked() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterController") as! RegisterController
        navigationController.show(controller, sender: nil)
    }
   
}
