//  MyCertificationsDB+CoreDataProperties.swift

// Import require modules
import Foundation
import CoreData

// Create Extension
extension MyUniversityDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyUniversityDB> {
        return NSFetchRequest<MyUniversityDB>(entityName: "MyUniversityDB");
    }

    // Attributes. These must be exactly the same as in the "Database.xcdatamodeld" file
    @NSManaged public var StudentID: String?
    @NSManaged public var StudentName: String?
    @NSManaged public var dateEnter: String?
    @NSManaged public var graduateDate: String?
    @NSManaged public var AcademicDegree: String?
    @NSManaged public var UniversityName: String?
}
