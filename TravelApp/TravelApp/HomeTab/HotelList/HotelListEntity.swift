//
//  HotelListEntity.swift
//  TravelApp
//
//  Created by Hakan İşseven on 10.10.2022.
//

import Foundation



struct HotelCellViewModel {

    var name: String?
    var city: String?
    var photo: String?
    var star: String?

}
struct Hotel: Codable {
    let hotelName, hotelCity: String
    let hotelPhoto: String
    let hotelStar: HotelStar
}

enum HotelStar: String, Codable {
    case the5Star = "5 Star"
}

typealias Hotels = [Hotel]
