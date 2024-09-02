//
//  soundPlayer.swift
//  Ai animation
//
//  Created by jetz on 2024/07/21.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let VirtualInsanityData = NSDataAsset(name: "VirtualInsanity")!.data
    var VirtualInsanityDataPlayer : AVAudioPlayer!
    
    func musicPlay(){
        do {
            VirtualInsanityDataPlayer = try AVAudioPlayer(data: VirtualInsanityData)
            VirtualInsanityDataPlayer.volume = 0 // 初期音量を0に設定
            VirtualInsanityDataPlayer.play()
            fadeIn()
        } catch {
            print("VirtualInsanityDataPlayerでエラーが発生")
        }
    }
    private func fadeIn() {
        var currentVolume: Float = 0
        let targetVolume: Float = 1
        let fadeDuration: TimeInterval = 10 // フェードインにかける時間（秒）
        let fadeStep: Float = 0.05 // フェードステップ量
        let fadeStepDuration: TimeInterval = fadeDuration / Double(targetVolume / fadeStep)
        
        Timer.scheduledTimer(withTimeInterval: fadeStepDuration, repeats: true) { timer in
            if currentVolume < targetVolume {
                currentVolume += fadeStep
                self.VirtualInsanityDataPlayer.volume = currentVolume
            } else {
                self.VirtualInsanityDataPlayer.volume = targetVolume
                timer.invalidate()
            }
        }
    }
}
