//
//  IconList.swift
//  ValoremApp
//
//  Created by Henry  Barklam on 6/8/21.
//

import SwiftUI

struct IconList: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell().backgroundColor = .clear
    }
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .top, endPoint: .bottom)
//            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            .overlay(
        NavigationView{
            VStack(alignment:.leading){
                Spacer()
                Spacer()

                Text("Tell Us What You \n Value Most")
                    .font(.title)
                    .bold()
                    .padding(.trailing,20)
                    .padding(.vertical, -4.0)
                    .frame(width: 288, height: 61, alignment: .center)
                    .padding(.horizontal, 30)
                    .navigationBarTitle("Navigation Title")
                    .navigationBarHidden(true)
                
                //            Text("Tell Us What Matters Most To You")
                //                .font(.largeTitle)
                //                .bold()
                //                .padding()
                
                
                List(icons){ icon in
                    IconRow(icon: icon)
                    
                }
                .listRowInsets(EdgeInsets())
                NavigationLink(destination: PortfolioPage()) {
                    //            Button(action:{
                    //                print("Yes")
                    //            })
                    //            {
                    Text("Continue")
                        .fontWeight(.bold)
                        .padding()
                        
                        
                        //            }
                        .padding(.horizontal, 70)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .border(Color.blue, width: 5)
                        .cornerRadius(10)
                        .padding(.bottom, 0)
                        .padding(.horizontal, 80)
                    
                    
                }
                //FIGURE THIS OUT
                //            NavigationView{
                //                Text("Continue")
                //            }
                //            .navigationViewStyle(StackNavigationViewStyle())
                
                
            }
            .environment(\.defaultMinListRowHeight, 10)
            .padding(.top,5)
            .padding(.bottom,5)
            //Change this to make it aesthetic
            .navigationBarHidden(true)
            //        )
        }

    }
}

struct IconList_Previews: PreviewProvider {
    static var previews: some View {
        IconList()
    }
}
