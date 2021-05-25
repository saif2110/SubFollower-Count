//
//  HowtoUseVC.swift
//  SubFollower Count
//
//  Created by Junaid Mukadam on 21/05/21.
//

import UIKit
import AVKit
import Player

class HowtoUseVC: UIViewController {
    
    @IBOutlet weak var playerView: UIView!
    
    var player = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoUrl: URL = Bundle.main.url(forResource: "tutorial", withExtension: "mp4")!
        
        player = AVPlayer(url: videoUrl)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.playerView.bounds
        self.playerView.layer.addSublayer(playerLayer)
        player.play()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(restartVideo),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: self.player.currentItem)
        
    }
    
    @objc func restartVideo() {
        player.pause()
        player.currentItem?.seek(to: CMTime.zero, completionHandler: { _ in
            self.player.play()
        })
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
