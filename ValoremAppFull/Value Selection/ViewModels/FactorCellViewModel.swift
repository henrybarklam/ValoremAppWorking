//
//  IconRowViewModel.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 7/14/21.
//

import Foundation
import Combine

class FactorCellViewModel: ObservableObject, Identifiable {
    @Published var factor: Factor
    
    var id: Int
    @Published var completionStateFactorName = ""
    
    init(factor: Factor){
        self.factor = factor
        self.id = 3
        self.completionStateFactorName = "Lol"
        
        $factor
            .map{ factor in
                factor.selected ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateFactorName, on: self)
        
        $factor
            .map{ factor in
                factor.id
            }
            .assign(to: \.id, on: self)
    }
}
