//
//  FlightModel.swift
//  TravelApp
//
//  Created by Hakan İşseven on 10.10.2022.
//

import Foundation


protocol FlightListModelProtocol: AnyObject {
    
    func didDataFetchProcessFinished(_ isSuccess: Bool)
    
}

class FlightListModel {

    weak var delegate: FlightListModelProtocol?
    
    var flights: Flights = []
    
    func fetchData() {
       
        guard let url = URL.init(string: "https://app.goflightlabs.com/routes?access_key=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiYzNjNzNiYmViNmMzMDkxOWMyMWUwOThkZjU5NjgzODM0MDM0ODJiNTI2MDU4NzhiN2NmMzExNWE5YmYxY2JjNWFhOGEyNTk2YzVhYmMxMzAiLCJpYXQiOjE2NjU0NDgzNTUsIm5iZiI6MTY2NTQ0ODM1NSwiZXhwIjoxNjk2OTg0MzU1LCJzdWIiOiIxNDgwNCIsInNjb3BlcyI6W119.jXDtY_szZNCv8L4R4icqUc-gr3F_CIk6LpI-hQcJNgG1O5ORggbteQtjbLnOoxNLBWR0rYsXI30A-ddDQbRrWQ&dep_iata=SAW&arr_iata=ADB") else {
            delegate?.didDataFetchProcessFinished(false)
            return
        }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else {return}
            
            guard
                error == nil
            else {
                self.delegate?.didDataFetchProcessFinished(false)
                return
            }
            
            guard let data = data else {
                self.delegate?.didDataFetchProcessFinished(false)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                self.flights = try  jsonDecoder.decode(Flights.self, from: data)
                self.delegate?.didDataFetchProcessFinished(true)
            }catch {
                print("JSON serialization Error")
                self.delegate?.didDataFetchProcessFinished(false)
            }
        }
        task.resume()
    }
}

