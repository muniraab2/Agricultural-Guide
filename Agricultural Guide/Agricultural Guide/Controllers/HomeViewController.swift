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
    
    var homePlant = [Plant]()
    let pdfView = PDFView()
    
    func setupPdfViewer(index: Int) {
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        
        pdfView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
       
        pdfView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        pdfView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
       
        pdfView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        var path: URL? = nil
        if index == 3 {
            path = Bundle.main.url(forResource: "3", withExtension: "pdf")
        } else {
            path = Bundle.main.url(forResource: "4", withExtension: "pdf")
        }
        if let document = PDFDocument(url: path!) {
            pdfView.displayMode = .singlePageContinuous
            pdfView.autoScales = true
            pdfView.document = document
        }
    }
    
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
        
      
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        switch indexPath.row {
        case 0:
            
            //self.selectedPlant = PlantDescribe[indexPath.row]
           // print(selectedPlant?.nameDescribe as Any)
            performSegue(withIdentifier: "describHome", sender: nil)
        case 1:
           
            //self.selectedTypes = TypesOfFertilizers[indexPath.row]
            //print(selectedTypes?.nameFertilizers as Any)
            performSegue(withIdentifier: "describHome", sender: nil)
        case 2:
            setupPdfViewer(index: 3)
        case 3:
            setupPdfViewer(index: 4)
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

