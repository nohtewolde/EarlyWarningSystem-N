//
//  SignUpControllerViewController.swift
//  EarlyWarningSystem
//
//  Created by Hajar Mouaddine on 12/22/18.
//  Copyright © 2018 Hajar Mouaddine. All rights reserved.
//

import UIKit
import CoreLocation
import TWMessageBarManager
import SVProgressHUD

class SignUpControllerViewController: UIViewController {

    @IBOutlet weak var txtFname: UITextField!
    @IBOutlet weak var txtLname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtConfirmPass: UITextField!
    
    var location = CLLocation()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "blueBackground")!)
        setupLocation()
    }
       
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        if !(txtFname.text?.isEmpty)! && !(txtLname.text?.isEmpty)! && !(txtEmail.text?.isEmpty)! && !(txtAddress.text?.isEmpty)! && !(txtPhone.text?.isEmpty)! && !(txtPass.text?.isEmpty)! && !(txtConfirmPass.text?.isEmpty)!{
            if txtPass.text! == txtConfirmPass.text! {
                SVProgressHUD.show()
                let user = UserModel(userID: nil, fname: txtFname.text!, lname: txtLname.text!, email: txtEmail.text!, address: txtAddress.text!, phone: txtPhone.text!, password: txtPass.text!, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, image: UIImage(named: "adduser"))
                FireBaseServices.shared.signUp(user: user) { (error) in
                    if error == nil {
                        SVProgressHUD.dismiss()
                        self.dismiss(animated: true, completion: nil)
                        TWMessageBarManager().showMessage(withTitle: NSLocalizedString("Congratulations", comment: ""), description: NSLocalizedString("You have successfully signed up to EWS", comment: ""), type: .success, duration: 5)
                        
                    }else {
                        SVProgressHUD.dismiss()
                        TWMessageBarManager().showMessage(withTitle: NSLocalizedString("Error", comment: ""), description: String(describing: error!.localizedDescription), type: .error, duration: 5)
                    }
                }
            } else {
                TWMessageBarManager().showMessage(withTitle: NSLocalizedString("Error", comment: ""), description: NSLocalizedString("Password confirmation unsuccessful", comment: ""), type: .error, duration: 5)
            }
        } else {
            TWMessageBarManager().showMessage(withTitle: NSLocalizedString("Error", comment: ""), description: NSLocalizedString("Please fill in all required fields", comment: ""), type: .error, duration: 5)
        }
    }
    
}

extension SignUpControllerViewController: CLLocationManagerDelegate{
    
    func setupLocation(){
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last {
            location = loc
        }
    }
}
