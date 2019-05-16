//
//  PassForgottenViewController.swift

//

import UIKit
import TWMessageBarManager
import SVProgressHUD

class PassForgottenViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()

        setUpTxtFields(txtF: txtEmail, img: UIImage(named: "emailIcon") ?? UIImage())
    }
    
    
    func assignbackground(){
        let background = UIImage(named: "blueBackground")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func setUpTxtFields(txtF : UITextField , img : UIImage) {
        let image = UIImageView(image: img)
        txtF.leftView = image
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtn(_ sender: UIButton) {
        if !(txtEmail.text?.isEmpty)! {
            SVProgressHUD.show()
            FireBaseServices.shared.resetPassword(email: txtEmail.text!) { (error) in
                if error == nil {
                    SVProgressHUD.dismiss()
                    TWMessageBarManager().showMessage(withTitle: NSLocalizedString("Success", comment: ""), description: NSLocalizedString("Your new password has been sent successfully", comment: ""), type: .success, duration: 5)
                } else {
                    SVProgressHUD.dismiss()
                    TWMessageBarManager().showMessage(withTitle: NSLocalizedString("Error", comment: ""), description: String(describing: error!.localizedDescription), type: .error, duration: 5)
                }
            }
        } else {
            TWMessageBarManager().showMessage(withTitle: NSLocalizedString("Error", comment: ""), description: NSLocalizedString("Please fill in all required fields", comment: ""), type: .error, duration: 5)
        }
    }
}
