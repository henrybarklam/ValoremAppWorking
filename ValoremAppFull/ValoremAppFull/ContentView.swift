//
//  ContentView.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 6/27/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfo : UserInfo
    
    var body: some View {
        Group {
            if userInfo.isUserAuthenticated == .undefined {
                Text("Loading...")
            } else if userInfo.isUserAuthenticated == .signedOut {
                LoginView()
            } else {
                WelcomeView()
            }
        }
        .onAppear(perform: {
            self.userInfo.configureFirebaseStateDidChange()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
