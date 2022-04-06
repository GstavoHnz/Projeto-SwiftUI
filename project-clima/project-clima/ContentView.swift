//
//  ContentView.swift
//  project-clima
//
//  Created by Gustavo Henz on 04/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                cityNameView(cityName: "Tubarão, SC")
                
                mainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :           "cloud.sun.rain.fill",
                                      temperatura: 22)
                
                HStack (spacing: 20){
                    functionClima(diaDaSemana: "SEG",
                                  nomeImagem: "cloud.sun.rain.fill",
                                  temperatura: 22)
                    
                    functionClima(diaDaSemana: "TER",
                                  nomeImagem: "wind.snow",
                                  temperatura: 18)
                    
                    functionClima(diaDaSemana: "QUA",
                                  nomeImagem: "cloud.sun.fill",
                                  temperatura: 26)
                    
                    functionClima(diaDaSemana: "QUI",
                                  nomeImagem: "snow",
                                  temperatura: 14)
                    
                    functionClima(diaDaSemana: "SEX",
                                  nomeImagem: "sun.max.fill",
                                  temperatura: 30)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                }label: {
                    buttonWeather(changeDay: "Escolha seu dia",
                                  textColor: .blue,
                                  backgroundColor: .white  )
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct functionClima: View {
    
    var diaDaSemana: String
    var nomeImagem: String
    var temperatura: Int
    
    
    
    var body: some View{
        VStack{
            Text(diaDaSemana)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: nomeImagem)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperatura)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,            isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct cityNameView: View {
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct mainWeatherStatusView: View{
    
    var imageName: String
    var temperatura: Int
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperatura)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


