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


}

