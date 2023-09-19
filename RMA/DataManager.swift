//
//  DataManager.swift
//  RMA
//

import SwiftUI
import Firebase

class DataManager: ObservableObject{
    @EnvironmentObject var userViewModel: UserViewModel
    @Published var cards: [Card] = []
    
    init() {
        fetchCards()
    }
    
    func fetchCards() {
        cards.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Cards")
        ref.getDocuments { (querySnapshot, error) in
            for document in querySnapshot?.documents ?? [] {
                let data = document.data()

                let id = document.documentID
                let term = data["term"] as? String ?? ""
                let maker = data["maker"] as? String ?? ""
                let definition = data["definition"] as? String ?? ""
                let color = data["color"] as? String ?? ""
                
                let card = Card(id: id, maker: maker, term: term, definition: definition, color: color)
                print(card)
                self.cards.append(card)
            }
        }
    }
    
    func addCard(makerX: String, termX: String, definitionX: String, colorX: String){
        let db = Firestore.firestore()
        let ref = db.collection("Cards").document()
        ref.setData(["maker": makerX, "term": termX, "definition": definitionX, "color": colorX]) { error in if let error = error {
            print(error.localizedDescription)
            }
        }
    }
    
}

