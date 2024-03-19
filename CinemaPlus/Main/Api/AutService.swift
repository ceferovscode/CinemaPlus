//
//  AutService.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 15.11.2023.
//
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore


struct AuthCredentials   {
    let email: String
    let password: String
    let fullname: String
}

struct AutService {
    
    static let shared = AutService()
    
    func logUSerIn(withEmail email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    
    func registerUser(credentials: AuthCredentials, completion: @escaping (Error?, DatabaseReference) -> Void){
        
        let email = credentials.email
        let password = credentials.password
        let fullname = credentials.fullname
 

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG4: Error is \(error.localizedDescription)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            let values = ["email": email, "password": password, "fullname": fullname]
            
            REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
        }
    }
}
