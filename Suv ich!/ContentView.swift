import SwiftUI

struct ContentView: View {
    @State private var angle: Double = 0
    @State private var fillAmount: CGFloat = 0
    @State private var percentage: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            
            Text("Suv Ichishni Eslatish")
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.black.opacity(0.80))
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 15)
                    .frame(width: 150, height: 150)
                    .foregroundColor(.gray.opacity(0.3))
                
                Circle()
                    .trim(from: 0, to: fillAmount)
                    .stroke(style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                    .frame(width: 150, height: 150)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .top, endPoint: .bottom))
                    .rotationEffect(.degrees(-90))
                
                Text("\(percentage)%")
                    .font(.largeTitle)
                    .monospacedDigit()
            }
            
            Image("stakan")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Bugun qancha suv ichdingiz?")
                .font(.system(size: 20, weight: .bold))
            
            Button(action: {
                withAnimation(.easeOut(duration: 3)) {
                    fillAmount = 1
                    angle = 360
                }
                
                Timer.scheduledTimer(withTimeInterval: 0.026, repeats: true) { timer in
                    if percentage < 100 {
                        percentage += 1
                    } else {
                        timer.invalidate()
                    }
                }
            }) {
                Text("Stakan qo‘shish")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 32)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            .padding(.horizontal, 40)
            
            // Pastki soatli matn
            HStack {
                Text("Avgust 15–kuni")
                    .font(.system(size: 16))
                
                Image(systemName: "clock")
                    .foregroundColor(.gray)
                
                Text("Endi bir stakan suv iching!")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            .padding(.top, 30)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
