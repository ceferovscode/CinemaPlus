//
//  OnboardingController.swift
//  CinemaPlus

//
//  Created by Alparslan Cafer on 10.11.2023.
//

import UIKit

class OnboardingController: UIViewController {
    
    @IBOutlet private var customView        : UIView!
    @IBOutlet private weak var nextClicked  : UIButton!
    
    private var coordinator: OnboardingCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        initialSetup()
        configureCoordinator()

}
    
    private func configureCoordinator() {
        coordinator = OnboardingCoordinator(navigationController: navigationController ?? UINavigationController())

    }
    
    private func initialSetup() {
        nextClicked.applyGradient(colors: [UIColor.purple.cgColor])
        
        customView.applyGradientView(colors: [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor])
    }
    
    @IBAction func NextClicked(_ sender: Any) {
        coordinator?.getLoginController()
    }
    
    
}

