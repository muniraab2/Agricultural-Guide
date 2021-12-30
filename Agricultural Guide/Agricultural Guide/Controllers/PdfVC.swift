//
//  PdfVC.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 11/05/1443 AH.
//

import UIKit
import PDFKit

// used UIViewController for pdf

class PdfVC: UIViewController {
    
    var selectedIndex : Int?
    var setSelectedIndex: Int?
    let pdfView = PDFView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //override func for view did appear if user selected first and secend photo view the array setselectedindex and if user selected third and fourd photo view setupdfviewer array
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setSelectedIndex = selectedIndex
        guard let setIndex = setSelectedIndex else { return }
        setupPdfViewer(index: setIndex)
    }
    
    //func for constraints and view pdf
    
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
}
