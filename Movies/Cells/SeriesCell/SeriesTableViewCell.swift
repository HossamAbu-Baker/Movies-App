//
//  SeriesTableViewCell.swift
//  Movies
//
//  Created by ALTO-SOLUTIONS on 13/05/2022.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {

    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var photoSeries: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
// MARK: setdata in SereisCell
    func passSeriesData(title:String,year:String,rank:String,rating:String,photo:String){
        titlelabel.text = title
        yearLabel.text = "year :\(year)"
        rankLabel.text = "rank :\(rank)"
        imdbLabel.text = "rate :\(rating)"
        
        let urlImage = URL(string: photo)!
        let url = try! Data(contentsOf: urlImage)
        photoSeries.image = UIImage(data: url)
    }
    
    
}
