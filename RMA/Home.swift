//
//  Home.swift
//  RMA
//

import SwiftUI
import Firebase


struct Home: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var ifAdd = false
    @State private var addTerm = ""
    @State private var addDefinition = ""
    @State private var addColor = ""

    var body: some View {
        if userViewModel.userEmail != ""{
            content
        } else {
            ContentView()
        }
    }
    
    var content: some View {
        
            GeometryReader { geometry in
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .trailing, spacing: 16) {
                        
                        ForEach(dataManager.cards, id: \.id) { card in
                            if(card.maker == "\(userViewModel.userEmail)"){
                                cardItem(term: card.term, definition: card.definition, color: card.color)
                            }
                            
                        }
                        
                        Rectangle()
                            .frame(height: 24)
                            .foregroundColor(.clear)
                    }
                    .padding(16)
                    .padding(.bottom, 240)
                    .frame(width: 393, alignment: .bottom)
                    .offset(y: 107)
                }
                
                //Topbar
                
                Rectangle()
                        .fill(.thinMaterial)
                        .mask {
                            VStack(spacing: 0) {
                                LinearGradient(
                                    stops: [
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.99), location: 0.08),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.98), location: 0.15),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.96), location: 0.22),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.92), location: 0.28),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.88), location: 0.35),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.83), location: 0.41),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.76), location: 0.47),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.7), location: 0.54),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.62), location: 0.60),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.53), location: 0.66),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.44), location: 0.72),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.34), location: 0.79),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.23), location: 0.86),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.12), location: 0.93),
                                    Gradient.Stop(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 0.44),
                                    endPoint: UnitPoint(x: 0.5, y: 1))
                            }
                        }
                        .frame(height: 123)
                
                HStack {
                    
                    Image("logoWhite")
                        .frame(width: 91.02442, height: 20)
                        .foregroundColor(Color(red: 0.99, green: 0.98, blue: 0.98))
                    
                    Spacer()
                    
                    Button{
                        do {
                            try Auth.auth().signOut()
                                userViewModel.userEmail = ""
                                        } catch let error as NSError {
                                            print("Error signing out: \(error.localizedDescription)")
                                        }
                    } label: {
                        Image("logout")
                            .frame(width: 20, height: 20)
                    }
                    
                }
                .frame(width: 361)
                .padding(.horizontal, 16)
                .padding(.top, 63)
                .frame(minHeight: 107, maxHeight: 107)
                .padding(.bottom, 12)
            
            ZStack(alignment: .bottom) {
                
                Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask {
                            VStack(spacing: 0) {
                                LinearGradient(
                                    colors: [
                                        Color("backgroundColor").opacity(1),
                                        Color("backgroundColor").opacity(0),
                                    ],
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                                Rectangle()
                            }
                        }
                        .frame(height: 160)
                        .offset(y: 34)
                
                Button{
                    ifAdd = true
                } label: {
                    WhiteButton("Add new card")
                }
                
            }
            
            .padding(.vertical, 32)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
                if ifAdd {
                    
                        VStack(){
                            VStack(spacing: 8){
                                    
                                    VStack(alignment: .center, spacing: 16) {
                                        TextField("Enter term", text: $addTerm)
                                            .font(.system(size: 28.0, weight: .medium, design: .rounded))
                                            .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                                            .frame(maxWidth: 321, alignment: .topLeading)
                                        TextField("Enter definition", text: $addDefinition, axis: .vertical)
                                            .font(.system(size: 16.0))
                                            .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                                            .frame(maxWidth: 321, maxHeight: .infinity, alignment: .topLeading)
                                    }
                                    .padding(20)
                                    .frame(maxWidth: 353, minHeight: 224, maxHeight: 224, alignment: .center)
                                    .background(Color(addColor))
                                    .cornerRadius(16)
                                    .shadow(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.25), radius: 8, x: 0, y: -4)
                                }
                                .padding(.horizontal, 16)
                            
                            Picker("Tags", selection: $addColor) {
                                Text("Orange")
                                    .font(.system(size: 16.0, weight: .medium, design: .rounded))
                                    .foregroundColor(Color.orange)
                                    .tag("orange")
                                Text("Yellow")
                                    .font(.system(size: 16.0, weight: .medium, design: .rounded))
                                    .foregroundColor(Color.yellow)
                                    .tag("yellow")
                                Text("Green")
                                    .font(.system(size: 16.0, weight: .medium, design: .rounded))
                                    .foregroundColor(Color.green)
                                    .tag("green")
                                Text("Blue")
                                    .font(.system(size: 16.0, weight: .medium, design: .rounded))
                                    .foregroundColor(Color.blue)
                                    .tag("blue")
                              }
                              .pickerStyle(.segmented)
                              .padding(.horizontal, 16)
                            
                                Button{
                                    dataManager.addCard(makerX: "\(userViewModel.userEmail)", termX: addTerm, definitionX: addDefinition, colorX: "")
                                    dataManager.fetchCards()
                                    ifAdd = false
                                    addTerm = ""
                                    addDefinition = ""
                                    addColor = ""
                                } label: {
                                    WhiteButton("Add new card")
                                        .padding(.bottom, 80)
                                }
                            }
                        .onAppear {
                            addColor = "orange"
                        }
                    .frame(maxWidth: 393, minHeight: geometry.size.height, alignment: .center)
                    .background(.thinMaterial)
                    .edgesIgnoringSafeArea(.all)
                    
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .background(Color("backgroundColor"))
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(DataManager())
    }
}

struct WhiteButton: View {
    let buttonText: String
    
    init(_ buttonText: String) {
            self.buttonText = buttonText
        }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                Image("plus")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.clear)
                Text(buttonText)
                    .font(.system(size: 16.0, weight: .semibold))
                    .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(red: 0.99, green: 0.98, blue: 0.98))
            .cornerRadius(6)
        }
        .padding(16)
        .frame(width: 393, alignment: .topLeading)
        .preferredColorScheme(.dark)
    }
}
