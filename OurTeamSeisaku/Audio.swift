//
//  Audio.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/12/08.
//

import UIKit
import AVFoundation

class Music: NSObject {
    let rainData = NSDataAsset(name: "rain")!.data
    var rainPlayer: AVAudioPlayer!
    func rainPlay() {do {
        rainPlayer = try AVAudioPlayer(data: rainData)
        rainPlayer.play()
    } catch {print("rain エラー")}}
    
    let flameData = NSDataAsset(name: "flame")!.data
    var flamePlayer: AVAudioPlayer!
    func flamePlay() {do {
        flamePlayer = try AVAudioPlayer(data: flameData)
        flamePlayer.play()
    } catch {print("flame エラー")}}
    
    let boltData = NSDataAsset(name: "bolt")!.data
    var boltPlayer: AVAudioPlayer!
    func boltPlay() {do {
        boltPlayer = try AVAudioPlayer(data: boltData)
        boltPlayer.play()
    } catch {print("bolt エラー")}}
}

struct Audio {
    //let play = Music()
    func playMusic(order:String) {
        print(order+"：音楽")
        if order == "cloud.rain.fill" {
            Music().rainPlay()
        } else if order == "flame.fill" {
            Music().flamePlay()
        } else {
            Music().boltPlay()
        }
    }
    
    func stopMusic() {
//        rainPlayer.stop()
//        flamePlayer.stop()
//        boltPlayer.stop()
    }
}

