//
//  PortfolioLoadingPage.swift
//  ValoremAppFull
//
//  Created by Henry  Barklam on 6/11/21.
//

import SwiftUI

struct PortfolioLoadingPage: View {
    @State private var isLoading = false
    @State var isActive:Bool = false

    var body: some View {
        ZStack{
            if self.isActive{
                PortfolioBuiltPageDisplay()
            }
            else{
        Circle()

            .trim(from: 0, to: 1.0)
            .stroke(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/), lineWidth: 15)
            .frame(width: 150, height: 150)
            .rotationEffect(Angle(degrees: isLoading ? 360:0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear(){
                self.isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.5){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
            .position(x: 205,y: 410)
            .rotation3DEffect(Angle(degrees: isLoading ? 360:0), axis: (x: -10.0, y: -10.0, z: -10.0))
            .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false))

                
            Circle()

                .trim(from: 0, to: 1.0)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing), lineWidth: 15)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: isLoading ? 360:0))
                .animation(Animation.linear(duration: 1)
                            .repeatForever(autoreverses: false))
                .onAppear(){
                    self.isLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.5){
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
                .rotation3DEffect(Angle(degrees: isLoading ? 360:0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false))
                .position(x: 205,y: 410)

                
            Text("Loading \nPortfolio")
            .font(.system(.caption, design: .monospaced))
            .bold()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)


            .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)

            }

        }

    }

    

}


struct PortfolioLoadingPage_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioLoadingPage()
    }
}
