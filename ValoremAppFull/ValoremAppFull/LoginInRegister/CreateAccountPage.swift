//
//  SwiftUIView.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 6/25/21.
//

import SwiftUI

struct CreateAccountPage: View {
    @State var email = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("reddit-logo-light")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                VStack{
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    SecureField("Email Address", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Create an Account")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Create an Account")
        }
    }
}

struct CreateAccountPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountPage()
    }
}
