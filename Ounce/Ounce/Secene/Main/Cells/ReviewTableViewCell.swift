//
//  ReviewTableViewCell.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/06.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    var rootVC: UIViewController?
    @IBOutlet weak var productIMG: UIImageView!
    @IBOutlet weak var productCompanyLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productContentLabel: UILabel!
    @IBOutlet weak var starIMG: UIImageView!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var likeIMG: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    
    var review: UserReviews?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print(#function)
    }
    
    func cellService(){
        productIMG.imageFromUrl(review?.foodImg ?? "", defaultImgPath: "")
        productCompanyLabel.text = review?.foodManu
        productNameLabel.text = review?.foodName
        productContentLabel.text = review?.reviewInfo
        starLabel.text = review?.reviewRating
        likeLabel.text = review?.reviewPrefer
        
    }
    
}
