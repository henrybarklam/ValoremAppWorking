//
//  PortfolioPage.swift
//  ValoremAppFull
//
//  Created by Henry  Barklam on 6/11/21.
//

import SwiftUI

struct PortfolioPage: View {
    @State private var risk : Double = 0.0
    @State private var impact: Double = 0.0


    var body: some View {
        VStack(alignment:.center) {
            
            Text("What is your main focus")
                .font(.title)
                .bold()
                .padding(.leading, 20)
            
            VStack {
                Text("Consistent Impact")
                    .fontWeight(.medium)
                .padding()

                HStack {
                    SwiftyControls1(risk: $risk)
                    
                }
                .padding()
            }
            VStack {
                Text("Consistent Return")
                    .fontWeight(.medium)

                HStack {
                    SwiftyControls2(impact: $impact)
                }
                .padding()
                
                NavigationLink(destination: PortfolioLoadingPage()) {
                    Text("Continue")
                        
                        .fontWeight(.bold)
                        .padding()
                        .padding(.horizontal, 70)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .border(Color.blue, width: 5)
                        .cornerRadius(10)
                }
            }
            


            
            

        

                
                
                
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct PortfolioPage_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioPage()
    }
}

struct SwiftyControls1: View {
    @Binding var risk: Double
    
    var body: some View {
        Image(systemName: "minus")
        Slider(value: $risk, in: -100.0...100.0)
            
            .accentColor(Color.pink)

            

        Image(systemName: "plus")

    }
}


struct SwiftyControls2: View {
    @Binding var impact: Double
    
    var body: some View {
        Image(systemName: "minus")
        Slider(value: $impact, in: -100.0...100.0)
//            .gradientForeground(colors: [.green, .blue])
        Image(systemName: "plus")

    }
}
