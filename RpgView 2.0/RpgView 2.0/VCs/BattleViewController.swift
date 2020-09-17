//
//  BattleViewController.swift
//  RpgView 2.0
//
//  Created by Vitor Gomes on 15/09/20.
//  Copyright © 2020 Vitor Gomes. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {

    @IBOutlet var battleView: UIView!
    
    // MARK: - User Views

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var superLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    // MARK: - Enemy Views
    @IBOutlet weak var enemyHpLabel: UILabel!
    @IBOutlet weak var enemySuperLabel: UILabel!
    @IBOutlet weak var enemyCountLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var enemyImageView: UIImageView!
    
    // MARK: - TableViews
    @IBOutlet weak var actionsTableView: UITableView!
    @IBOutlet weak var itensTableView: UITableView!
    
    
    var myBrawn:[Brawn] = []
    var enemy:[Enemy] = []
    var stage:Int?
    
    var counter:Int?
    
    override func viewDidLoad() {
        
     
        self.myBrawnlerSelected()
        self.userImageView.image = UIImage(named: self.myBrawn[0].imagem ?? "")
        self.hpLabel.text = "Hp : \(String(self.myBrawn[0].hp ?? 0)) "
        self.countLabel.text = "Rodada 0"
        self.stage = 1
        print("Iniciando Stage \(self.stage ?? 0) ")
        self.myEnemySelected()
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func myBrawnlerSelected() {
        
        if counter == 0{
            
            self.myBrawn = [Brawn(nome: "Bull", funcao: "Tanque", imagem: "bull", dano: 3, hp: 15, atksp: 1)]
        }else if counter == 1{
            
            self.myBrawn = [Brawn(nome: "Colt", funcao: "Dano", imagem: "colt", dano: 5, hp: 9, atksp: 2)]
        }else if counter == 2{
            
            self.myBrawn = [Brawn(nome: "Crow", funcao: "Dano", imagem: "crow", dano: 2, hp: 8, atksp: 3)]
        }
    }
    
    
    func myEnemySelected() {
        
        if stage == 1{
            
            self.enemy = [Enemy(nome: "Barbaro", imagem: "barbarian", dano: 2, hp: 10, atksp: 1)]
        }
    
        self.enemyHpLabel.text = self.enemy[0].nome
        self.enemyImageView.image = UIImage(named: self.enemy[0].imagem ?? "")
        self.enemyCountLabel.text = "Hp : \(String(self.enemy[0].hp ?? 0)) "
    }
    
    
    
     // MARK: - Action
    
    
    @IBAction func attackAction(_ sender: Any) {
        
        
        print(counter ?? 0)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

