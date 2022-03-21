//
//  HomeView.swift
//  MultipleProgressBar
//
//  Created by Rajendran Eshwaran on 3/20/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            CircularProgessView()
                .tabItem{
                    //Image("Circular")
                    Image(systemName: "tray.circle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("Circular")
                }
            HalvedCircularView()
                .tabItem{
                    //Image("halved")
                    Image(systemName: "tray.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("Halved")
                }
            RainbowGaugeView()
                .tabItem{
                    //Image("rainbow")
                    Image(systemName: "tray.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("Rainbow")
                }
            RainbowSpeedMeterView()
                .tabItem{
                    //Image("speedmeter")
                    Image(systemName: "tray.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("SpeedMeter")
                }
            LinearGaugeMeterView()
                .tabItem{
                    //Image("linear")
                    Image(systemName: "rectangle.portrait.trailingthird.inset.filled")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("Linear")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
