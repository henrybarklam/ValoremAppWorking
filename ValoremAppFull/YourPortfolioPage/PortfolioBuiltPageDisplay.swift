//
//  PortfolioBuiltPageDisplay.swift
//  ValoremAppFull
//
//  Created by Henry  Barklam on 6/23/21.
//

import SwiftUI

struct PortfolioBuiltPageDisplay: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea() // Ignore just for the color
            .overlay(
        VStack(alignment: .center){

            Spacer()
            Text("Here is your portfolio")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .fontWeight(.semibold)
            Spacer()
            HStack{
                
                Spacer()
                Spacer()
                Thumbnail(title: "Racial Equity", systemImage: "equal.circle", perCent: 0.76)
                Thumbnail(title: "Voting Rights", systemImage: "figure.wave.circle", perCent: 0.91)
                Spacer()
                Spacer()
                

            }
            HStack{
                Spacer()
                Spacer()
                Thumbnail(title: "Fair Pay", systemImage: "dollarsign.circle", perCent: 0.43)
                Thumbnail(title: "Gender Equality", systemImage: "person.2.circle", perCent: 0.21)
                Spacer()
                Spacer()

            }
            HStack{
                //Remember to change these
                Spacer()
                Spacer()
                Thumbnail(title: "Racial Equity", systemImage: "equal.circle", perCent: 0.32)
                Thumbnail(title: "Voting Rights", systemImage: "figure.wave.circle", perCent: 0.62)
                Spacer()
                Spacer()
            }
            Spacer()
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
        )
    }
}

struct Thumbnail: View {
    let title: String
    let systemImage: String
    let perCent: Double
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {

            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Image(systemName: "\(systemImage)")
                    .resizable()
                    //Here the frame has to fit
                    //the icon
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)

                    .foregroundColor(.green)
                    .opacity(0.5)
                Circle()
                    .trim(from: 0, to: CGFloat(perCent))
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing), lineWidth: 7)
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .center){
                Text("\(title)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .opacity(0.6)
                    .padding(.bottom, 3.0)

            }
        
            
        }
    }
}


struct PortfolioBuiltPageDisplay_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioBuiltPageDisplay()

    }
}
