//
//  ViewController.swift
//  MadLibs
//
//  Created by Anton on 2020-09-22.
//

import Cocoa

class ViewController: NSViewController {
    
    var madLibSentence = ""
    
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
    @IBOutlet weak var sliderValueLabel: NSTextField!
    @IBOutlet weak var sliderContol: NSSlider!
    @IBOutlet weak var finalText: NSTextField!
    
    
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
        
        sliderChanged(self)
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
    
    func updateUI(){
        let pastTenseVerb = pastTenseVerbTextField.stringValue
        let singularNoun = singularNounCombo.stringValue
        let pluralNoun = pluralNouns[pluralNounPopup.indexOfSelectedItem]
        let phrase = phraseTextView.string
        
        madLibSentence = "A \(singularNoun) \(pastTenseVerb) \(pluralNoun) and said, \(phrase)!"
        
        finalText.stringValue = madLibSentence
    }
    
    @IBAction func pastTenseVerbTextFieldChanged(_ sender: Any) {
        updateUI()
    }
    @IBAction func singularNounComboChanged(_ sender: Any) {
        updateUI()
    }
    @IBAction func pluralNounPopupChanged(_ sender: Any) {
        updateUI()
    }
    
    @IBAction func goButtonClicked(_ sender: Any) {
        print("\(madLibSentence)")
        readSentence(madLibSentence, rate: .normal)
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        let sliderValue = sliderContol.integerValue
        sliderValueLabel.stringValue = "Slider value [\(sliderValue)]"
    }
    
}

