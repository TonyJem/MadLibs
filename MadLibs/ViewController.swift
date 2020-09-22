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
    
    fileprivate var selectedPlace: String {
      var place = "home"
      if rwDevConRadioButton.state == NSControl.StateValue.on {
        place = "RWDevCon"
      }
      else if threeSixtyRadioButton.state == NSControl.StateValue.on {
        place = "360iDev"
      }
      else if wwdcRadioButton.state == NSControl.StateValue.on {
        place = "WWDC"
      }
      return place
    }
    
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
    @IBOutlet weak var datePicker: NSDatePicker!

    @IBOutlet weak var rwDevConRadioButton: NSButton!
    @IBOutlet weak var threeSixtyRadioButton: NSButton!
    @IBOutlet weak var wwdcRadioButton: NSButton!
    @IBOutlet weak var yellCheck: NSButton!
    @IBOutlet weak var voiceSegmentedControl: NSSegmentedControl!
    @IBOutlet weak var resultTextField: NSTextField!
    @IBOutlet weak var imageView: NSImageView!
    
    
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
        
        // Set the date picker to display the current date
        datePicker.dateValue = Date()
        
        // Set the radio group's initial selection
        rwDevConRadioButton.state = NSControl.StateValue.on
        
        // set check button state
        yellCheck.state = NSControl.StateValue.off
        
        // Set the segmented control initial selection
        voiceSegmentedControl.selectedSegment = 1
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
        // 1
        let pastTenseVerb = pastTenseVerbTextField.stringValue

        // 2
        let singularNoun = singularNounCombo.stringValue
            
        // 3
        let amount = sliderContol.integerValue
            
        // 4
        let pluralNoun = pluralNouns[pluralNounPopup.indexOfSelectedItem]
            
        // 5
        let phrase = phraseTextView.string
            
        // 6
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let date = dateFormatter.string(from: datePicker.dateValue)
            
        // 7
        var voice = "said"
        if yellCheck.state == NSControl.StateValue.on {
          voice = "yelled"
        }
            
        // 8
        let sentence = "On \(date), at \(selectedPlace) a \(singularNoun) \(pastTenseVerb) \(amount) \(pluralNoun) and \(voice), \(phrase)"
            
        // 9
        resultTextField.stringValue = sentence
        imageView.image = NSImage(named: "face")

        // 10
        let selectedSegment = voiceSegmentedControl.selectedSegment
        let voiceRate = VoiceRate(rawValue: selectedSegment) ?? .normal
        readSentence(sentence, rate: voiceRate)
        
        finalText.stringValue = sentence
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
        updateUI()
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        let sliderValue = sliderContol.integerValue
        sliderValueLabel.stringValue = "Slider value [\(sliderValue)]"
    }
    
    @IBAction func radioButtonChanged(_ sender: Any) {
    }
}

