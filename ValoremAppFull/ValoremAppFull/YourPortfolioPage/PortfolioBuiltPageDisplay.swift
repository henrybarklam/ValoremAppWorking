//
//  PortfolioBuiltPageDisplay.swift
//  ValoremAppFull
//
//  Created by Henry  Barklam on 6/23/21.
//

import SwiftUI

struct PortfolioBuiltPageDisplay: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue,.white]), startPoint: .topTrailing, endPoint: .bottomLeading)
            .ignoresSafeArea()
            .opacity(0.2)
            // Ignore just for the color
        .overlay(
            
//            RoundedRectangle(cornerRadius: 10.0)

                    
        VStack(alignment: .center){

            Spacer()
            Text("Home")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .center)
                .opacity(0.8)

                .padding()
            
                .background(
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.init(red: 61/255, green: 99/255, blue: 157/255), Color.init(red: 21/255, green: 49/255, blue: 157/255)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        .frame(width: 1000, height: 1000, alignment: .center)
                        .offset(x: 0.0, y: -300)
                    
                
                )
            Spacer()
            
            
            TotalThumbnail(nameOfUser: "Henry", percentageReturn: "8.0")
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            
            
            HStack{
                
                Spacer()
                Spacer()
                Thumbnail(title: "Racial Equity", systemImage: "equal.circle", perCent: 0.76, onTrack: "On Track")
                Thumbnail(title: "Voting Rights", systemImage: "figure.wave.circle", perCent: 0.91, onTrack: "On Track")
                Spacer()
                Spacer()
                

            }
            HStack{
                Spacer()
                Spacer()
                Thumbnail(title: "Fair Pay", systemImage: "dollarsign.circle", perCent: 0.43, onTrack: "On Track")
                Thumbnail(title: "Gender Equality", systemImage: "person.2.circle", perCent: 0.21, onTrack: "Not on Track")
                Spacer()
                Spacer()

            }
            HStack{
                //Remember to change these
                Spacer()
                Spacer()
                Thumbnail(title: "Racial Equity", systemImage: "equal.circle", perCent: 0.32, onTrack: "On Track")
                Thumbnail(title: "Voting Rights", systemImage: "figure.wave.circle", perCent: 0.62, onTrack: "On Track")
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
    let onTrack: String
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {

            ZStack{
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fill)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Image(systemName: "\(systemImage)")
                    .resizable()
                    //Here the frame has to fit
                    //the icon
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.bottom, 30.0)

                    .foregroundColor(.black)
                    .opacity(0.5)
                Circle()
                    .trim(from: 0, to: (CGFloat(perCent)/100)*90)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.init(red: 61/255, green: 99/255, blue: 157/255), Color.white]), startPoint: .leading, endPoint: .trailing), lineWidth: 7)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(160.0))

                    .padding(.bottom, 30.0)

                
            }
            VStack(alignment: .center){

                Text("\(title)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .opacity(0.6)
                Text("\(onTrack)")
                    .fontWeight(.semibold)
                    .kerning(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 5.0)

                


            }
        
            
        }
    }
}

struct TotalThumbnail: View {
    let nameOfUser: String
    let percentageReturn: String
    
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {

            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(.white)
                    .frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding()
                
                HStack{
                    Text("Total Return \n \(percentageReturn)%")
                        .fontWeight(.semibold)
                        .padding(.init(top: 5.0, leading: 70.0, bottom: 5.0, trailing: 5.0))
                }
                HStack{
                    Text("Invest your money \nwith purpose")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .padding()
                
            }

        
            
        }

    }
}


struct PortfolioBuiltPageDisplay_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioBuiltPageDisplay()

    }
}
