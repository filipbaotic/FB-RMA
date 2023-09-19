//
//  Card.swift
//  RMA
//

import SwiftUI

struct Card: Identifiable {
    var id: String
    var maker: String
    var term: String
    var definition: String
    var color: String
}


struct cardItem: View {
    let term: String
    let definition: String
    let color: String
    
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    let durationAndDelay : CGFloat = 0.15
    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
     
    var body: some View {
        ZStack{
            HStack(alignment: .center, spacing: 8) {
                Text(term)
                    .font(.system(size: 28.0, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(20)
            .frame(maxWidth: .infinity, minHeight: 224, maxHeight: 224, alignment: .center)
            .background(Color(color))
            .cornerRadius(16)
            .shadow(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.25), radius: 8, x: 0, y: -4)
            .onTapGesture {
                flipCard()
            }
            .rotation3DEffect(Angle(degrees: backDegree), axis: (x: 1, y: 0, z: 0))
            VStack(alignment: .center, spacing: 8) {
                Text(term)
                    .font(.system(size: 28.0, weight: .medium, design: .rounded))
                    .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                Text(definition)
                    .font(.system(size: 16.0))
                    .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .padding(20)
            .frame(maxWidth: .infinity, minHeight: 224, maxHeight: 224, alignment: .center)
            .background(Color(color))
            .cornerRadius(16)
            .shadow(color: Color(red: 0.06, green: 0.06, blue: 0.06).opacity(0.25), radius: 8, x: 0, y: -4)
            .onTapGesture {
                flipCard()
            }
            .rotation3DEffect(Angle(degrees: frontDegree), axis: (x: 1, y: 0, z: 0))
        }
    }
}
