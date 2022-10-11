
import Foundation


protocol FlightListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [FlightCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}


class FlightListViewModel {
    
    private let model = FlightListModel()
    
    weak var viewDelegate: FlightListViewModelViewProtocol?
    
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
}


private extension FlightListViewModel  {
    
    @discardableResult
    func makeViewBasedModel(_ flights: [Flight])-> [FlightCellViewModel] {
       
        return flights.map { .init(flightNumber: $0.flight.number, callSign: $0.airline.callsign.rawValue, arrivalAirport: $0.arrival.airport.rawValue, departureAirpot: $0.departure.airport.rawValue)
            //Uygulamada kullanmamızı sağlayacak formata dönüştürüyoruz.
        }
    }
}


extension FlightListViewModel: FlightListModelProtocol {
    func didDataFetchProcessFinished(_ isSuccess: Bool) {
        
        if isSuccess {
            
            let flights = model.flights
            let cellModels = makeViewBasedModel(flights)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
        }
    }
    
}
