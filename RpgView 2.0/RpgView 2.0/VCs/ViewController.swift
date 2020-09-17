//
//  ViewController.swift
//  RpgView 2.0
//
//  Created by Vitor Gomes on 14/09/20.
//  Copyright © 2020 Vitor Gomes. All rights reserved.
//

import UIKit


enum SegueType: String{
    
    case battleSegue
    
}



class ViewController: UIViewController {

    @IBOutlet weak var chooseYourCharLabel: UILabel!
    @IBOutlet weak var chooseNameLabel: UILabel!
    @IBOutlet weak var chooseFunctionLabel: UILabel!
   
    @IBOutlet weak var chooseCollectionView: UICollectionView!
    
    @IBOutlet weak var confirmChooseButton: UIButton!
    
    var arrayChooseBrawn:[Brawn] = []
    
    
    var numberBegin:Int?
    
    override func viewDidLoad() {
        
      
        
        self.arrayChooseBrawn = [Brawn(nome: "Bull", funcao: "Tanque", imagem: "bull", dano: 3, hp: 15, atksp: 1), Brawn(nome: "Colt", funcao: "Dano", imagem: "colt", dano: 5, hp: 9, atksp: 2), Brawn(nome: "Crow", funcao: "Dano", imagem: "crow", dano: 2, hp: 8, atksp: 3) ]
        
        
        self.chooseCollectionView.register(UINib(nibName: "ChooseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChooseCollectionViewCell")
        
        self.chooseCollectionView.delegate = self
        self.chooseCollectionView.dataSource = self
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func confirmChooseAction(_ sender: Any) {
        
        
        
        performSegue(withIdentifier:SegueType.battleSegue.rawValue, sender: UIButton.self)
        
        
            
        }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueType.battleSegue.rawValue {
            
            if let battleViewController = segue.destination as? BattleViewController{
                
                battleViewController.counter = self.numberBegin
                
            }
            
        }
        
    }
                   
              
            
        }
 
    
        
    
   
    
    


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayChooseBrawn.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let chooseCell:ChooseCollectionViewCell?  = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseCollectionViewCell" , for: indexPath) as? ChooseCollectionViewCell
        
        chooseCell?.setupCell(array: self.arrayChooseBrawn[indexPath.item])
        
        return chooseCell ?? UICollectionViewCell()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.numberBegin = indexPath.item
        
        print("Row \(numberBegin ?? 0) Selected")
        
        if indexPath.row == 0{
            
            self.chooseNameLabel.text = "Bull"
            self.chooseFunctionLabel.text = "Tanque"
            
        }else if indexPath.row == 1{
            
            self.chooseNameLabel.text = "Colt"
            self.chooseFunctionLabel.text = "Dano"
                      
        }else if indexPath.row == 2{
            
            self.chooseNameLabel.text = "Crow"
            self.chooseFunctionLabel.text = "Dano"
        }
}

}



