//
//  ViewController.swift
//  CountingClimbs
//
//  Created by Sophia Chiang on 3/29/23.
//

import UIKit

class ClimbListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var climbs: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.climbs = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink", "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink", "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink", "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink", "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink"]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
}

extension ClimbListViewController: UITableViewDataSource {
    //MARK: DataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "climbCell") as! ClimbCellTableViewCell
        
        cell.climbNameLabel.text = self.climbs[indexPath.row]
        cell.climbDescLabel.text = "Beautiful slab climb outside"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.climbs.count
    }
}
    
extension ClimbListViewController: UITableViewDelegate {
    //MARK: Delegate
    
    }

