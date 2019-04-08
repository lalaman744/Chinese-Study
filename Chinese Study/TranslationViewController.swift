//
//  ViewController.swift
//  Chinese Study
//
//  Created by Josh Kleinschmidt on 4/2/19.
//  Copyright © 2019 Josh Kleinschmidt. All rights reserved.
//

import UIKit
import AVFoundation

class TranslationViewController: UIViewController {

    
    @IBOutlet var chineseCharacter: UILabel!
    @IBOutlet var pinyin: UILabel!
    @IBOutlet var englishTranslation: UILabel!
    
    var char: Char?
    
    let sythesizer = AVSpeechSynthesizer()
    let voice = AVSpeechSynthesisVoice(language: "zh-CN")
    let englishVoice = AVSpeechSynthesisVoice(language: "en-US")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let char = char else {return}
        
        chineseCharacter.text = char.chineseCharacter
        pinyin.text = char.pinyin
        englishTranslation.text = char.englishTranslation
    }


    @IBAction func readAloudTapped(_ sender: Any) {
        
        guard let char = char else {return}
        
        let audio = AVSpeechUtterance(string: char.chineseCharacter)
        audio.voice = voice
        sythesizer.speak(audio)
    }
    
    
    @IBAction func readAloudEnglishTapped(_ sender: Any) {
        
        guard let char = char else {return}
        
        let englishAudio = AVSpeechUtterance(string: char.englishTranslation)
        sythesizer.speak(englishAudio)
    }
    
    
}

