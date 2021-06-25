//
//  IconRow.swift
//  WeSplit
//
//  Created by Henry  Barklam on 6/8/21.
//

import SwiftUI

struct IconRow: View {
    var icon: Icon
    
    @State private var checkbox1 : Bool = false
    @State private var checkbox2 : Bool = false
    
    var body: some View {
        HStack{
            
            
            Toggle(isOn: $checkbox1){               VStack(alignment: .leading){
                Text(icon.name)
                    .font(.title)
                    .bold()

                Text(icon.subname)
                    .font(.subheadline)

            }
            }.toggleStyle(CheckboxToggleStyle(icon: icon))
        }

    }
}

struct CheckboxToggleStyle: ToggleStyle{
    var icon: Icon
    
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            Button{
                configuration.isOn.toggle()
            } label:{
                Image(systemName: configuration.isOn ? "\(icon.iconimagechecked)" : "\(icon.iconimageunchecked)")
//                    .shadow(color: .green, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 2.0, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.green)
//                    .padding(.top)
//                    .padding(.leading)
//                    .padding(.trailing)
//                    .padding(.bottom)
                    .frame(width: 70, height: 100, alignment: .leading)

            }
//            .padding(10)
            .font(.largeTitle)
            

            

            configuration.label
//                .padding(.leading, 20)
                

        }
    }
}

struct IconRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        IconRow(icon: icons[0])
        IconRow(icon: icons[1])
        IconRow(icon: icons[2])

        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
