//
//  Welcome.swift
//  Motivational Widget
//
//  Created by Junaid Mukadam on 25/04/21.
//

import UIKit
import Lottie
import KeychainSwift


class Welcome: UIViewController {

    @IBOutlet weak var welcome: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let LottiV = AnimationView()
        LottiV.frame = self.welcome.bounds
        LottiV.backgroundColor = .clear
        LottiV.animation = Animation.named("welcome")
        LottiV.contentMode = .scaleAspectFit
        LottiV.loopMode = .repeat(0)
        LottiV.play()
        
        DispatchQueue.main.async {
            self.welcome.addSubview(LottiV)
        }
        
        self.isModalInPresentation = true
        
        //604800000 week
        //1800000 half hour
        
        let keychain = KeychainSwift()
        if keychain.allKeys.count == 0 {
            keychain.set(String((Date().timeIntervalSince1970 * 1000) + 604800000), forKey: "time")
        }
        
       
        
    }

    @IBAction func nextAction(_ sender: Any) {
       
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name("TypeVC"), object: nil)
        }
    }


}
