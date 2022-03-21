//
//  AnimatedCircularView.swift
//  MultipleProgressBar
//
//  Created by Rajendran Eshwaran on 3/21/22.
//

import SwiftUI

struct AnimatedCircularView: View {
    @State private var isLoading : Bool = false
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.top)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .butt, dash: [4,25]))
                .foregroundColor(.green)
                .frame(width: 200, height: 200)
                .onAppear(){
                    withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)){
                        isLoading.toggle()
                    }
                }.rotationEffect(Angle(degrees: isLoading ? 0 : 360))
            Text("Loading...")
                .foregroundColor(.green)
        }
    }
}

struct AnimatedCircularView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedCircularView()
    }
}
