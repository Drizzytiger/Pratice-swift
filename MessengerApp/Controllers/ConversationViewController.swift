//
//  ViewController.swift
//  MessengerApp
//
//  Created by Drake Ewing on 9/28/21.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        super.viewDidAppear(animated)
        
        let isLoginIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        if !isLoginIn{
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated:false)

        }
        
    }

}

