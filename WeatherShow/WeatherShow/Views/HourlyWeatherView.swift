//
//  HourlyWeatherView.swift
//  WeatherShow
//
//  Created by Vadim on 14.04.2022.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(cityVM.weather.hourly) { weather in
                    //sun.max.fill - SF Symbols is a library of iconography designed to integrate seamlessly with San Francisco
                    let icon = CityViewModel.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    
                    let hour = cityVM.getTimeFor(timeStamp: weather.dt)
                    let temp = cityVM.getTemperatureFor(temp: weather.temp)
                    
                    getHourlyView(hour: hour, image: icon, temp: temp)
                }
            }
        }
    }
    
    // func returns view for every hour
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {

        VStack(spacing: 20) {
            Text(hour)
            image
                .foregroundColor(.yellow)
            Text("\(temp) ℃")
        }
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
