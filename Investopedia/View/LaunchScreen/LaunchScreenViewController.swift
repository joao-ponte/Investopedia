//
//  LaunchScreen.swift
//  Investopedia
//
//  Created by João Ponte on 14/09/2023.
//

import UIKit
import AVKit
import AVFoundation

class LaunchScreenViewController: UIViewController {

    let playerController = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        playVideo()
    }

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "InvestopediaOpenView", ofType:"mp4") else {
            debugPrint("InvestopediaOpenView.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))

        playerController.showsPlaybackControls = false
        playerController.player = player
        playerController.videoGravity = .resizeAspect
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: playerController.player?.currentItem)

        present(playerController, animated: true) {
            player.play()
        }
    }

    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Method, video is finished")
        // Perform the segue to navigate to the next view controller
        performSegue(withIdentifier: "showApp", sender: self)
    }
}
