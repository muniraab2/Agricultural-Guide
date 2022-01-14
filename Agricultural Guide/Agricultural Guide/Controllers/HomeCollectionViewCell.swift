//
//  HomeCollectionViewCell.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 03/05/1443 AH.
//

import UIKit

// used collectionview cell for image and label for home page

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var homeImage: UIImageView!
    
    @IBOutlet weak var homeName: UILabel!
    
    func setupCell(photo: UIImage , name: String) {
        homeImage.image = photo
        homeName.text = name
    }
}
