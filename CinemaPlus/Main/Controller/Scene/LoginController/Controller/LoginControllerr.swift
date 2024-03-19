//
//  LoginController.swift

//  CinemaPlus
//
//  Created by Alparslan Cafer on 13.11.2023.
//

import UIKit

class LoginControllerr: UIViewController {
    
    @IBOutlet private weak var loginClicked     : UIButton!
    @IBOutlet private weak var emailText        : UITextField!
    @IBOutlet private weak var PasswordText     : UITextField!
    @IBOutlet private var CustomView            : UIView!
    @IBOutlet private weak var regsiterButton   : UIButton!
    
    
    private var coordinator: LoginCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        customBackButton()
        configureCoordinator()
        customLabel()
        customTextField()
        
       
        
        
    }
    
    private func customTextField() {
        emailText.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);

        PasswordText.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
    }
    
    private func customLabel() {
         regsiterButton.layer.addSublayer(createLayer(frame: .init(x: 0,
                                                                y: regsiterButton.frame.height - 5,
                                                                width: regsiterButton.frame.width,
                                                                height: 3),
                                                   color: .white))
    }
    
    private func createLayer(frame: CGRect, color: UIColor) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = color.cgColor
        return layer
    }
    
    private func configureCoordinator() {
        coordinator = LoginCoordinator(navigationController: navigationController ?? UINavigationController())
        
    }
    
    private func customBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    private func initialSetup() {
        
        loginClicked.applyGradient(colors: [UIColor.purple.cgColor])
        
        CustomView.applyGradientView(colors: [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor])
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    

    @IBAction func registerClicked(_ sender: Any) {
        coordinator?.registerClicked()
    }
    
    func handleLogout() {
        UserDefaults.standard.set(false, forKey: "loggedIn")
        // You might want to reset other relevant user data or configurations here
    }

    
    @IBAction func loginClicked(_ sender: Any) {
        guard let email     = emailText.text else { return }
        guard let password  = PasswordText.text else { return }
        
        AutService.shared.logUSerIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error logging in \(error.localizedDescription)")
                return
            }
            
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabController") as! UITabBarController
                sceneDelegate.window?.rootViewController = tabBarController
                sceneDelegate.window?.makeKeyAndVisible()
                UserDefaults.standard.set(true, forKey: "login")
            }
        }
    }
}
