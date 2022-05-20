
import Foundation
import Alamofire

class BaseApi <T: TargetTybe>{
    
    func fetchData<M:Codable>(target:T,response:M.Type,complition:@escaping(Result<M?,NSError>)->Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parametars = Params(task: target.task)
   
        
        
        AF.request(target.baseUrl + target.path , method: method,parameters: parametars.0,encoding: parametars.1,headers: headers).responseJSON { response in
            
            
           
            
            guard let statusCode = response.response?.statusCode else{
                let error = NSError(domain: target.baseUrl, code: 0, userInfo: nil)
                complition(.failure(error))
                return
            }
            if statusCode == 200 {
                
               

                guard let responseJson = try? response.result.get() else{
                    let error = NSError(domain: target.baseUrl, code: 0, userInfo: [NSLocalizedDescriptionKey:"failed error response"])
                    complition(.failure(error))
                    return
                }
                
                
                
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: responseJson, options: []) else {
                    let error = NSError(domain: target.baseUrl, code: 0, userInfo: [NSLocalizedDescriptionKey:"failed error error"])
                    complition(.failure(error))
                    return
                }
                guard let jsonDecode = try? JSONDecoder().decode(M.self, from: jsonData)else{
                    return
                }
                DispatchQueue.main.async {
                    complition(.success(jsonDecode))
                }
                
    
            }
            else{
                let error = NSError(domain: target.baseUrl, code: 0, userInfo: [NSLocalizedDescriptionKey:"failed error"])
                complition(.failure(error))
                return
            }
            
        }
        .resume()
    }

    func Params (task:Task)->([String:Any],ParameterEncoding){
        switch task {
        case .ReguestPlain:
            return ([:],URLEncoding.default)
        case .ReguestParameter(let Parametars, let Encoding):
            return (Parametars,Encoding)
        }
        
        
    }
}

