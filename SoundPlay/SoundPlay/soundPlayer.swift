//
//  soundPlayer.swift
//  Ai animation
//
//  Created by jetz on 2024/07/21.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    var cymbalPlayer : AVAudioPlayer!
    
    let guitarData = NSDataAsset(name: "guitarSound")!.data
    var guitarPlayer : AVAudioPlayer!
    
    func cymbalPlay(){
        do {
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            cymbalPlayer.play()
        } catch {
            print("シンバルでエラーが発生")
        }
    }
    
    func guitarPlay(){
        do {
            self.guitarPlayer = try AVAudioPlayer(data: guitarData)
            self.guitarPlayer.play()
        } catch {
            print("ギターでエラーが発生")
        }
    }
}
