//
//  ContentView.swift
//  ValoremAppFull
//
//  Created by Henry  Barklam on 6/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstView = true
    @State var appeared: Double = 0
    @State var gradient = [Color.red, Color.purple, Color.orange]
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 2)
    
    //This decides the animation type
    init(){
        UINavigationBar.setAnimationsEnabled(true)
    }
    
    var body: some View {
        
        NavigationView(){
            LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint)
            .ignoresSafeArea() // Ignore just for the color
            .onAppear() {
                withAnimation (.easeInOut(duration: 2).repeatForever(autoreverses: true)){
                    self.startPoint = UnitPoint(x: 1, y: -1)
                    self.endPoint = UnitPoint(x: 0, y: 1)
                }
            }
            .overlay(
                
                
                VStack {

                    NavigationLink(destination: IconList()            .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)){
                        
                    Text("Welcome to Valorem")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .gradientForeground(colors: [.white, .white])
                        .padding(.bottom, 100)
                        .opacity(0.4)

                    }
            
                })
                    
                }
        }

}

struct AnimatedGradientView1: View {
    
    @State var gradient = [Color.red, Color.purple, Color.orange]
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 2)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
            .frame(width: 256, height: 256)
            .onTapGesture {
                withAnimation (.easeInOut(duration: 3)){
                    self.startPoint = UnitPoint(x: 1, y: -1)
                    self.endPoint = UnitPoint(x: 0, y: 1)
                }
        }
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
