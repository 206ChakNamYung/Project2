// ShareViewController.swift

// Import Required Modules
import UIKit
import Social

// Declare class that inherits from UIViewController
class ShareViewController: UIViewController {
    
    // Attributes
    var gravity : UIGravityBehavior?
    var animator : UIDynamicAnimator?
    var gameTimer : Timer?
    
    var status : String = "logo1"
    var vector : CGVector?
    
    // Action that is called when Facebook logo is clicked
    // We added our GitHub website here for demonstration. If in production, we would have added a link to a real website
    @IBAction func fb(_ sender: UIButton) {
        let vc = SLComposeViewController(forServiceType:SLServiceTypeFacebook)
        vc?.setInitialText("https://github.com/peterandsteven/ITCertifications")
        present(vc!,animated: true,completion: nil)
    }
    
    // Action that is called when Twitter logo is clicked
    // We added our GitHub website here for demonstration. If in production, we would have added a link to a real website
    @IBAction func tw(_ sender: UIButton) {
        let vc = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
        vc?.setInitialText("https://github.com/peterandsteven/ITCertifications")
        present(vc!,animated: true,completion: nil)
    }
    
    // Method that gets called when the view just loaded
    override func viewDidLoad() {
        // Call method from super class
        super.viewDidLoad()
        
        // Timer to show company logos
        gameTimer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(ShareViewController.addLogos(_ :)),
                                         userInfo: nil, repeats: true)
        
        // Register an animator
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [])
        
        // Fine tune gravity, magnitude and direction settings
        let vector = CGVector(dx: 0.0, dy: 0.1)
        gravity?.gravityDirection = vector
        animator?.addBehavior(gravity!)
    }
    
    // Method that gets called when logo is to be added to the view
    @objc func addLogos(_ : Any) {
        // Pick random X position for the logo instead of putting the logos in the same spot all the time
        let xCoordinate = arc4random() % UInt32(self.view.bounds.width)
        
        // Create button, set image, assign touchUpInside handler, add it to view and gravity animator
        let btn = UIButton(frame: CGRect(x: Int(xCoordinate), y: 60, width: 100, height: 100))
        
        // 5 different company logos that are placed in Assets
        let logo1 : String = "CISCO"
        let logo2 : String = "COMPTIA"
        let logo3 : String = "MICROSOFT"
        let logo4 : String = "ORACLE"
        let logo5 : String = "ARUBA"
        
        // Simple if statement that replaces logo for every time this method is called
        if (status == "logo1") {
            btn.setImage(UIImage(named: logo1), for: .normal)
            status = "logo2"
        } else if (status == "logo2") {
            btn.setImage(UIImage(named: logo2), for: .normal)
            status = "logo3"
        } else if (status == "logo3") {
            btn.setImage(UIImage(named: logo3), for: .normal)
            status = "logo4"
        } else if (status == "logo4") {
            btn.setImage(UIImage(named: logo4), for: .normal)
            status = "logo5"
        } else {
            btn.setImage(UIImage(named: logo5), for: .normal)
            status = "logo1"
        }
        
        // Button for when the logo is clicked
        btn.addTarget(self, action: #selector(self.didPopBalloon(sender:)), for: .touchUpInside)
        self.view.addSubview(btn)
        gravity?.addItem((btn as UIView))
    }
    
    // Method that gets called when the logo is clicked.
    @objc func didPopBalloon(sender: UIButton) {
        // We left out the "exploded" image from Assets since we didn't want to show any effect but just have it be blank when logo is clicked.
        // Below is the line that would make it possible to set a different image when the logo is pressed.
        sender.setImage(UIImage(named: "exploded"), for: .normal)
        UIView.animate(withDuration: 0.4, animations: {sender.alpha = 0}, completion: { (true) in sender.removeFromSuperview()})
    }
}
