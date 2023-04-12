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
        self.climbService.getClimbs(completion: { climbs, error in
            guard let climbs = climbs, error == nil else {
                // here's where I can use errors to change UI
                return
            }
            self.climbs = climbs
            self.tableView.reloadData()
        })
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.title = "Climbs"
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? DetailViewController,
            let selectedIndexPath = self.tableView.indexPathForSelectedRow,
            let confirmedCell = self.tableView.cellForRow(at: selectedIndexPath) as? ClimbCellTableViewCell else { return }
                    
        let confirmedClimb = confirmedCell.climb
        destination.climb = confirmedClimb
    }
}

extension ClimbListViewController: UITableViewDataSource {
    //MARK: DataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "climbCell") as! ClimbCellTableViewCell
        
        let currentClimb = self.climbs[indexPath.row]
        
        cell.climb = currentClimb
        
        if currentClimb.isFavorite {
            cell.backgroundColor = .systemPink
            
            //Color(red: 250, green: 218, blue: 221)
        }
        
        if currentClimb.isFinished {
            cell.accessoryType = .checkmark
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.climbs.count
    }
}
    
extension ClimbListViewController: UITableViewDelegate {
    //MARK: Delegate
    
    
//Checkmark from Chelsea videos
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if
//            let cell = self.tableView.cellForRow(at: indexPath) as? ClimbCellTableViewCell,
//            let confirmedFinishedClimb = cell.climb
//        {
//            confirmedFinishedClimb.finishedClimb = true
//            cell.accessoryType = confirmedFinishedClimb.finishedClimb ? .checkmark : .none
//        }
//    }
//
    
//Swipe functionality
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") {action, indexPath in self.climbs.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let cell = climbs[indexPath.row]
        
        let favoriteActionTitle = cell.isFavorite ? "Unfavorite" : "Favorite"
        let favoriteAction = UITableViewRowAction(style: .normal, title: favoriteActionTitle) {action, indexPath in
            self.climbs[indexPath.row].isFavorite.toggle()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        favoriteAction.backgroundColor = .systemGreen
        
        let finishedActionTitle = cell.isFinished ? "In progress" : "Finished"
        let finishedAction = UITableViewRowAction(style: .normal, title: finishedActionTitle) {action, indexPath in
            self.climbs[indexPath.row].isFinished.toggle()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        finishedAction.backgroundColor = .systemBlue

        return [deleteAction, favoriteAction, finishedAction]
    }
}

