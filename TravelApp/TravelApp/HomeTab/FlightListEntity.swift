//
//  FlightListEntity.swift
//  TravelApp
//
//  Created by Hakan İşseven on 10.10.2022.
//

import Foundation



struct FlightCellViewModel {
    
    var departure: String?
    var arrival: String?
    
}

struct Flight: Decodable {

    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    
    
    
    //    var origin: String
//    var destination: String
//    var price: Int
//    var airline: String
//    var flight_number: Int
//    var departure_at: String
//    var return_at: String
//    var transfers : Int
//    var expires_at: String
}
