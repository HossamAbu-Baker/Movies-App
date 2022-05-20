//
//  TopMovieTableViewCell.swift
//  Movies
//
//  Created by ALTO-SOLUTIONS on 13/05/2022.
//

import UIKit

class TopMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLable: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var ratinglabel: UILabel!
    @IBOutlet weak var photoTopMovies: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    MARK: setdata in topMoviesCell
    func passTopMoviesData(title:String,year:String,rank:String,rating:String,photo:String){
        titleLabel.text = title
        yearLable.text = "year :\(year)"
        rankLabel.text = "rank :\(rank)"
        ratinglabel.text = "rate :\(rating)"
        
        let urlImage = URL(string: photo)!
        let url = try! Data(contentsOf: urlImage)
        photoTopMovies.image = UIImage(data: url)
    }
}
