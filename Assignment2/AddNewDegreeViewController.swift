//  AddNewCertificationViewController.swift

// Import Required Modules
import UIKit
import CoreData

// Declare class that inherits from UIViewController
class AddNewDegreeViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var UniversityNameTextField: UITextField!
    @IBOutlet weak var StudentNameTextField: UITextField!
    @IBOutlet weak var StudentIDTextField: UITextField!
    @IBOutlet weak var dateEnterPickerView: UIDatePicker!
    @IBOutlet weak var graduateDatePickerView: UIDatePicker!
    @IBOutlet weak var AcademicDegreeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Gets called when the Save button is pressed
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        // Create a new object
        let Newdegree : MyUniversityDB = NSEntityDescription.insertNewObject(forEntityName: "MyUniversityDB", into: DatabaseController.persistentContainer.viewContext) as! MyUniversityDB
        
        // Input validation. This one could be more strict. Will create "Default Cert" if text field is empty to avoid blank row in TableView.
        if (UniversityNameTextField.text?.isEmpty)! {
            Newdegree.UniversityName = "Default Cert"
        } else {
            Newdegree.UniversityName = UniversityNameTextField.text!
        }
        
        if (StudentNameTextField.text?.isEmpty)! {
            Newdegree.StudentName = ""
        } else {
            Newdegree.StudentName = StudentNameTextField.text!
        }
        
        if (StudentIDTextField.text?.isEmpty)! {
            Newdegree.StudentID = ""
        } else {
            Newdegree.StudentID = StudentIDTextField.text
        }
        
        if (AcademicDegreeTextField.text?.isEmpty)! {
            Newdegree.AcademicDegree = ""
        } else {
            Newdegree.AcademicDegree = AcademicDegreeTextField.text
        }
        
        // Create DateFormatter object
        let formatter1 = DateFormatter()
        
        // Format the date
        formatter1.dateFormat = "dd.MM.yyyy"
        
        // Update the object
        Newdegree.dateEnter = formatter1.string(from: dateEnterPickerView.date)
        
        // Create DateFormatter object
        let formatter2 = DateFormatter()
        
        // Format the date
        formatter2.dateFormat = "dd.MM.yyyy"
        
        // Update the object
        Newdegree.graduateDate = formatter2.string(from: graduateDatePickerView.date)
        
        // Call saveContext in DatabaseController and save the object to CoreData
        DatabaseController.saveContext()
        
        // Create AlertView
        let alert = UIAlertController(title: "Success", message: "Your degree detail has been saved!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK",style: .default, handler:{(acton)in
            alert.dismiss(animated: true, completion: nil)
            
            // Move back to the TableView
            self.performSegue(withIdentifier: "backToUniSegue2", sender: nil)
        }))
        self.present(alert,animated: true,completion: nil)
    }
}
