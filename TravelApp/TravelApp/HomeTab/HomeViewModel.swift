
import Foundation


protocol HomeViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [HomeCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}


class HomeViewModel {
    
    private let model = HomeModel()
    
    weak var viewDelegate: HomeViewModelViewProtocol?
    
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
}


private extension HomeViewModel  {
    
    @discardableResult
    func makeViewBasedModel(_ articles: Articles)-> [HomeCellViewModel] {
       
        return articles.map { .init(articleName: $0.articleName, tag: $0.articleTag, photoUrl: $0.articlePhoto, desc: $0.articleDesc)
        }
    }
}


extension HomeViewModel: HomeModelProtocol {
    func didDataFetchProcessFinished(_ isSuccess: Bool) {
        
        if isSuccess {
            
            let articles = model.articles
            let cellModels = makeViewBasedModel(articles)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
        }
    }
    
}
