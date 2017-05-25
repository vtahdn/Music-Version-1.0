//
//  ViewController.swift
//  Music Version 1.0
//
//  Created by Viet Anh Doan on 5/25/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audio = AVAudioPlayer()
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        audio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: ".mp3")!))
        audio.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func volumeSlider(_ sender: UISlider) {
        audio.volume = sender.value
        sender.setThumbImage(UIImage(named: "thumb.png"), for: .normal)
        sender.setThumbImage(UIImage(named: "thumbHightLight.png"), for: .highlighted)
    }

    @IBAction func playButtonAction(_ sender: UIButton) {
        if !flag {
            audio.play()
            sender.setImage(UIImage(named: "pause.png"), for: .normal)
            flag = true
        }
        else {
            audio.pause()
            sender.setImage(UIImage(named: "play.png"), for: .normal)
            flag = false
        }
    }
}

