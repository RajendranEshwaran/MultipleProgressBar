//
//  CircularProgess.swift
//  MultipleProgressBar
//
//  Created by Rajendran Eshwaran on 3/20/22.
//

import SwiftUI

struct CircularProgessView: View {
    @State var progressValue: Float = 0.0
    var body: some View {
        ZStack{
            Color.yellow
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ProgressBarView(progress: self.$progressValue)
                
                Slider(value: Binding(get: {
                           self.progressValue
                       }, set: { (newVal) in
                           self.progressValue = newVal
                       }))
                    .accentColor(Color.green)
                
                Spacer()
                AnimatedCircularView()
            }
        }
        
    }
    func incrementProgress() {
        let randomValue = Float([0.012, 0.022, 0.034, 0.016, 0.11].randomElement()!)
        self.progressValue += randomValue
    }
}

struct CircularProgessView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgessView()
    }
}

struct ProgressBarView : View{
    @Binding var progress: Float
    var body: some View{
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.green)
                .frame(width: 200, height: 200)
            withAnimation(.linear){
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 270.0))
                .frame(width: 200, height: 200)
            }
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                            .font(.largeTitle)
                            .bold()
        }
    }
}


