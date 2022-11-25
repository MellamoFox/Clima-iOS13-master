//
//  WeatherManager.swift
//  Clima
//
//  Created by VT on 21.11.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=bee1a6121e22ddae32446167750f03c1&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    parseJSON(weatherData: safeData)
               
                }
            }
            task.resume()
        }
    }
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedDate = try decoder.decode(WheatherData.self, from: weatherData)
            let id = decodedDate.weather[0].id
            let temp = decodedDate.main.temp
            let name = decodedDate.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            
            print(weather.temperatureString)
         
        } catch {
            print("error")
        }
    }
    
} 

