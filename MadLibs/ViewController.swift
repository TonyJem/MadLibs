//
//  ViewController.swift
//  MadLibs
//
//  Created by Anton on 2020-09-22.
//

import Cocoa

class ViewController: NSViewController {
    
    fileprivate let singularNouns = ["dog", "muppet", "ninja", "pirate", "dev" ]
    
    fileprivate let pluralNouns = ["tacos", "rainbows", "iPhones", "gold coins"]
    
    fileprivate enum VoiceRate: Int  {
        case slow
        case normal
        case fast
        
        var speed: Float {
            switch self {
            case .slow:
                return 60
            case .normal:
                return 175;
            case .fast:
                return 360;
            }
        }
    }
    
    fileprivate let synth = NSSpeechSynthesizer()
    
    @IBOutlet weak var pastTenseVerbTextField: NSTextField!
    @IBOutlet weak var singularNounCombo: NSComboBox!
    @IBOutlet weak var pluralNounPopup: NSPopUpButton!
    @IBOutlet var phraseTextView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pastTenseVerbTextField.stringValue = "ate"
        
        singularNounCombo.removeAllItems()
        singularNounCombo.addItems(withObjectValues: singularNouns)
        singularNounCombo.selectItem(at: singularNouns.count - 1)
        
        pluralNounPopup.removeAllItems()
        pluralNounPopup.addItems(withTitles: pluralNouns)
        pluralNounPopup.selectItem(at: 0)
        
        phraseTextView.string = "Me coding Mac Apps!!!"
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    fileprivate func readSentence(_ sentence: String, rate: VoiceRate ) {
        synth.rate = rate.speed
        synth.stopSpeaking()
        synth.startSpeaking(sentence)
    }
    
    
    @IBAction func goButtonClicked(_ sender: Any) {
        
        let pastTenseVerb = pastTenseVerbTextField.stringValue
        let singularNoun = singularNounCombo.stringValue
        let pluralNoun = pluralNouns[pluralNounPopup.indexOfSelectedItem]
        let phrase = phraseTextView.string
        
        let madLibSentence = "A \(singularNoun) \(pastTenseVerb) \(pluralNoun) and said, \(phrase)!"
        
        print("\(madLibSentence)")
        
        readSentence(madLibSentence, rate: .normal)
    }
}

