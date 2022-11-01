//
//  ViewController.swift
//  MusicAPP
//
//  Created by Pooja Patil on 21/10/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(musicName : String) {
        let url = Bundle.main.url(forResource: musicName, withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func playMusic(_ sender: UIButton) {
        sender.alpha = 0.5 // to resuce opacity of button to 50%
        // sender.currentTitle /// to display title name if any ony if button style is set to deefault
        playSound(musicName: sender.currentTitle ?? "aa")
    }
    
}

