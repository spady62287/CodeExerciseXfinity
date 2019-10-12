//
//  CharacterListDetailViewController.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/5/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation
import UIKit

class CharacterListDetailViewController: BaseViewController {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    var selectedCharacter: CharacterResult.relatedTopics?
    var selectedCharacterName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let characterName = selectedCharacterName {
            characterNameLabel.text = characterName
        }
        
        if let character = selectedCharacter {
            characterDescriptionLabel.text = character.Text
            
            if let stringUrl = character.Icon?.URL {
                if let url = URL(string: stringUrl) {
                    loadIcon(url: url, imageView: self.characterImage)
                }
            }
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        
        characterImage.addGestureRecognizer(tap)
        characterImage.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true) {}
    }
}
