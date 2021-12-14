//
//  DescribeVC.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 04/05/1443 AH.
//

import UIKit

class DescribeVC: UIViewController {
    
    @IBOutlet weak var imageDescribe: UIImageView!
    
    @IBOutlet weak var nameDescribe: UILabel!
    
    @IBOutlet weak var describe: UILabel!
    
    
    @IBOutlet weak var numberSelector: NumberSelector!
    
    // var selectedPlant : PlantDescribe?
    //  var selectedTypes : TypesOfFertilizers?
    
    let plantdescribe = [PlantDescribe(imageDescribe: UIImage(named: "images-10")!, nameDescribe: "Ground Preparation", describe: "Plowing is carried out according to the heights and depressions of the pivot, so that the plowing is against the direction of cultivation. (The direction of cultivation is determined to be the opposite of the major tendencies in the pivot. As for the minor tendencies, they are overcome by damming the planting lines , and that the land is suitable for growing potatoes , and is sandy , there is no stone , good ventilation and drainage of water )."),
                         
                         PlantDescribe(imageDescribe: UIImage(named: "images-12")!, nameDescribe: "Seeds", describe: "He took from the seeds outside from the laboratory the mother’s seeds for potatoes and new seeds for planting class A are the size of a fist, cultivation begins by covering the seeds with soil , and when the seeds begin to grow, the soil must be increased to a height of 15 cm, because the seeds when they grow will be exposed to sunlight, which makes them invalid Therefore, it must be covered with soil ."),
                         
                         PlantDescribe(imageDescribe: UIImage(named: "download-10")!, nameDescribe: "Irrigation", describe: "Potato crops need to be constantly irrigated, and in general, a potato crop that needs 120-150 days to grow needs a quantity of water ranging from 500-700 milliliters, and crop production may decrease due to the depletion of 50% of the total available soil water during the growth period, and because of the water deficit. At present, types of seeds with long roots are being developed to resist drought, as these long roots are able to reach water sources in the ground, which reduces their need for irrigated water, so that the crop can benefit from the water stored in the roots, and this process helps to increase The dry matter content of potatoes, which contributes to accelerating their ripening."),
                         
                         PlantDescribe(imageDescribe: UIImage(named: "download-11")!, nameDescribe: "Harvest", describe: "Harvest the crop seven days before harvest in case the temperature drops and the crop is exposed to repeated waves of frost, Use specialized tools to help get the potatoes out without damaging them , Storing potatoes in a dark and cool and humid area. The ideal conditions for storing potatoes are a temperature of 3.3 degrees Celsius, and a humidity of up to 95%, but due to the difficulty of providing these conditions, potatoes can be stored in a basement.")
                         
    ]
    
    let typesOfFertilizers = [TypesOfFertilizers(imageFertilizers: UIImage(named: "download-12")!, nameFertilizers: "Inorganic Fertilizers", describeFertilizers: "Inorganic fertilizers are chemical fertilizers that contain nutrient elements for the growth of crops made by chemical means. The inorganic fertilizers are of the following types: Nitrogen Fertilizers , Phosphorus Fertilizer "),
                              
                              
                              TypesOfFertilizers(imageFertilizers: UIImage(named: "download-13")!, nameFertilizers: "Nitrogen Fertilizers", describeFertilizers: "Nitrogen fertilizers contain nitrogen necessary for the development of crops. Nitrogen is the main constituent of chlorophyll that maintains a balance in the process of photosynthesis. It is also a part of amino acids in plants and constitutes protein. Nitrogen fertilizers improve the production and quality of agricultural products."),
                              
                              TypesOfFertilizers(imageFertilizers: UIImage(named: "images-13")!, nameFertilizers: "Phosphorus Fertilizer", describeFertilizers: "The main nutrient in a phosphorus fertilizer is phosphorus. The efficiency of fertilizer depends upon effective phosphorus content, methods of fertilizing, properties of soil and crop strains. Phosphorus found in the protoplasm of the cell plays an important role in cell growth and proliferation. The phosphorus fertilizer is beneficial for the growth of roots of the plants."),
                              
                              
                              
                              
                              TypesOfFertilizers(imageFertilizers: UIImage(named: "download-14")!, nameFertilizers: "Organic Fertilizers", describeFertilizers: "Organic fertilizers are natural fertilizers obtained from plants and animals. It enriches the soil with carbonic compounds essential for plant growth. Organic fertilizers increase the organic matter content of the soil, promotes the reproduction of microorganisms, and changes the physical and chemical properties of the soil. It is considered to be one of the main nutrients for green food."),
                              
                              
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
