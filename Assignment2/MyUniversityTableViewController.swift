//  MyCertificationsViewController.swift

// Import Required Modules
import UIKit
import CoreData

// Declare class that inherits from UITableViewController
class MyUniversityTableViewController: UITableViewController {
    
    // Property
    @IBOutlet weak var universityCounterLabel: UINavigationItem!
    
    // Declare array of type "MyCertificationsDB"
    var MyUniversityList: [MyUniversityDB] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Push the Table View below the bar
        // Not really required when we use NavigationController
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // Set one section for TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of objects in the array
        return MyUniversityList.count
    }
    
    // Fill the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCertCell", for: indexPath)
        cell.textLabel?.text = "\(MyUniversityList[indexPath.row].UniversityName!) " + "\(MyUniversityList[indexPath.row].StudentName!)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueMyUniDetails" {
            
            // If not nil
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! MyUniversityDetailsViewController
                destVC.selectedUniversity = MyUniversityList[indexPath.row]
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide Back Button
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        // Clear the array
        MyUniversityList = []

        // Get data from database
        let fetchRequest: NSFetchRequest<MyUniversityDB> = MyUniversityDB.fetchRequest()
        
        do {
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            
            for result in searchResults as [MyUniversityDB] {
                MyUniversityList.append(result)
            }
        } catch {
            print("Error reading from database")
        }
        
        // Update the TableView to reflect the changes done in MyCertificationDetailsViewController
        self.tableView.reloadData()
    }
    
    // Editing Table View - tap left on the table to see
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let commit = MyUniversityList[indexPath.row]
            DatabaseController.getContext().delete(commit)
            MyUniversityList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            DatabaseController.saveContext()
        }
    }
}
