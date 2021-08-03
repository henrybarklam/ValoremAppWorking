//
//  ValueRepository.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 7/14/21.
//

import SwiftUI
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FactorRepository: ObservableObject {
    @EnvironmentObject var userInfo: UserInfo
    let db = Firestore.firestore()
    
    @Published var factors = [Factor]()
    
    init() {
        loadData()
    }
    
    func loadData(){
//        let userData = db.collection("users").document("\(userInfo.user.uid)").values")
        db.collection("factors")
            .order(by:"createdTime")
            .addSnapshotListener{ (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.factors = querySnapshot.documents.compactMap { document in
                    do {
                        let q = try document.data(as: Factor.self)
                        return q
                    }
                    catch{
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    func addData(_ factor: Factor){
        do {
            let _ = try db.collection("factors").addDocument(from: factor)
        }
        catch {
            fatalError("Unable to encode factor: \(error.localizedDescription)")
        }
    }
}
