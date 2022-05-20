//
//  SeriesVC.swift
//  Movies
//
//  Created by ALTO-SOLUTIONS on 12/05/2022.
//

import UIKit

class SeriesVC: UIViewController {
    
    @IBOutlet weak var activeLoad: UIActivityIndicatorView!
    @IBOutlet weak var seriesTbaleView: UITableView!
    @IBOutlet weak var searchSeries: UISearchBar!
    
    var finishedLoadingInitialTableCells = false
    var series = [TvSeries]()
    var filter : [TvSeries]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        seriesTbaleView.dataSource = self
        seriesTbaleView.delegate = self
        seriesTbaleView.separatorStyle = .none
        searchSeries.delegate = self
        getTopSeriesData()
        SetSeriesCell()
        filter = series
        activeLoad.hidesWhenStopped = true
        activeLoad.startAnimating()
    }
    //MARK:     SetSeriesCell
    func SetSeriesCell(){
        seriesTbaleView.register(UINib(nibName: "SeriesTableViewCell", bundle: nil), forCellReuseIdentifier: "SeriesTableViewCell")
    }
    
    // MARK: make call Api to get Series data
    func getTopSeriesData(){
        UserApi().seriesGet { [self] result in
            switch result{
                
            case .success(let data):
                let opject = data
                self.series = (opject?.items)!
                filter = series
                activeLoad.stopAnimating()
                seriesTbaleView.reloadData()
                self.seriesTbaleView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    
}
//MARK: set data in SeriesCell
extension SeriesVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Series"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filter!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = seriesTbaleView.dequeueReusableCell(withIdentifier: "SeriesTableViewCell", for: indexPath) as! SeriesTableViewCell
        
        cell.selectionStyle = .none
        let opject = filter![indexPath.row]
        cell.passSeriesData(title: opject.title!, year: opject.year!, rank: opject.rank!, rating: opject.imDBRating!,photo: opject.image!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
extension SeriesVC : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == ""{
            filter = series
        }
        else {
            filter = series.filter({
                $0.title!.lowercased().contains(searchText.lowercased())
            })
        }
        seriesTbaleView.reloadData()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
