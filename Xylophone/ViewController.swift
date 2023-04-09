//
//  ViewController.swift
//  Xylophone
//
//  Created by Владислав Резник on 09.04.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func keyPressed(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        playSound(title: title)
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
    
    func playSound(title: String) {
        guard let url = Bundle.main.url(forResource: "Sounds/\(title)", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

