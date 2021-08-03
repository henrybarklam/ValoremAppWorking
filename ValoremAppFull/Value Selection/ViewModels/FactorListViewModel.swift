//
//  IconListViewModel.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 7/14/21.
//

import Foundation
import Combine

class FactorListViewModel: ObservableObject {
    @Published var factorRepository = FactorRepository()
    @Published var factorCellViewModels = [FactorCellViewModel]()
    
    init() {
        factorRepository.$factors
            .map { factors in
                factors.map { factor in
                    FactorCellViewModel(factor: factor)
                }
        }
        .assign(to: \.factorCellViewModels, on: self)
    }
    
    func addFactor(factor: Factor) {
        factorRepository.addData(factor)
    }
    
//    func addFactor(factor: Factor) {
//        let factorVM = FactorCellViewModel(factor: factor)
//        self.factorCellViewModels.append(factorVM)
//
//    }
}
