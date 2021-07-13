//
//  HomeView.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 6/27/21.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        NavigationView {
            Text("Logged in as \(userInfo.user.firstName) \(userInfo.user.lastName)")
            .navigationBarTitle("Firebase Login")
                .navigationBarItems(trailing: Button("Log Out"){
                    //may want error switch handler
                    FBAuth.logout { (result) in
                        print("Logged out")
                    }
                })
                .onAppear {
                    //check for existence of current user and assigned user's uid to uid constant for func
                    guard let uid = Auth.auth().currentUser?.uid else {
                        return
                    }
                    FBFirestore.retrieveFBUser(uid: uid){ (result) in
                        switch result {
                        case .failure(let error):
                            print(error.localizedDescription)
                            //if failure, have error description
                            //display alert to user (shouldn't happen)
                        case .success(let user):
                            self.userInfo.user = user
                        }
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
