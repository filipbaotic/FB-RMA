//
//  RMAApp.swift
//  RMA
//

import SwiftUI
import Firebase

@main
struct RMAApp: App {
    @StateObject var dataManager = DataManager()
    @StateObject var userViewModel = UserViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
                .environmentObject(userViewModel) 
        }
    }
}
