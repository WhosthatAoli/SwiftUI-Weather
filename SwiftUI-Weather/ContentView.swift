//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Shaohua Zhang on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray: Color("lightBlue"))
            
            VStack{

                CityTextView()
                MainWeatherStatusView(isNight: $isNight)
                
                
                MoreDaysView()
                Spacer()
                
                Button{
//                    print("tapped") //action
                    isNight.toggle()
                }label: {
                    Text("Change Day Time")  //what button looks like
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
//                    WeatherButton()
                    
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var teperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height:40)
            Text("\(teperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        ContainerRelativeShape()
            .fill(.blue.gradient)
            .ignoresSafeArea()
        
    }
}

struct CityTextView: View {
    var body: some View{
        Text("Austin, TX")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    @Binding var isNight: Bool //can change this variable by binding, can use read only here too
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: isNight ? "moon.stars.fill":"cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height:180)
            
            Text("70°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }.padding(.bottom,80)
    }
}

struct MoreDaysView: View {
    var body: some View {
        HStack(spacing: 20){
            WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", teperature: 76)
            WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", teperature: 74)
            WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", teperature: 72)
            WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", teperature: 73)
            WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", teperature: 75)
        }
    }
}

struct WeatherButton: View{
    var body: some View{
        Text("Change Day Time")  //what button looks like
            .frame(width: 280, height: 50)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
