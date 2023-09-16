//
//  RootView.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//

import Foundation
import UIKit

class RootView: UIView {
  
  let quoteContainer: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 15
      view.layer.shadowColor = UIColor.black.cgColor
      view.layer.shadowOpacity = 0.2
      view.layer.shadowOffset = CGSize(width: 0, height: 2)
      view.layer.shadowRadius = 4
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
  }()
  
  var priceLabel: UILabel = {
      let label = UILabel()
      label.textAlignment = .natural
      label.textColor = .white
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }()
  
  let btcIcon: UIImageView = {
      let image = UIImageView(image: UIImage(named: "btcIcon"))
      image.translatesAutoresizingMaskIntoConstraints = false
      return image
  }()

  
  var descriptionLabel: UILabel = {
      let label = UILabel()
      label.textAlignment = .natural
      label.textColor = .white
      label.text = "Current BTC/USDT Price"
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }()
  
  //MARK: - Inits
  init() {
      super.init(frame: CGRect())
      setupLayout()
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
    addSubview(quoteContainer)
    quoteContainer.addSubview(btcIcon)
    quoteContainer.addSubview(priceLabel)
    quoteContainer.addSubview(descriptionLabel)
    
    NSLayoutConstraint.activate([
        quoteContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        quoteContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        quoteContainer.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20),
        quoteContainer.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
        quoteContainer.widthAnchor.constraint(equalToConstant: 200),
        quoteContainer.heightAnchor.constraint(equalToConstant: 300),
        
        btcIcon.topAnchor.constraint(equalTo: quoteContainer.topAnchor, constant: 20),
        btcIcon.centerXAnchor.constraint(equalTo: quoteContainer.centerXAnchor),
        btcIcon.widthAnchor.constraint(equalToConstant: 50),
        btcIcon.heightAnchor.constraint(equalToConstant: 50),
        
        priceLabel.topAnchor.constraint(equalTo: btcIcon.bottomAnchor, constant: 10),
        priceLabel.centerXAnchor.constraint(equalTo: quoteContainer.centerXAnchor),
        
        descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
        descriptionLabel.centerXAnchor.constraint(equalTo: quoteContainer.centerXAnchor),
        descriptionLabel.bottomAnchor.constraint(equalTo: quoteContainer.bottomAnchor, constant: -20)
    ])
  }
}
