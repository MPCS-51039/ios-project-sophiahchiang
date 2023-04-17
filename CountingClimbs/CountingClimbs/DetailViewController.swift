//
//  DetailViewController.swift
//  CountingClimbs
//
//  Created by Sophia Chiang on 4/12/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailClimbNameLabel: UILabel!
    @IBOutlet weak var detailClimbTypeLabel: UILabel!
    @IBOutlet weak var detailClimbGradeLabel: UILabel!
    
    var climb: Climb!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(climb)

        self.detailClimbNameLabel.text = climb.name
        self.detailClimbTypeLabel.text =  climb.type
        self.detailClimbGradeLabel.text = climb.grade
        
        DispatchQueue.global(qos: .userInitiated).async {
            let climbImageData = NSData(contentsOf: URL(string: self.climb!.imageUrl)!)
            DispatchQueue.main.async {
                self.detailImageView.image = UIImage(data:climbImageData as! Data)
            }
        }
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
