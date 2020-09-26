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
    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var enemyImageView: UIImageView!
    
    // MARK: - TableViews
    @IBOutlet weak var actionsTableView: UITableView!
    @IBOutlet weak var itensTableView: UITableView!
    
    
    var myBrawn:[Brawn] = []

    var enemy:Enemy = Enemy(nome: "Barbaro" , imagem: "barbarian", dano: 2, hp: 10, atksp: 1){ didSet{
        self.myEnemySelected()
        }
        
    }
    
    var round = 0
    var stage:Int = 1
    var actionsStrings:[String] = []
    
    
    
    var counter:Int?
    
    override func viewDidLoad() {
        
        self.myBrawnlerSelected()
        self.userImageView.image = UIImage(named: self.myBrawn[0].imagem ?? "")
        self.hpLabel.text = "Hp : \(String(self.myBrawn[0].hp ?? 0)) "
        self.countLabel.text = "Rodada \(round)"
        print("Iniciando Stage \(self.stage) ")
        self.myEnemySelected()
        self.actionsTableView.delegate = self
        self.actionsTableView.dataSource = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     // MARK: - Functions
    
    func tradeRound () {
        if self.enemy.hp ?? 0 > 0{
        self.round += 1
        
    }
    }
    
    func combatDamage (damage:Int, hp:Int, eDamage:Int, eHp:Int) {
        
        let combatD = hp - eDamage
        let eCombatD = eHp - damage
        
        self.myBrawn[0].hp = combatD
        self.enemy.hp = eCombatD
    
        
        self.hpLabel.text = "HP : \(String(combatD)) "
        self.enemyHpLabel.text = "HP : \(String(eCombatD)) "
        
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
        
        self.enemyNameLabel.text = self.enemy.nome
        self.enemyImageView.image = UIImage(named: self.enemy.imagem ?? "")
        self.enemyHpLabel.text = "Hp : \(String(self.enemy.hp ?? 0)) "
        
    }
    
    
    func cleanEnemy(){
        
        
        self.enemyNameLabel.text = nil
        self.enemyImageView.image = nil
        self.enemyHpLabel.text = nil
        
    }
    
    
    
    func tradeEnemy(){
        
        if self.enemy.hp ?? 0 <= 0{
            
            self.round = 0
            print(round)
            self.countLabel.text = "Rodada \(round) "
            self.actionsStrings = []
            self.actionsStrings.append("\(self.enemy.nome ?? " ") foi derrotado !!")
            self.stage += 1
            print("Iniciando stage \(stage)")
            self.newEnemy()
        }
    }
    
  func newEnemy(){
        
        switch stage{
        
        case 2:
            self.enemy = Enemy(nome: "Arqueira" , imagem: "archer", dano: 4, hp: 6, atksp: 1)
            
        case 3:
            self.enemy = Enemy(nome: "Servo" , imagem: "minion", dano: 3, hp: 6, atksp: 2)
            
        case 4:
            self.enemy = Enemy(nome: "Gigante" , imagem: "giant", dano: 2, hp: 15, atksp: 1)
            
        case 5:
            self.enemy = Enemy(nome: "Rei Barbaro" , imagem: "barbarianking", dano: 8, hp: 10, atksp: 1)
            
        default:
            self.cleanEnemy()
    }
    }
    
    
    
    
     // MARK: - Action
    
    
    @IBAction func attackAction(_ sender: Any) {
        
        
        self.tradeRound()
        self.countLabel.text = "Rodada \(round) "
        print("rodada \(round)" )
        self.combatDamage(damage: self.myBrawn[0].dano ?? 0, hp: self.myBrawn[0].hp ?? 0, eDamage:self.enemy.dano ?? 0 , eHp: self.enemy.hp ?? 0)
        self.actionsStrings.append("\(self.myBrawn[0].nome ?? "") causou \(String(self.myBrawn[0].dano ?? 0)) em \(String(self.enemy.nome ?? ""))  ")
        self.actionsStrings.append("\(self.enemy.nome ?? "") causou \(String(self.enemy.dano ?? 0)) em \(String(self.myBrawn[0].nome ?? ""))  ")
        self.tradeEnemy()
        self.actionsTableView.reloadData()
        
        
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


extension BattleViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.actionsStrings.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "actionCell", for: indexPath)
        
        
        cell.textLabel?.text = self.actionsStrings[indexPath.row]
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        
        return cell
        
    }
    
    
    
    
}

