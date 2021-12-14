//
//  HomeCollectionViewCell.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 03/05/1443 AH.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var homeImage: UIImageView!
    
    @IBOutlet weak var homeName: UILabel!
    
    func setupCell(photo: UIImage , name: String) {
        homeImage.image = photo
        homeName.text = name
    }
}
