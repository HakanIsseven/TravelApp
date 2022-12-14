

import Foundation


protocol HomeModelProtocol: AnyObject {

    func didDataFetchProcessFinished(_ isSuccess: Bool)

}

class HomeModel {

    weak var delegate: HomeModelProtocol?

    var articles: Articles = []

    func fetchData() {

        guard let url = URL.init(string: "https://mocki.io/v1/384d95c3-00d2-430a-b653-76a2513e2141") else {
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
                let decoderResults = try  jsonDecoder.decode([Article].self, from: data)
                self.articles = decoderResults
                self.delegate?.didDataFetchProcessFinished(true)
            }catch {
                print(error)
                self.delegate?.didDataFetchProcessFinished(false)
            }
        }
        task.resume()
    }
}

