//
//  soundPlayer.swift
//  Ai animation
//
//  Created by jetz on 2024/07/21.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let spinData = NSDataAsset(name: "spinSound")!.data
    var spinPlayer : AVAudioPlayer!

    func spinPlay(){
        do {
            spinPlayer = try AVAudioPlayer(data: spinData)
            spinPlayer.play()
            print("Play spin sound")
        } catch {
            print("Error with spin sound")
        }
    }
}
