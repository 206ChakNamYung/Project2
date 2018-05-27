//  MapKitViewController.swift

// Import Required Modules
import UIKit
import MapKit
import CoreLocation

// Declare class that inherits from UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
class MapKitViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate{
    
    // Properties

    @IBOutlet weak var map: MKMapView!
    let manager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span = MKCoordinateSpanMake(0.03, 0.03)
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
        let regiion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(regiion, animated: true)
        
    }
    
    override func viewDidLoad() {
        // This method get called when the view shows up on the screen
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        
        
        let location2 = CLLocationCoordinate2DMake(-31.981208, 115.819908)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location2, 10000000, 10000000), animated: true)
        let pin2 = pinAnnotation(title: "University of Western Australia", subtitle: "35 Stirling Hwy, Crawley WA 6009,Australia", coordiante: location2)
        map.addAnnotation(pin2)
        
        let location3 = CLLocationCoordinate2DMake(-33.888398, 151.187638)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location3, 10000000, 10000000), animated: true)
        let pin3 = pinAnnotation(title: "University of Sydney ", subtitle: "Camperdown NSW 2006,Australia", coordiante: location3)
        map.addAnnotation(pin3)
        
        let location4 = CLLocationCoordinate2DMake(-32.006212, 115.894421)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location4, 10000000, 10000000), animated: true)
        let pin4 = pinAnnotation(title: "Curtin University", subtitle: "Kent St, Bentley WA 6102,Australia", coordiante: location4)
        map.addAnnotation(pin4)
        
        let location5 = CLLocationCoordinate2DMake(-35.277699, 149.118400)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location5, 10000000, 10000000), animated: true)
        let pin5 = pinAnnotation(title: "Australian National University", subtitle: "Canberra ACT 0200 Australia ", coordiante: location5)
        map.addAnnotation(pin5)
        
        let location6 = CLLocationCoordinate2DMake(-33.917336, 151.231172)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location6, 10000000, 10000000), animated: true)
        let pin6 = pinAnnotation(title: "University of New South Wales", subtitle: "Sydney NSW 2052 Australia ", coordiante: location6)
        map.addAnnotation(pin6)
        
        let location7 = CLLocationCoordinate2DMake(-34.920291, 138.606693)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location7, 10000000, 10000000), animated: true)
        let pin7 = pinAnnotation(title: "University of South Australia", subtitle: "101 Currie St, Adelaide SA 5001 Australia ", coordiante: location7)
        map.addAnnotation(pin7)
        
        let location = CLLocationCoordinate2DMake(-37.796404, 144.961165)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location, 10000000, 10000000), animated: true)
        let pin = pinAnnotation(title: "University of Melbourne", subtitle: "Parkville VIC 3010, Australia", coordiante: location)
        map.addAnnotation(pin)
        
        let location8 = CLLocationCoordinate2DMake(-32.892838, 151.704188)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location8, 10000000, 10000000), animated: true)
        let pin8 = pinAnnotation(title: "University of Newcastle", subtitle: "University Dr, Callaghan NSW 2308 Australia ", coordiante: location8)
        map.addAnnotation(pin8)
        
        let location9 = CLLocationCoordinate2DMake(-33.883358, 151.200545)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location9, 10000000, 10000000), animated: true)
        let pin9 = pinAnnotation(title: "University of Technology Sydney", subtitle: "15 Broadway, Ultimo NSW 2007 Australia ", coordiante: location9)
        map.addAnnotation(pin9)
        
        let location10 = CLLocationCoordinate2DMake(-37.910601, 145.136116)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location10, 10000000, 10000000), animated: true)
        let pin10 = pinAnnotation(title: "Monash University", subtitle: "Scenic Blvd & Wellington Road, Clayton VIC 3800 Australia ", coordiante: location10)
        map.addAnnotation(pin10)
        
        let location11 = CLLocationCoordinate2DMake(-27.495627, 153.012220)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location11, 10000000, 10000000), animated: true)
        let pin11 = pinAnnotation(title: "University of Queensland", subtitle: "St Lucia QLD 4072 Australia", coordiante: location11)
        map.addAnnotation(pin11)
        
        
        let location12 = CLLocationCoordinate2DMake(-37.808054, 144.964231)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location12, 10000000, 10000000), animated: true)
        let pin12 = pinAnnotation(title: "RMIT University", subtitle: "124 La Trobe St, Melbourne VIC 3000 Australia ", coordiante: location12)
        map.addAnnotation(pin12)
        
        
        let location13 = CLLocationCoordinate2DMake(-27.477394, 153.028393)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location13, 10000000, 10000000), animated: true)
        let pin13 = pinAnnotation(title: "Queensland University of Technology", subtitle: "2 George St, Brisbane City QLD 4000 Australia  ", coordiante: location13)
        map.addAnnotation(pin13)
        
        
        let location14 = CLLocationCoordinate2DMake(-27.555152, 153.053261)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location14, 10000000, 10000000), animated: true)
        let pin14 = pinAnnotation(title: "Griffith University", subtitle: "170 Kessels Rd, Nathan QLD 4111 Australia ", coordiante: location14)
        map.addAnnotation(pin14)
        
        
        let location15 = CLLocationCoordinate2DMake(37.720897, 145.048385)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location15, 10000000, 10000000), animated: true)
        let pin15 = pinAnnotation(title: "la trobe", subtitle: "Plenty Rd & Kingsbury Dr, Bundoora VIC 3086 Australia ", coordiante: location15)
        map.addAnnotation(pin15)
        
        
        let location16 = CLLocationCoordinate2DMake(-34.920702, 138.606187)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location16, 10000000, 10000000), animated: true)
        let pin16 = pinAnnotation(title: "James Cook University", subtitle: "1 James Cook Dr, Douglas QLD 4814 Australia ", coordiante: location16)
        map.addAnnotation(pin16)
        
        
        let location17 = CLLocationCoordinate2DMake(-37.836944, 144.975330)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location17, 10000000, 10000000), animated: true)
        let pin17 = pinAnnotation(title: "University of Adelaide", subtitle: "Adelaide SA 5005 Australia ", coordiante: location17)
        map.addAnnotation(pin17)
        
        
        let location18 = CLLocationCoordinate2DMake(-34.405441, 150.878431)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location18, 10000000, 10000000), animated: true)
        let pin18 = pinAnnotation(title: "University of Wollongong", subtitle: "Northfields Ave, Wollongong NSW 2522 Australia ", coordiante: location18)
        map.addAnnotation(pin18)
        
        
        let location19 = CLLocationCoordinate2DMake(-23.319866, 150.521583)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location19, 10000000, 10000000), animated: true)
        let pin19 = pinAnnotation(title: "Central Queensland University", subtitle: "554/700 Yaamba Road, Norman Gardens QLD 4701 Australia ", coordiante: location19)
        map.addAnnotation(pin19)
        
        let location20 = CLLocationCoordinate2DMake(-32.069193, 115.833822)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location20, 10000000, 10000000), animated: true)
        let pin20 = pinAnnotation(title: "Murdoch University", subtitle: "90 South St, Murdoch WA 6150 Australia ", coordiante: location20)
        map.addAnnotation(pin20)
        
        let location21 = CLLocationCoordinate2DMake(-28.073141, 153.416625)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location21, 10000000, 10000000), animated: true)
        let pin21 = pinAnnotation(title: "Bond University", subtitle: "14 University Dr, Robina QLD 4226 Australia ", coordiante: location21)
        map.addAnnotation(pin21)
        
        let location22 = CLLocationCoordinate2DMake(-33.773893, 151.112577)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location22, 10000000, 10000000), animated: true)
        let pin22 = pinAnnotation(title: "Macquarie University", subtitle: "Sydney NSW 2109 Australia ", coordiante: location22)
        map.addAnnotation(pin22)
        
        let location23 = CLLocationCoordinate2DMake(-37.822197, 145.038939)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location23, 10000000, 10000000), animated: true)
        let pin23 = pinAnnotation(title: "Swinburne", subtitle: "John St, Hawthorn VIC 3122 Australia ", coordiante: location23)
        map.addAnnotation(pin23)
        
        let location24 = CLLocationCoordinate2DMake(-27.604447, 151.930430)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location24, 10000000, 10000000), animated: true)
        let pin24 = pinAnnotation(title: "University of Southern Queensland", subtitle: " West St, Darling Heights QLD 4350 Australia ", coordiante: location24)
        map.addAnnotation(pin24)
        
        let location25 = CLLocationCoordinate2DMake(42.904181, 147.324774)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location25, 10000000, 10000000), animated: true)
        let pin25 = pinAnnotation(title: "University of Tasmania", subtitle: "Churchill Ave, Hobart TAS 7005 Australia ", coordiante: location25)
        map.addAnnotation(pin25)
        
        let location26 = CLLocationCoordinate2DMake(-35.238530, 149.082507)
        map.setRegion(MKCoordinateRegionMakeWithDistance(location26, 10000000, 10000000), animated: true)
        let pin26 = pinAnnotation(title: "University of Canberra", subtitle: "University Dr, Bruce ACT 2617 Australia ", coordiante: location26)
        map.addAnnotation(pin26)
        
    }
}

