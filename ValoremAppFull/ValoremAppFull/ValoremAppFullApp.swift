//
//  ValoremAppFullApp.swift
//  ValoremAppFull
//
//  Created by Henry  Barklam on 6/11/21.
//

import SwiftUI
import Firebase

@main
struct ValoremAppFullApp: App {
    var userInfo = UserInfo()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userInfo)
        }
    }
}
