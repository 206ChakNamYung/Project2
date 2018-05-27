//  University.swift

// Import Required Modules
import Foundation
import UIKit

// Declare class
class University {
    // Attributes
    var name : String
    var image : String
    var website : String
    
    // Constructor required when object is to be created
    init(theName : String, theImage : String, theWebsite : String) {
        self.name = theName
        self.image = theImage
        self.website = theWebsite
    }
}

class Utilities {
    static var universitys : [University] = [] // Declare an static array that can be called from outside class without creating a instance first
    static func loadUniversity() {
        // This method gets called so all certifications get loaded into the CertificationTableViewController
        // This is "hard coded" and objects are created when the app is executed.
        // It's not the prefered way to "store" data but we wanted to show difference between this and CoreData (two different ways to store data)
        // We have used CoreData in "My Certifications" feature
        universitys = [
            University(theName: "University of Western Australia", theImage: "University of Western Australia.jpeg", theWebsite: "https://www.uwa.edu.au"),
            
            University(theName: "University of Sydney", theImage: "University of Sydney.jpg", theWebsite: "https://sydney.edu.au"),
            
            University(theName: "Curtin University", theImage: "Curtin University.png", theWebsite: "https://www.curtin.edu.au"),
            
            University(theName: "Australian National University", theImage: "Australian National University.png", theWebsite: "http://www.anu.edu.au"),
            
            University(theName: "University of New South Wales", theImage: "University of New South Wales.png", theWebsite: "https://www.unsw.edu.au"),
            
            University(theName: "University of South Australia", theImage: "University of South Australia.png", theWebsite: "https://www.unisa.edu.au/"),
            
            University(theName: "University of Melbourne", theImage: "University of Melbourne.gif", theWebsite: "https://www.unimelb.edu.au/"),
            
            University(theName: "University of Newcastle", theImage: "University of Newcastle.jpeg", theWebsite: "https://www.newcastle.edu.au/"),
            
            University(theName: "University of Technology Sydney", theImage: "University of Technology Sydney.png", theWebsite: "https://www.uts.edu.au"),
            
            University(theName: "Monash University", theImage: "Monash University.jpg", theWebsite: "https://www.monash.edu"),
            
            University(theName: "University of Queensland", theImage: "Queensland University of Technology.png", theWebsite: "https://www.uq.edu.au"),
            
            University(theName: "RMIT University", theImage: "RMIT University.png", theWebsite: "https://www.rmit.edu.au"),
            
            University(theName: "Queensland University of Technology", theImage: "Queensland University of Technology.png", theWebsite: "https://www.qut.edu.au"),
            
            University(theName: "Griffith University", theImage: "Griffith University.png", theWebsite: "https://www.griffith.edu.au/about-griffith/campuses-facilities/nathan"),
            
            University(theName: "la trobe", theImage: "la trobe.png", theWebsite: "https://www.latrobe.edu.au"),
            
            University(theName: "James Cook University", theImage: "James Cook University.png", theWebsite: "https://www.jcu.edu.au"),
            
            University(theName: "University of Adelaide", theImage: "University of Adelaide.png", theWebsite: "https://www.adelaide.edu.au"),
            
            University(theName: "University of Wollongong", theImage: "University of Wollongong.png", theWebsite: "https://www.uow.edu.au/index.html"),
            
            University(theName: "Central Queensland University", theImage: "Central Queensland University.png", theWebsite: "https://www.cqu.edu.au/"),
            
            University(theName: "Murdoch University", theImage: "Murdoch University.png", theWebsite: "https://www.murdoch.edu.au"),
            
            University(theName: "Bond University", theImage: "Bond University.jpeg", theWebsite: "https://bond.edu.au"),
            
            University(theName: "Macquarie University", theImage: "Macquarie University.png", theWebsite: "https://www.mq.edu.au"),
            
            University(theName: "Swinburne", theImage: "Swinburne.png", theWebsite: "http://www.swinburne.edu.au"),
            
            University(theName: "University of Southern Queensland", theImage: "University of Southern Queensland.png", theWebsite: "https://www.usq.edu.au"),
            
            University(theName: "University of Tasmania", theImage: "University of Tasmania.png", theWebsite: "http://www.utas.edu.au"),
            
            University(theName: "University of Canberra", theImage: "University of Canberra.png", theWebsite: "http://www.canberra.edu.au"),
            
        ]
    }
}

