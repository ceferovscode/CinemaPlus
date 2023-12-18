//
//  RegisterController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 14.11.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class RegisterController: UIViewController {
    
    @IBOutlet private weak var fullnameText     : UITextField!
    @IBOutlet private weak var emailText        : UITextField!
    @IBOutlet private weak var passwordText     : UITextField!
    @IBOutlet private weak var registerButton   : UIButton!
    @IBOutlet private var CustomView            : UIView!
    @IBOutlet private weak var CustomLabel      : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        customBackButton()
        customLabel()
        customTextField()

    }
    
    private func customTextField() {
        fullnameText.layer.sublayerTransform    = CATransform3DMakeTranslation(15, 0, 0);
        emailText.layer.sublayerTransform       = CATransform3DMakeTranslation(15, 0, 0);
        passwordText.layer.sublayerTransform    = CATransform3DMakeTranslation(15, 0, 0);

    }
    
    private func initialSetup() {
        registerButton.applyGradient(colors: [UIColor.purple.cgColor])
        CustomView.applyGradientView(colors: [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor])
        
    }
    
    private func customBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private  func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil )
    }
    
    private func createLayer(frame: CGRect, color: UIColor) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = color.cgColor
        return layer
    }
    
    private func customLabel() {
        CustomLabel.layer.addSublayer(createLayer(frame: .init(x: 0,
                                                                y: CustomLabel.frame.height - 5,
                                                                width: CustomLabel.frame.width,
                                                                height: 3),
                                                   color: .white))
    }
    
  
    
   

    @IBAction func registerClicked(_ sender: Any) {
    
        
        guard let email = emailText.text, !email.isEmpty else {
            makeAlert(titleInput: "Error", messageInput: "Please enter your email.")
            return
        }
        
        guard let password = passwordText.text, !password.isEmpty else {
            makeAlert(titleInput: "Error", messageInput: "Please enter your password.")
            return
        }
        
        guard let fullname = fullnameText.text, !fullname.isEmpty else {
            makeAlert(titleInput: "Error", messageInput: "Please enter your full name.")
            return
        }
        
        let credentials = AuthCredentials(email: email, password: password, fullname: fullname)
        
        AutService.shared.registerUser(credentials: credentials) { error, ref in
            if let error = error {
                self.makeAlert(titleInput: "Error", messageInput: error.localizedDescription)
                
                return
            }
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)

            }
        }
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    
    
    
}
