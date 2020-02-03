//
//  AppsGroupCell.swift
//  AppStoreJSONApis
//
//  Created by Victor Hugo on 29/01/20.
//  Copyright © 2020 Vintage Robot. All rights reserved.
//  Definimos la celda que vamos a usar en el AppsController

import UIKit


class AppsGroupCell : UICollectionViewCell {
    
    let titleLabel = UILabel(text: "App section", font: .boldSystemFont(ofSize: 30))
    
//  Usando la extensión vamos a poder reemplazar este código con el anterior
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "App Section"
//        label.font = .boldSystemFont(ofSize: 30)
//        return label
//    }()
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .lightGray
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .blue
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
