//
//  FruitsCollectionViewCell.swift
//  Tawrid
//
//  Created by Rizwan Ali on 20/01/2020.
//  Copyright © 2020 Rapidzz. All rights reserved.
//

import UIKit

class FruitsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblkg: UILabel!
    @IBOutlet weak var lblStock: UILabel!
    
    func configureView(fruit: FruitsViewModel){
        self.lblName.text = fruit.name
        self.imgImage.image = UIImage(named: fruit.image)
        self.lblPrice.text = fruit.price
        self.lblkg.text = fruit.kg
        self.lblStock.text = fruit.stock
    }
    
    
    
    
}
