// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let articles = try? newJSONDecoder().decode(Articles.self, from: jsonData)

import Foundation




struct HomeCellViewModel {

    var articleName: String?
    var tag: String?
    var photoUrl: String?
    var desc: String?

}


struct Article: Codable {
    let articleName: String
    let articleTag: String
    let id: Int
    let articlePhoto: String
    let articleDesc: String
}

typealias Articles = [Article]
