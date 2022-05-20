

import Foundation
import Alamofire

enum HTTPMethod : String{
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
enum Task {
    
    case ReguestPlain
    case ReguestParameter (Parametars:[String:Any],Encoding:ParameterEncoding)
    
}

protocol TargetTybe{
    
    var baseUrl : String {get}
    var path : String {get}
    var method : HTTPMethod {get}
    var task : Task {get}
    var headers : [String:String]? {get}
    
}
