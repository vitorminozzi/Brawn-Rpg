//
//  ChooseCollectionViewCell.swift
//  RpgView 2.0
//
//  Created by Vitor Gomes on 14/09/20.
//  Copyright © 2020 Vitor Gomes. All rights reserved.
//

import UIKit

class ChooseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setupCell(array:Brawn){
        
        
        self.cellImageView.image = UIImage(named: array.imagem ?? "")
        
        
    }
    
    
    
}
