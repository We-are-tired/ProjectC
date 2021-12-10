//
//  Audio.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/12/08.
//

// 無理！！！！！！！！！

import UIKit
import SwiftUI
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

class Audio {
    let play = Music()
    func playMusic(order:String) {
        if order == "cloud.rain.fill" {
            play.rainPlay()
            print(order+"：音楽")
        } else if order == "flame.fill" {
            play.flamePlay()
            print(order+"：音楽")
        } else {
            play.boltPlay()
            print(order+"：音楽")
        }
    }
    
    func stopMusic() {
//        rainPlayer.stop()
//        flamePlayer.stop()
//        boltPlayer.stop()
    }
}

