import Foundation
import UIKit

class InfoAPI {
    enum Endpoint: String {
        case infoRetrieve = "https://dhaka-static.zssbd.com/RecruitmentTest.json"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
    
    class func retrieveInfo(completionHandler: @escaping (Root?, Error?) -> Void ) {
        let endPoint = InfoAPI.Endpoint.infoRetrieve.url
        let task = URLSession.shared.dataTask(with: endPoint) { (data, response, error) in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            let value = try! decoder.decode(Root.self, from: data)
            completionHandler(value, nil)
        }
        task.resume()
    }
}
