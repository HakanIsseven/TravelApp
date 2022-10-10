
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
       
        return flights.map { .init(departure: $0.flight.number, arrival: $0.airline.callsign.rawValue)
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
