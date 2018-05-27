
// Import Required Modules
import UIKit
import AVFoundation

// Declare class that inherits from UITableViewController
class UniversityTableViewController: UITableViewController {
    
    // Create Audio Player object
    var player:AVAudioPlayer = AVAudioPlayer()

    
    override func viewDidLoad() {
        // Load this block of code when ViewController did load
        super.viewDidLoad()
        
        // Grab the Universitys objects
        Utilities.loadUniversity()
        
        // Push the Table View below the bar
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    }
    
    // Set one table section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Get number of objects in array
        return Utilities.universitys.count
    }

    // Fill the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityCell", for: indexPath)
        cell.textLabel?.text = "\(Utilities.universitys[indexPath.row].name)"
        cell.imageView?.image = UIImage(named: "\(Utilities.universitys[indexPath.row].image)")

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Segue
        if segue.identifier == "segueUniDetails" {
            // If not nil
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! UniversityDetailsViewController
                
                // Update variable in UniversityDetailsViewController
                destVC.selectedUniversity = Utilities.universitys[indexPath.row]
            }
        }
    }
}
