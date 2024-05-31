import Foundation

struct DataLoadFailure: Error {}

class DataService {
    static let shared = DataService()
    
    func loadMockData<T: Decodable>(filename: String, type: T.Type) -> throws T {
        guard let url = Bundle.module.url(forResource: filename, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw DataLoadFailure()
        }
        return decodedData
    }
}
