//
//  FactorListView.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 7/14/21.
//

import SwiftUI

struct FactorListView: View {
    @ObservedObject var factorListVM = FactorListViewModel()
     
    let factors = testDataFactors
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Tell us what matters")
                    .font(.title)
                    .bold()
                    .padding(.trailing, 10)
                    .frame(width: 288, height: 61, alignment: .center)
                    .navigationBarHidden(true)
                Text("Choose up to three")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                List(factorListVM.factorCellViewModels){ factorCellVM in
                    FactorCell(factorCellVM: factorCellVM)
                }
                NavigationLink(destination: PortfolioTargetSelectionView()) {
                    Text("Continue")
                        .fontWeight(.bold)
                        .padding()
                        .padding(.horizontal, 70)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .border(Color.blue, width: 5)
                        .cornerRadius(10)
                        .padding(.bottom, 0)
                        .padding(.horizontal, 80)
                }
            }
            .environment(\.defaultMinListRowHeight, 10)
            .padding(.top,5)
            .padding(.bottom,5)
        }

    }
}


struct FactorListView_Previews: PreviewProvider {
    static var previews: some View {
        FactorListView()
    }
}

struct FactorCell: View {
    @ObservedObject var factorCellVM: FactorCellViewModel
    var body: some View {
        HStack{
            Image(systemName: factorCellVM.factor.selected ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width:20, height:20)
                .onTapGesture {
                    self.factorCellVM.factor.selected.toggle()
                }
            Text(factorCellVM.factor.name)
        }
    }
}
