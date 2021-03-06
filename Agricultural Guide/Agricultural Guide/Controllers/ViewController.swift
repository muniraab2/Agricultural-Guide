//
//  ViewController.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 01/05/1443 AH.
//

import UIKit
import AVFoundation


// used UIViewController for play video

class ViewController: UIViewController  {
    
    @IBOutlet var videoBackgraound: UIView!
    
    @IBOutlet weak var labelView: UILabel!
    
    @IBOutlet weak var buttomView: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //func to play video
        
        playVideo ()
    }
    
    // func for size and play video
    
    func playVideo () {
        guard let path = Bundle.main.path(forResource: "intro", ofType: "mp4") else {
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoBackgraound.layer.addSublayer(playerLayer)
        
        player.play()
        
        //plus i put name of project and buttom to move another screan
        
        videoBackgraound.bringSubviewToFront(labelView)
        videoBackgraound.bringSubviewToFront(buttomView)
        
        
    }
    
}
