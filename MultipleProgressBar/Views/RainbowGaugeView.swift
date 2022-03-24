//
//  RainbowGauge.swift
//  MultipleProgressBar
//
//  Created by Rajendran Eshwaran on 3/20/22.
//

import SwiftUI

struct RainbowGaugeView: View {
    
    var body: some View {
        ControlsView()
    }
}


struct RainbowGaugeView_Previews: PreviewProvider {
    static var previews: some View {
        RainbowGaugeView()
    }
}

struct ControlsView : View{
    @State var progress: CGFloat = 0.0
    let colors = [Color("Color"),Color("Color1")]
    var body: some View{
        VStack{
            MeterView(progress: self.$progress)
            HStack{
                Button(action: {
                    withAnimation(Animation.default.speed(0.55)){
                        if self.progress != 100{
                            self.progress += 10}
                    }
                }, label: {
                    Text("Start")
                        .padding(.vertical,10)
                        .frame(width: (UIScreen.main.bounds.size.width - 50)/2)
                }).background(Capsule().stroke(LinearGradient(colors: self.colors, startPoint: .leading, endPoint: .trailing),lineWidth: 2.0))
                
                
                Button(action: {
                    withAnimation(Animation.default.speed(0.55)){
                        self.progress = 0
                    }
                }, label: {
                    Text("Reset")
                        .padding(.vertical,10)
                        .frame(width: (UIScreen.main.bounds.size.width - 50)/2)
                }).background(Capsule().stroke(LinearGradient(colors: self.colors, startPoint: .leading, endPoint: .trailing),lineWidth: 2.0))
            }
        }
    }
    
}
struct MeterView : View{
    let hueColors = stride(from: 0, to: 1, by: 0.01).map {
            Color(hue: $0, saturation: 1, brightness: 1)
        }
    @Binding var progress : CGFloat
    let colors = [Color("Color"),Color("Color1")]
    var body: some View{
        ZStack{
            ZStack{
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(LinearGradient(gradient: Gradient(colors: hueColors),
                                           startPoint: .leading,
                                           endPoint: .trailing),lineWidth: 55).opacity(0.5)
                    .frame(width: 280, height: 280)
                Circle()
                    .trim(from: 0.0, to: self.updateMeter())
                    .stroke(LinearGradient(gradient: Gradient(colors: hueColors),
                                           startPoint: .leading,
                                            endPoint: .trailing),lineWidth: 55)
                    .frame(width: 280, height: 280)
            }.rotationEffect(Angle.degrees(180))
            
            ZStack(alignment:.bottom){
                self.colors[1]
                    .frame(width: 2, height: 95)
                Circle()
                    .fill(self.colors[1])
                    .frame(width: 20, height: 20)
            }.offset(y: -35).rotationEffect(Angle.degrees(-90)).rotationEffect(.init(degrees: self.setArrow()))
        }
    }
    func updateMeter() -> CGFloat{
        let temp = self.progress / 2
        return temp * 0.01
    }
    
    func setArrow() -> Double{
        let temp = self.progress / 100
        return Double(temp * 180)
    }
}
