//
//  ViewController.swift
//  CountingClimbs
//
//  Created by Sophia Chiang on 3/29/23.
//

import UIKit

class ClimbListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var climbs: [Climb] = []
    var climbService: ClimbService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.climbService = ClimbService()
        self.climbs = self.climbService.getClimbs()
    
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
}

extension ClimbListViewController: UITableViewDataSource {
    //MARK: DataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "climbCell") as! ClimbCellTableViewCell
        
        let currentClimb = self.climbs[indexPath.row]
        cell.climb = currentClimb
        cell.climbNameLabel.text = currentClimb.name
        cell.climbDescLabel.text = currentClimb.grade
        cell.accessoryType = currentClimb.finishedClimb ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.climbs.count
    }
}
    
extension ClimbListViewController: UITableViewDelegate {
    //MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) as? ClimbCellTableViewCell {
            cell.climb?.finishedClimb = true
            cell.accessoryType = cell.climb!.finishedClimb ? .checkmark : .none

        }
    }
}

