//
//  InfoViewController.swift
//  RpgView 2.0
//
//  Created by Vitor Gomes on 28/09/20.
//  Copyright © 2020 Vitor Gomes. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var infoTableView: UITableView!
    @IBOutlet weak var superInfoLabel: UILabel!
    @IBOutlet weak var textInfoLabel: UILabel!
    
    var infoArray:[Brawn] = []
    
    
    
    override func viewDidLoad() {
        
        
        self.infoTableView.delegate = self
        self.infoTableView.dataSource = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backChooseButton(_ sender: Any) {
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
extension InfoViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
    
    
}
