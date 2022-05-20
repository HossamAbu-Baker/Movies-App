import Foundation
import Alamofire
enum Usernetworking {
    
  
    case populerMovie
    case TopMovies
    case Series
 
}

extension Usernetworking : TargetTybe {
    var baseUrl: String {
        switch self {
        case .Series :
            return constant.urlSeries
        case .populerMovie:
            return  constant.urlPopMovies
        case .TopMovies:
            return constant.urlTopMovies
        }
    }
    
    var path: String {
        switch self {
        case .Series :
           return ""
        case .populerMovie:
          return  ""
        case .TopMovies:
           return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .Series :
            return .get
        case .populerMovie:
            return  .get
        case .TopMovies:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .Series :
            return .ReguestPlain
        case .populerMovie:
            return  .ReguestPlain
        case .TopMovies:
            return .ReguestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .Series :
            return [:]
        case .populerMovie:
            return  [:]
        case .TopMovies:
            return [:]
        }
    }
    
    
    
    
    
    
}


