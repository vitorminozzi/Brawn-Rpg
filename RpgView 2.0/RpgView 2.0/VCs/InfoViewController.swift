//
//  InfoViewController.swift
//  RpgView 2.0
//
//  Created by Vitor Gomes on 28/09/20.
//  Copyright © 2020 Vitor Gomes. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    // MARK: - Outlets and Variables
    
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var infoPickerView: UIPickerView!
    @IBOutlet weak var infohpLabel: UILabel!
    @IBOutlet weak var infoDamageLabel: UILabel!
    @IBOutlet weak var infoAtkSpLabel: UILabel!
    @IBOutlet weak var infoSuperLabel: UILabel!
    
    var infoArray:[Brawn] = []
    
    // MARK: - Viewdidload
    
    override func viewDidLoad() {
        
        self.infoPickerView.delegate = self
        self.infoPickerView.dataSource = self
 
        
        self.feedView(image: self.infoArray[0].imagem ?? "",
                            hp: self.infoArray[0].hp ?? 0,
                            dano: self.infoArray[0].dano ?? 0,
                            atksp: self.infoArray[0].atksp ?? 0)
              
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Actions e Functions
    
    @IBAction func backButton(_ sender: Any) {
        
        performSegue(withIdentifier:SegueType.backSegue.rawValue, sender: UIButton.self)
    }
    
    func feedView(image:String, hp: Int, dano: Int, atksp: Int ){
        
        
        self.infoImageView.image = UIImage(named: image)
        self.infohpLabel.text = "HP: \(String(hp))"
        self.infoDamageLabel.text = "Dano: \(String(dano))"
        self.infoAtkSpLabel.text = "AtkSP \(String(atksp))"
        
        
    }
    
    
    
    
    
    
}




// MARK: - PickerView

extension InfoViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.infoArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
           return self.infoArray[row].nome
        
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        
        self.feedView(image: self.infoArray[row].imagem ?? "",
                      hp: self.infoArray[row].hp ?? 0,
                      dano: self.infoArray[row].dano ?? 0,
                      atksp: self.infoArray[row].atksp ?? 0)
        
       
    }
    
    
    
}
