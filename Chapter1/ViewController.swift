//
//  ViewController.swift
//  Chapter1
//
//  Created by 김영준 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let insets = UIEdgeInsets(top: -self.view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
        let greenView = UIView()
        greenView.backgroundColor = UIColor(named: "GreenColor")
        greenView.layer.cornerRadius = 20
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "찾는 맛집 이름이 뭐예요?"
        searchBar.barTintColor = UIColor.white
        searchBar.layer.cornerRadius = 3
        searchBar.clipsToBounds = true
        searchBar.delegate = self
        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
            searchTextField.backgroundColor = UIColor.clear
        }
        
        let gpsButton = createButton(title: "우리집")
        gpsButton.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        gpsButton.tintColor = .white
        gpsButton.semanticContentAttribute = .forceRightToLeft
        gpsButton.backgroundColor = .clear
        gpsButton.setTitleColor(UIColor.white, for: .normal)
        gpsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        let menuButton = createIcon(name: "square.grid.2x2")
        menuButton.tintColor = .white
        let bellButton = createIcon(name: "bell")
        bellButton.tintColor = .white
        let cartButton = createIcon(name: "cart")
        cartButton.tintColor = .white
        
        let buttonInfos = [("  알뜰배달", CGRect(x: 0, y: 0, width: 100, height: 110)),
                           ("  배달", CGRect(x: 0, y: 0, width: 100, height: 110)),
                           ("  배민스토어", CGRect(x: 0, y: 0, width: 100, height: 110))]
        
        let couponButton = createButton(title: "집콕러세요? 30% 쿠폰 드려요!")
        couponButton.contentHorizontalAlignment = .left
        
        let button4 = createButton(title: "  대용량특가")
        button4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button4.contentHorizontalAlignment = .left
        button4.contentVerticalAlignment = .top
        
        let advertisementButton = createButton(title: "광고")
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        for (title, _) in buttonInfos {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.clear.cgColor
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            button.heightAnchor.constraint(equalToConstant: 110).isActive = true
            
            button.contentHorizontalAlignment = .left
            button.contentVerticalAlignment = .top
            
            stackView.addArrangedSubview(button)
        }
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false

        let circularImageView = UIImageView()
        circularImageView.image = UIImage(named: "your_image_name")
        circularImageView.contentMode = .scaleAspectFit
        circularImageView.layer.cornerRadius = circularImageView.frame.width / 2
        circularImageView.clipsToBounds = true
        circularImageView.translatesAutoresizingMaskIntoConstraints = false

        let textLabel = UILabel()
        textLabel.text = "짧은 텍스트"
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        greenView.addSubview(gpsButton)
        greenView.addSubview(menuButton)
        greenView.addSubview(bellButton)
        greenView.addSubview(cartButton)
        greenView.addSubview(searchBar)
        self.view.addSubview(greenView)
        self.view.addSubview(couponButton)
        self.view.addSubview(stackView)
        self.view.addSubview(button4)
        self.view.addSubview(advertisementButton)
        
        gpsButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        couponButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        advertisementButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            greenView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            greenView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.bounds.height / 5 * 4),
            
            gpsButton.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 20),
            gpsButton.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -7),
            
            menuButton.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -10),
            menuButton.trailingAnchor.constraint(equalTo: bellButton.leadingAnchor, constant: -15),
            bellButton.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -10),
            bellButton.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: -15),
            cartButton.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -10),
            cartButton.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -15),
            
            
            searchBar.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 15),
            searchBar.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -15),
            searchBar.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: -15),
            
            
            couponButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            couponButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            couponButton.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 15),
            couponButton.heightAnchor.constraint(equalToConstant: 60),
            
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: couponButton.bottomAnchor, constant: 15),
            
            button4.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            button4.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            button4.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            button4.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 215),
            
            advertisementButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            advertisementButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            advertisementButton.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 15),
            advertisementButton.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: 115),
        ])
        
        self.additionalSafeAreaInsets = insets
    }
    
    
       func createButton(title: String) -> UIButton {
           let button = UIButton(type: .system)
           button.setTitle(title, for: .normal)
           button.backgroundColor = UIColor.white
           button.layer.cornerRadius = 15
           button.layer.borderWidth = 1
           button.layer.borderColor = UIColor.black.cgColor
           button.setTitleColor(UIColor.black, for: .normal)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.layer.borderColor = UIColor.clear.cgColor
           
           return button
       }
    
       func createIcon(name: String) -> UIButton {
           let button = UIButton(type: .custom)
           button.setImage(UIImage(systemName: name), for: .normal)
           button.contentMode = .scaleAspectFit
           
           return button
       }
}

