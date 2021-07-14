//
//  FBKeys.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

//Namespace -> enum so not init method with instance
import Foundation
//Gives access to constants that reflects path and field names for FB collection
enum FBKeys {
    
    enum CollectionPath {
        static let users = "users"
    }
    
    enum User {
        static let uid = "uid"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let birthDate = "birthDate"
        static let email = "email"
        
        // Add app specific keys here
    }
}
