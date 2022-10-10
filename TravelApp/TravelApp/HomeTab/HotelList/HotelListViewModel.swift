
import Foundation


protocol HotelListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [HotelCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}


class HotelListViewModel {
    
    private let model = HotelListModel()
    
    weak var viewDelegate: HotelListViewModelViewProtocol?
    
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
}


private extension HotelListViewModel  {
    
    @discardableResult
    func makeViewBasedModel(_ hotels: [Hotel])-> [HotelCellViewModel] {
       
        return hotels.map { .init(name: $0.hotelName, city: $0.hotelCity, photo: $0.hotelPhoto, star: $0.hotelStar.rawValue)
        }
    }
}


extension HotelListViewModel: HotelListModelProtocol {
    func didDataFetchProcessFinished(_ isSuccess: Bool) {
        
        if isSuccess {
            
            let hotels = model.hotels
            let cellModels = makeViewBasedModel(hotels)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
        }
    }
    
}
