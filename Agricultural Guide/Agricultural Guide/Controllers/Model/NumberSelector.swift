//
//  NumberSelector.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 04/05/1443 AH.
//

import UIKit

enum  Number : String {
    
    case one
    case tow
    case three
    case fore
}

class NumberSelector: UIControl {
    
    
    private let numbers : [Number] = [.one,.tow,.three,.fore]
    
    var selectedNumberIndex = 0 {
        didSet{
            animatedBackView()
        }
    }
    
    private let numberStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private let backView : UIView = {
        
        let newView = UIView()
        newView.backgroundColor = UIColor(named: "one")
        
        return newView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backView.layer.cornerRadius = backView.bounds.width / 2
        
    }
    
    
    private func configureViews(){
        numberStackView.semanticContentAttribute = .forceLeftToRight
        self.addSubview(backView)
        self.addSubview(numberStackView)
        numberStackView.translatesAutoresizingMaskIntoConstraints = false
        numberStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        numberStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        numberStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        numberStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        configureButtons()
        
    }
    
    private func configureButtons(){
        
        for number in numbers {
            
            let numberButton = UIButton()
            numberButton.translatesAutoresizingMaskIntoConstraints = false
            numberButton.setImage(UIImage(named: number.rawValue), for: .normal)
            numberButton.imageView?.contentMode = .scaleAspectFit
            numberButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            numberStackView.addArrangedSubview(numberButton)
            numberButton.heightAnchor.constraint(equalTo: numberStackView.heightAnchor, constant: -50).isActive = true
            numberButton.widthAnchor.constraint(equalTo: numberStackView.heightAnchor, constant: -50).isActive = true
            numberButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
        }
        
        backView.widthAnchor.constraint(equalTo: numberStackView.subviews.first!.widthAnchor, constant: 10).isActive = true
        backView.heightAnchor.constraint(equalTo: numberStackView.subviews.first!.heightAnchor, constant: 10).isActive = true
        backView.centerYAnchor.constraint(equalTo: numberStackView.subviews.first!.centerYAnchor).isActive = true
        backView.centerXAnchor.constraint(equalTo: numberStackView.subviews.first!.centerXAnchor).isActive = true
        
    }
    
    private func animatedBackView() {
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: { self.backView.transform.tx = self.numberStackView.subviews[self.selectedNumberIndex].frame.origin.x
            self.backView.backgroundColor = UIColor(named: self.numbers[self.selectedNumberIndex].rawValue)
        }, completion: nil)
    }
    
    @objc func buttonTapped(_ sender : UIButton) {
        
        selectedNumberIndex = numberStackView.subviews.firstIndex(of: sender) ?? 0
        sendActions(for: .valueChanged)
        
    }
    
}
