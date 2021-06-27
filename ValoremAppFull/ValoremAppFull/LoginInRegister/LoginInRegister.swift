//
//  SwiftUIView.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 6/25/21.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn:Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email:String, password:String){
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async{
                //Success
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email:String, password:String){
        //auth.createUser(withEmail: email, password: password, completion: <#T##((AuthDataResult?, Error?) -> Void)?##((AuthDataResult?, Error?) -> Void)?##(AuthDataResult?, Error?) -> Void#>)
        auth.createUser(withEmail:email, password:password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async{
                //Success
                self?.signedIn = true
            }
        }
    }
    
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct LoginInRegister: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn{
                VStack{
                    Text("You are signed in!")
                        .padding()
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Sign Out")
                            .frame(width: 200, height: 50)
                            .background(Color.red)
                            .foregroundColor(Color.blue)
                            .padding()
                    })
                }
            }
            else{
                SignInView()
            }
        }
        .onAppear(perform: {
            viewModel.signedIn = viewModel.isSignedIn
        })
    }
}

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Image("reddit-logo-light")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            VStack{
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else{
                        return
                    }
                    viewModel.signIn(email:email, password:password)
                }, label: {
                    Text("Login")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
                
                NavigationLink("Create Account", destination: SignUpView())
                    .padding()
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Login to your account")
    }
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Image("reddit-logo-light")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            VStack{
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else{
                        return
                    }
                    viewModel.signIn(email:email, password:password)
                }, label: {
                    Text("Sign Up")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
                NavigationLink("Login to account", destination: SignInView())
                    .padding()
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Create your account")
    }
}
struct  LoginRegister_Previews: PreviewProvider {
    static var previews: some View {
        LoginInRegister()
    }
}
