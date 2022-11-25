//
//  WeatherData.swift
//  Clima
//
//  Created by Vitalii Tsoi on 25.11.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WheatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}


struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
}
