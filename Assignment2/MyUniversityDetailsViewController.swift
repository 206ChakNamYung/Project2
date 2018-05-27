//  MyUniversityViewController.swift

// Import Required Module
import UIKit

// Declare class that inherit from UIViewController and UIPickerViewDelegate
class MyUniversityDetailsViewController: UIViewController, UIPickerViewDelegate {
    
    // Declare variable of type "MyUniversityDB"
    var selectedUniversity : MyUniversityDB?
    
    // Properties
    @IBOutlet weak var UniversityNameItem: UINavigationItem!
    @IBOutlet weak var UniversityNameTextField: UITextField!
    @IBOutlet weak var StudentNameTextField: UITextField!
    @IBOutlet weak var StudentIDTextField: UITextField!
    @IBOutlet weak var AcademicDegreeTextField: UITextField!
    @IBOutlet weak var dateEnter: UIDatePicker!
    @IBOutlet weak var graduateDate: UIDatePicker!
    
    // Method that gets called when the "dateEnter" UIPickerView gets changed
    @IBAction func dateEnterPickerValueChanged(_ sender: UIDatePicker) {
        // Create a DateFormatter object
        let formatter = DateFormatter()
        // Format the date properly
        formatter.dateFormat = "dd.MM.yyyy"
        // Update the object with new date in proper format
        selectedUniversity?.dateEnter = formatter.string(from: dateEnter.date)
    }
    
    // Method that gets called when the "graduateDate" UIPickerView gets changed
    @IBAction func graduateDatePickerValueChanged(_ sender: UIDatePicker) {
        // Create a DateFormatter object
        let formatter = DateFormatter()
        // Format the date properly
        formatter.dateFormat = "dd.MM.yyyy"
        // Update the object with new date in proper format
        selectedUniversity?.graduateDate = formatter.string(from: graduateDate.date)
    }
    
    // Method that gets called when the "Save" button is clicked
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        // Unwrap and update the object with values from the textfields
        selectedUniversity?.UniversityName = UniversityNameTextField.text!
        selectedUniversity?.StudentName = StudentNameTextField.text!
        selectedUniversity?.StudentID = StudentIDTextField.text!
        selectedUniversity?.AcademicDegree = AcademicDegreeTextField.text!
        
        // Call the saveContext method in the DatabaseController
        DatabaseController.saveContext()
        
        // No biggie though! ;-)
        
        // Show AlertView to inform user that university is updated.
        let alert = UIAlertController(title: "Success", message: "Your Degree has been updated!", preferredStyle: .alert)
        // Create "OK" button
        alert.addAction(UIAlertAction(title:"OK",style: .default, handler:{(acton)in
            alert.dismiss(animated: true, completion: nil)
            // Move back to the TableView
            self.performSegue(withIdentifier: "backToUniSegue", sender: nil)
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ anited: Bool) {
        // Load the data from the objects and populate the text fields
        if selectedUniversity != nil {
            UniversityNameItem.title = ((selectedUniversity?.UniversityName)! + " " + (selectedUniversity?.StudentName)!)
            UniversityNameTextField.text = selectedUniversity?.UniversityName
            StudentNameTextField.text = selectedUniversity?.StudentName
            StudentIDTextField.text = selectedUniversity?.StudentID

            // Update the UIPickerView for dateEnter based on data from the object
            let dateEnterDateFormatter = DateFormatter()
            dateEnterDateFormatter.dateFormat = "dd.MM.yyyy"
            let date = dateEnterDateFormatter.date(from: (selectedUniversity?.dateEnter)!)!
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
            let finalDate = calendar.date(from:components)
            dateEnter.setDate(finalDate!, animated: true)
            
            // Update the UIPickerView for graduateDate based on data from the object
            let graduateDateDateFormatter = DateFormatter()
            graduateDateDateFormatter.dateFormat = "dd.MM.yyyy"
            let date2 = graduateDateDateFormatter.date(from: (selectedUniversity?.graduateDate)!)!
            let calendar2 = Calendar.current
            let components2 = calendar2.dateComponents([.year, .month, .day, .hour], from: date2)
            let finalDate2 = calendar2.date(from:components2)
            graduateDate.setDate(finalDate2!, animated: true)
            
            AcademicDegreeTextField.text = selectedUniversity?.AcademicDegree
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
