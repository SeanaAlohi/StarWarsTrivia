//
//  AnimationView.swift
//  Project3
//
//  Created by Seana Marie Lanias on 12/11/22.
//

import SwiftUI

struct AnimationView: View {
    
    @State var isPressed = false
    
    
    var body: some View {
        ZStack {
            Image(isPressed ? "lightSaber" : "lightSaberClose" )
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 100)
                .cornerRadius(16)
                .onTapGesture {
                    withAnimation (.easeInOut(duration: 1.0)) {
                        isPressed.toggle()
                    }
                }
//                .shadow(radius: 8, x: 5, y: 5)
//                .overlay {
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(.gray.opacity(0.5), lineWidth: 1)
//                }
                
//            Image("lightSaber")
//                .resizable()
//                .scaledToFit()
//                .frame(maxHeight: 100)
//                .cornerRadius(16)
//                .opacity(isPressed ? 1.0 : 0)
//                .shadow(radius: 8, x: 5, y: 5)
//                .overlay {
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(.gray.opacity(0.5), lineWidth: 1)
//                }


        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
