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
    
   // var selectedPlant: Plant?
    
    var selectedPlant : PlantDescribe?
    var selectedTypes : TypesOfFertilizers?
    var choosingType = "plants"
    
    var homePlant = [Plant]()

    var selectedIndex: Int? 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeForCV.delegate = self
        HomeForCV.dataSource = self
                  
    homePlant.append(Plant(photo: UIImage(named: "download-9")!, name: "Potato Cultivation"))
        
      homePlant.append(Plant(photo: UIImage(named: "download")!, name: "Types of Fertilizers"))
        
        homePlant.append(Plant(photo: UIImage(named: "images-8")!, name: "Vegetable Grower"))
        
       homePlant.append(Plant(photo: UIImage(named: "download-1")!, name: "Fruits Grower"))

      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePlant.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "describHome" {
            let distnation = segue.destination as! DescribeVC
            distnation.choosingType = choosingType
        } else {
            let vc = segue.destination as? PdfVC
            vc?.selectedIndex = selectedIndex
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        switch indexPath.row {
        case 0:
            
            choosingType = "plants"
            
            //self.selectedPlant = PlantDescribe[indexPath.row]
           // print(selectedPlant?.nameDescribe as Any)
            performSegue(withIdentifier: "describHome", sender: nil)
        case 1:
           
            choosingType = "fertilizer"
            
           // self.selectedTypes = TypesOfFertilizers[indexPath.row]
            //print(selectedTypes?.nameFertilizers as Any)
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
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeForCV.dequeueReusableCell(withReuseIdentifier: "homeCV", for: indexPath) as! HomeCollectionViewCell
        
        let plant = homePlant[indexPath.row]
        cell.setupCell(photo: plant.photo , name: plant.name)
        
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: self.view.frame.width * 0.45 , height: self.view.frame.width * 0.45 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }


}


struct Plant {
  
    let photo : UIImage
    let name : String

}

