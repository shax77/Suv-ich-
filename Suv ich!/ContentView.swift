//
//  ContentView.swift
//  Suv ich!
//
//  Created by shaxboz umirov on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var fillAmount: CGFloat = 0
    @State private var angle: Double = 0
    @State private var percentage: Int = 0
    var body: some View {
        VStack {
            
            Text("Suv Ichishni Eslatish")
                .font(.system(size: 35,weight: .bold))
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 15)
                    .frame(width: 150,height: 150)
                    .foregroundColor(.gray.opacity(0.3))
                
                Circle()
                    .trim(from: 0,to: fillAmount)
                    .stroke(style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                    .frame(width: 150,height: 150)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.purple,.pink]), startPoint: .top, endPoint: .bottom))
                
                    }
            
            
        }
//        Spacer()
//        
//        .padding()
    }
}

#Preview {
    ContentView()
}
