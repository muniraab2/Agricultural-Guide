//
//  DescribeVC.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 04/05/1443 AH.
//

import UIKit

// used UIViewController for plan describe and types Of Fertilizers

class DescribeVC: UIViewController {
    
    @IBOutlet weak var imageDescribe: UIImageView!
    
    @IBOutlet weak var nameDescribe: UILabel!
    
    @IBOutlet weak var describe: UILabel!
    
    
    @IBOutlet weak var numberSelector: NumberSelector!
    
    var choosingType = "plants"
    
    
    // array for plant describe and types Of Fertilizers and localized for language
    
    let plantdescribe = [PlantDescribe(imageDescribe: UIImage(named: "images-10")!, nameDescribe: "Ground_Preparation".localized, describe: "Plowing_desc".localized),
                         
                         PlantDescribe(imageDescribe: UIImage(named: "images-12")!, nameDescribe: "Seeds_plant".localized, describe: "Seeds_desc".localized),
                         
                         PlantDescribe(imageDescribe: UIImage(named: "download-10")!, nameDescribe: "Irrigation_plant".localized, describe: "Irrigation_desc".localized),
                         
                         PlantDescribe(imageDescribe: UIImage(named: "download-11")!, nameDescribe: "Harvest_plant".localized, describe: "Harvest_desc".localized)
                         
    ]
    
    let typesOfFertilizers = [TypesOfFertilizers(imageFertilizers: UIImage(named: "download-12")!, nameFertilizers: "Inorganic_Fertilizers".localized, describeFertilizers: "Inorganic_fertilizers_desc".localized),
                              
                              
                              TypesOfFertilizers(imageFertilizers: UIImage(named: "download-13")!, nameFertilizers: "Nitrogen_Fertilizers".localized, describeFertilizers: "Nitrogen_fertilizers_desc".localized),
                              
                              TypesOfFertilizers(imageFertilizers: UIImage(named: "images-13")!, nameFertilizers: "Phosphorus_Fertilizer".localized, describeFertilizers: "Phosphorus_fertilizer_desc".localized),
                              
                              
                              
                              
                              TypesOfFertilizers(imageFertilizers: UIImage(named: "download-14")!, nameFertilizers: "Organic_Fertilizers".localized, describeFertilizers: "Organic_fertilizers_desc".localized),
                              
                              
    ]
    
    //viewdidload for UIControl 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignValues(index: numberSelector.selectedNumberIndex)
        
    }
    
    //IBAction for view
    
    @IBAction func selectionChanged(_ sender: Any) {
        
        
        assignValues(index: numberSelector.selectedNumberIndex)
        
        
        
    }
    
    // switch func for array view
    
    func assignValues(index: Int){
        
        switch choosingType {
            
        case "plants" :
            imageDescribe.image = plantdescribe[index].imageDescribe
            nameDescribe.text = plantdescribe[index].nameDescribe
            describe.text = plantdescribe[index].describe
            
        case "fertilizer":
            imageDescribe.image = typesOfFertilizers[index].imageFertilizers
            nameDescribe.text = typesOfFertilizers[index].nameFertilizers
            describe.text = typesOfFertilizers[index].describeFertilizers
            
        default :
            imageDescribe.image = plantdescribe[index].imageDescribe
            nameDescribe.text = plantdescribe[index].nameDescribe
            describe.text = plantdescribe[index].describe
        }
        
        // plas Animashion for view
        
        imageDescribe.transform = imageDescribe.transform.scaledBy(x: 2, y: 2)
        imageDescribe.alpha = 0
        let label = nameDescribe.transform
        nameDescribe.transform.translatedBy(x: -view.frame.width, y: 0)
        
        let anim = UIViewPropertyAnimator(duration: 0.4, curve: .easeInOut) {
            
            self.imageDescribe.alpha = 1
            self.nameDescribe.transform = label
            self.imageDescribe.transform = .identity
            
        }
        anim.startAnimation()
        
        
    }
    
}

// estension localized for language

extension String {
    
    var localized : String {
        return NSLocalizedString(self, comment: "")
        
    }
    
}
