//
//  ViewController.swift
//  DemoApp
//
//  Created by Thang Le on 11/03/2025.
//

import UIKit
import GapoSDK

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GapoWorkSDK.shared.test()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let urlString = "https://image-1.gapowork.vn/images/38a30628-74ac-465c-b4c8-e2ff159daf7b/blob.jpeg"
        GapoWorkSDK.shared.loadImage(urlString: urlString, to: imageView)
    }
    
    @IBAction func openChat() {
        GapoWork.shared.presentChat()
    }

}

