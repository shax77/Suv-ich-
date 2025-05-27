import SwiftUI

struct ContentView: View {
    @State private var fillAmount: CGFloat = 0
    @State private var percentage: Int = 0
    @State private var cupCount: Int = 0
    let maxCups = 10 // 10 ta stakan = 100%
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Suv Ichishni Eslatish")
                .font(.system(size: 30, weight: .bold))
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
                    .animation(.easeOut(duration: 1), value: fillAmount)
                
                Text("\(percentage)%")
                    .font(.largeTitle)
                    .monospacedDigit()
            }
            
            Image("stakan")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Bugun \(cupCount) ta stakan suv ichdingiz")
                .font(.system(size: 20, weight: .bold))
            
            Button(action: {
                if cupCount < maxCups {
                    cupCount += 1
                    percentage = cupCount * 10
                    withAnimation(.easeOut(duration: 1)) {
                        fillAmount = CGFloat(percentage) / 100
                    }
                }
            }) {
                Text(cupCount < maxCups ? "Stakan qo‘shish" : "Bajarildi ✅")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 32)
                    .frame(maxWidth: .infinity)
                    .background(cupCount < maxCups ? Color.blue : Color.green)
                    .cornerRadius(20)
            }
            .padding(.horizontal, 40)
            .disabled(cupCount >= maxCups)
            
            if cupCount >= maxCups {
                Text("Tabriklaymiz! Bugungi reja bajarildi 🥳")
                    .foregroundColor(.green)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.top, 10)
            }
            
            HStack(spacing: 6) {
                Text("Avgust 15–kuni")
                    .font(.system(size: 20))
                
                Image(systemName: "clock")
                    .foregroundColor(.gray)
                
                Text("Endi bir stakan suv iching!")
                    .font(.system(size: 20))
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
