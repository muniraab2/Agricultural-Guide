//
//  HomeViewController.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 03/05/1443 AH.
//

import UIKit
import PDFKit


class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var HomeForCV: UICollectionView!
    
    //varibel for arry of home desscribe
    
    var selectedPlant : PlantDescribe?
    var selectedTypes : TypesOfFertilizers?
    var choosingType = "plants"
    
    var homePlant = [Plant]()
    
    var selectedIndex: Int?
    
    //override func to view plant struct and localized for language
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeForCV.delegate = self
        HomeForCV.dataSource = self
        
        homePlant.append(Plant(photo: UIImage(named: "download-9")!, name: "Potato_Cultivation".localized))
        
        homePlant.append(Plant(photo: UIImage(named: "download")!, name: "Types_of_Fertilizers".localized))
        
        homePlant.append(Plant(photo: UIImage(named: "images-8")!, name: "Vegetable_Grower".localized))
        
        homePlant.append(Plant(photo: UIImage(named: "download-1")!, name: "Fruits_Grower".localized))
        
        
    }
    
    //number of items for view home plant array in section
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePlant.count
    }
    //prepare switch if user selesct photo and segue view
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "describHome" {
            let distnation = segue.destination as! DescribeVC
            distnation.choosingType = choosingType
        } else {
            let vc = segue.destination as? PdfVC
            vc?.selectedIndex = selectedIndex
        }
        
    }
    
    //switch for did select photo items
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        
        case 0:
            choosingType = "plants"
            performSegue(withIdentifier: "describHome", sender: nil)
        case 1:
            choosingType = "fertilizer"
            performSegue(withIdentifier: "describHome", sender: nil)
        case 2:
            selectedIndex = 3
            performSegue(withIdentifier: "toPdf", sender: nil)
        case 3:
            selectedIndex = 4
            performSegue(withIdentifier: "toPdf", sender: nil)
        default:
            break
        }
    }
    
    // cell for identifier item at photo for index phath
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeForCV.dequeueReusableCell(withReuseIdentifier: "homeCV", for: indexPath) as! HomeCollectionViewCell
        
        let plant = homePlant[indexPath.row]
        cell.setupCell(photo: plant.photo , name: plant.name)
        
        return cell
    }
    
    // layout size for item
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.45 , height: self.view.frame.width * 0.45 )
    }
    
    // layout minimum line
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // layout minimum inter
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // layout inset selecttion in top , left , bottom , right
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    
}

// struct plant for home plant

struct Plant {
    
    let photo : UIImage
    let name : String
    
}


