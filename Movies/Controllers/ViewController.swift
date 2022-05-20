//
//  ViewController.swift
//  Movies
//
//  Created by ALTO-SOLUTIONS on 12/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchMovie: UISearchBar!
    @IBOutlet weak var activeLoad: UIActivityIndicatorView!
    @IBOutlet weak var TopMovietableView: UITableView!
    
    var filter : [TopMovie]?
    var topMovie = [TopMovie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TopMovietableView.delegate = self
        TopMovietableView.dataSource = self
        TopMovietableView.separatorStyle = .none
        searchMovie.delegate = self
        filter = topMovie
        getTopMovieData()
        setCellTop()
        activeLoad.hidesWhenStopped = true
        activeLoad.startAnimating()
        
    }
    
    //MARK: make call Api to get TopMovies data
    func getTopMovieData(){
        UserApi().topMovies { [self] result in
            switch result{
                
            case .success(let data):
                
                let opject = data!
                self.topMovie = opject.items!
               filter = topMovie
                activeLoad.stopAnimating()
                TopMovietableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    //    SetTopMovieCell
    func setCellTop(){
        TopMovietableView.register(UINib(nibName: "TopMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "TopMovieTableViewCell")
    }
    
}
// MARK: set data in TopMoviesCell
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top movies"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filter?.count ?? topMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TopMovietableView.dequeueReusableCell(withIdentifier: "TopMovieTableViewCell", for: indexPath) as! TopMovieTableViewCell
        cell.selectionStyle = .none
        let opject = filter![indexPath.row]
        
        cell.passTopMoviesData(title: opject.title!, year: opject.year!, rank: opject.rank!, rating: opject.imDBRating!, photo: opject.image!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
extension ViewController : UISearchBarDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filter = topMovie
        }
        else {
            filter = topMovie.filter({
                $0.title!.lowercased().contains(searchText.lowercased())
            })
        }
        
        TopMovietableView.reloadData()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
