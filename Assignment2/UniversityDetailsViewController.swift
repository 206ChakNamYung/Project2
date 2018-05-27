//  UniversityDetailsViewController.swift

// Import Required Modules
import UIKit

// Declare class that inherits from UIViewController
class UniversityDetailsViewController: UIViewController {
    
    // Declare variable of type "Certification"
    var selectedUniversity : University?
    
    // Properties
    @IBOutlet weak var UniversityName: UILabel!
    @IBOutlet weak var UniversityImage: UIImageView!

    // Prepare for the ViewController to display
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWebView" {
            let destVC = segue.destination as! WebViewController
            destVC.webURL = selectedUniversity?.website
        }
    }
    
    override func viewWillAppear(_ anited: Bool) {
        // Load this just before the ViewController is about to be displayed
        if selectedUniversity != nil {
            UniversityName.text = selectedUniversity?.name
            UniversityImage.image = UIImage(named: "\(selectedUniversity!.image)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
