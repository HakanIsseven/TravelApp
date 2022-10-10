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
       
        guard let url = URL.init(string: "https://app.goflightlabs.com/routes?access_key=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiMzgxYzZjNTI0NTU4Zjg1MzE4MDY3Zjc4N2JkNTQ5NWY0N2EyMzJhMzhjY2I2NjczOWQ5NDI1YzhmYzQ2MmMyY2FkZTY0YjQ1OTM4NmUxOTMiLCJpYXQiOjE2NjUzOTMxMDQsIm5iZiI6MTY2NTM5MzEwNCwiZXhwIjoxNjk2OTI5MTA0LCJzdWIiOiIxNDc1NCIsInNjb3BlcyI6W119.QE6V3Uc1M0XliuYU0uiM7BbqiQQnxof2nHWT9DpEtNLJ_wOwLM6qD9yDsIybTTheUQD5RawzKm4djPgQUJq1sA&dep_iata=SAW&arr_iata=ADB") else {
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

