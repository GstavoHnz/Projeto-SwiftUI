//
//  WeatherButton.swift
//  project-clima
//
//  Created by Gustavo Henz on 05/04/22.
//

import SwiftUI

struct buttonWeather: View{
    
    var changeDay: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(changeDay )
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
