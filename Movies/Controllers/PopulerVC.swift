//
//  PopulerVC.swift
//  Movies
//
//  Created by ALTO-SOLUTIONS on 12/05/2022.
//

import UIKit

class PopulerVC: UIViewController {
    
    @IBOutlet weak var searchPopuler: UISearchBar!
    @IBOutlet weak var activeLoad: UIActivityIndicatorView!
    @IBOutlet weak var populerTableView: UITableView!
    
    var populerMovie = [popMovie]()
    var filter : [popMovie]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populerTableView.delegate = self
        populerTableView.dataSource = self
        populerTableView.separatorStyle = .none
        searchPopuler.delegate = self
        getPopulerData()
        populerCell()
        filter = populerMovie
        activeLoad.hidesWhenStopped = true
        activeLoad.startAnimating()
    }
    
//MARK: set Populer Cell
    func populerCell(){
        populerTableView.register(UINib(nibName: "PopulerTableViewCell", bundle: nil), forCellReuseIdentifier: "PopulerTableViewCell")
    }
    
    // MARK: get data from api for popmovie
    func getPopulerData(){
        
        UserApi().popMvie { [self] result in
            switch result{
                
            case .success(let data):
                let opject = data
                populerMovie = (opject?.items)!
                filter = populerMovie
                activeLoad.stopAnimating()
                populerTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
//MARK: set data in popcell
extension PopulerVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Populur Movie"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return populerMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = populerTableView.dequeueReusableCell(withIdentifier: "PopulerTableViewCell", for: indexPath)
        as! PopulerTableViewCell
        
        cell.selectionStyle = .none
        let opject = populerMovie[indexPath.row]
        cell.passPopMovieData(title: opject.title ?? "", year: opject.year ?? "", rank: opject.rank ?? "", rating: opject.imDBRating ?? "", photos: opject.image ?? "")
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
extension PopulerVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            filter = populerMovie
        }
        else{
            filter = populerMovie.filter({
                $0.title!.lowercased().contains(searchText.lowercased())
            })
        }
        populerTableView.reloadData()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
