//
//  PopulerTableViewCell.swift
//  Movies
//
//  Created by ALTO-SOLUTIONS on 16/05/2022.
//

import UIKit

class PopulerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func passPopMovieData(title:String,year:String,rank:String,rating:String,photos:String){
        nameLabel.text = title
        yearLabel.text = "year :\(year)"
        rankLabel.text = "rank :\(rank)"
        imdbLabel.text = "rate :\(rating)"
        
        let urlImage = URL(string: photos)!
        let url = try! Data(contentsOf: urlImage)
        photo.image = UIImage(data: url)
    }
}
