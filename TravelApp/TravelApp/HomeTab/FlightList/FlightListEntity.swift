//import Foundation
//
//
//



    import Foundation


struct FlightCellViewModel {

    var flightNumber: String?
    var callSign: String?
    var arrivalAirport: String?
    var departureAirpot: String?

}


    struct Flight: Codable {
        let departure, arrival: Arrival
        let airline: Airline
        let flight: FlightClass
    }

    // MARK: - Airline
    struct Airline: Codable {
        let name: Name
        let callsign: Callsign
        let iata: AirlineIata
        let icao: AirlineIcao
    }


    enum Callsign: String, Codable {
        case boraJet = "BORA JET"
        case sunexpress = "SUNEXPRESS"
        case sunturk = "SUNTURK"
        case turkish = "TURKISH"
    }

    enum AirlineIata: String, Codable {
        case pc = "PC"
        case tk = "TK"
        case xq = "XQ"
        case yb = "YB"
    }

    enum AirlineIcao: String, Codable {
        case brj = "BRJ"
        case pgt = "PGT"
        case sxs = "SXS"
        case thy = "THY"
    }

    enum Name: String, Codable {
        case boraJetHavacilikTasimacilikUcakBakimOnarimVeTicaretAS = "BoraJet Havacilik Tasimacilik Ucak Bakim Onarim Ve Ticaret A.S."
        case pegasusAirlines = "Pegasus Airlines"
        case sunExpress = "SunExpress"
        case thyTurkishAirlines = "THY - Turkish Airlines"
    }

    // MARK: - Arrival
    struct Arrival: Codable {
        let airport: Airport
        let timezone: Timezone
        let iata: ArrivalIata
        let icao: ArrivalIcao
        let terminal: Terminal?
        let time: String?
    }

    enum Airport: String, Codable {
        case adnanMenderesAirport = "Adnan Menderes Airport"
        case sabihaGokcen = "Sabiha Gokcen"
    }

    enum ArrivalIata: String, Codable {
        case adb = "ADB"
        case saw = "SAW"
    }

    enum ArrivalIcao: String, Codable {
        case ltbj = "LTBJ"
        case ltfj = "LTFJ"
    }

    enum Terminal: String, Codable {
        case d = "D"
        case i = "I"
    }

    enum Timezone: String, Codable {
        case europeIstanbul = "Europe/Istanbul"
    }

    // MARK: - FlightClass
    struct FlightClass: Codable {
        let number: String
    }

    typealias Flights = [Flight]

