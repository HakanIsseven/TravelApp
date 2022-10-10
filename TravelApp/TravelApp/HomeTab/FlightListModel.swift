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
    
    var flights: [Flight] = []
    
    func fetchData() {
       
        guard let url = URL.init(string: "http://api.travelpayouts.com/v1/prices/monthly?currency=USD&origin=LHR&destination=&token=5c64da459a7cdb2befaa288e6a88cbff") else {
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
                self.flights = try  jsonDecoder.decode([Flight].self, from: data)
                self.delegate?.didDataFetchProcessFinished(true)
            }catch {
                print("JSON serialization Error")
                self.delegate?.didDataFetchProcessFinished(false)
            }
        }
        task.resume()
    }
}

