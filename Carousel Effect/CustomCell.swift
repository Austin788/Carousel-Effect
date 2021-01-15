//
//  CustomCell.swift
//  Carousel Effect
//
//  Created by Austin Zheng on 2021/1/13.
//

import UIKit

class CustomCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configCell(model: CustomCellModel) {
        let imageView = UIImageView(frame: self.bounds)
        imageView.image = model.image
        self.addSubview(imageView)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

