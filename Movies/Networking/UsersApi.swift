
import Foundation

class UserApi : BaseApi<Usernetworking>{
    
 
    func topMovies(complition:@escaping (Result<TopMovies?,NSError>)->Void){
        self.fetchData(target: .TopMovies, response: TopMovies.self) { result in
            complition(result)
        }
    }
    func popMvie(complition:@escaping (Result<Populer?,NSError>)->Void){
        self.fetchData(target: .populerMovie, response: Populer.self) { result in
            complition(result)
        }
    }
    func seriesGet(complition:@escaping (Result<Sereis?,NSError>)->Void){
        self.fetchData(target: .Series, response: Sereis.self) { result in
            complition(result)
        }
    }
}
