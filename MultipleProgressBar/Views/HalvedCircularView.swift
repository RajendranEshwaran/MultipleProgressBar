//
//  HalvedCircular.swift
//  MultipleProgressBar
//
//  Created by Rajendran Eshwaran on 3/20/22.
//

import SwiftUI

struct HalvedCircularView: View {
    @State var progress: CGFloat = 0.0
    @State var isStart = false
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.top)
            Circle()
                .trim(from: 0, to: 1.0)
                .stroke(Color.green, style: StrokeStyle(lineWidth: 12, dash: [8]))
                .frame(width: 200, height: 200, alignment: .center)
                .rotationEffect(Angle(degrees: -180))
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 12.0))
                .frame(width: 200, height: 200, alignment: .center)
                .rotationEffect(Angle(degrees: -180))
            Text("\(Int(self.progress*100))%")
                .font(.custom("HelveticaNeue", size: 20.0))
            Button(action: {self.startLoading(isStart: isStart)
                if !isStart{
                    isStart.toggle()
                }
                else{
                    isStart = false
                }
            }) {
                if !isStart{
                    Text("Start timer")
                }
                else{
                    Text("Stop timer")
                }
            }
        }
    }
    func startLoading(isStart:Bool)
    {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){timer in
            withAnimation() {
                self.progress += 0.01
                if self.progress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct HalvedCircularView_Previews: PreviewProvider {
    static var previews: some View {
        HalvedCircularView()
    }
}
