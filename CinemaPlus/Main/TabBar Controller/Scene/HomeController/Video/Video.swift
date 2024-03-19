//
//  Video.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.03.24.
//

import Foundation


struct Video {
    let name: String
    let key: String
    
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
              let key = dictionary["key"] as? String else {
            return nil
        }
        self.name = name
        self.key = key
    }
}
