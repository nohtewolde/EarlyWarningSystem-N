//
//  Chat.swift
//  EarlyWarningSystem
//
//  Created by Noh Tewolde on 4/16/19.
//

import UIKit

class Chat: UIViewController {

    @IBOutlet weak var txtMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
    @IBAction func submit(_ sender: UIButton) {
        
    }
    
    @IBAction func imogiBtn(_ sender: UIButton) {
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
}
