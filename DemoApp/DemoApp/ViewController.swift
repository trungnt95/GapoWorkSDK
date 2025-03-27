//
//  ViewController.swift
//  DemoApp
//
//  Created by Thang Le on 11/03/2025.
//

import UIKit
import GapoSDK

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var openChatButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        openChatButton.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.text = GapoWork.shared.getUserName()
    }
    
    private func didLogin() {
        label.text = GapoWork.shared.getUserName()
        openChatButton.isHidden = false
    }
    
    @IBAction func login() {
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnYXBvd29yay52biIsIm1zaXNkbiI6Ijg0OTc2Nzk2MDYwIiwiZnVsbE5hbWUiOiJCw7lpIFF1YW5nIFZpbmgiLCJhdmF0YXIiOiJodHRwczovL2ltYWdlLTEuZ2Fwb3dvcmsudm4vaW1hZ2VzLzI1OGE0MDI1LWZmM2UtNDJkMC05ZWNlLWM0NTFkN2FkM2UwNS5qcGVnIiwiYmlydGhkYXkiOiIxOTg5LTAzLTE4IiwiZ2VuZGVyIjoiMCIsImV4cCI6MTc0Mzk0MjUyNH0.wwnU6XtdFrv-7eXIkzeymJj3BgBHPtNX559HLH1sAYE"
        GapoWork.shared.exchangeToken(token: token) { [weak self] data in
            if data != nil {
                self?.didLogin()
            }
        }
    }
    
    @IBAction func presentChat() {
        GapoWork.shared.presentChat()
    }

}

