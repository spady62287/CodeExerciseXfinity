//
//  BaseViewController.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/6/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var currentCharacters: [CharacterResult.relatedTopics]?
    var filteredCharacters: [CharacterResult.relatedTopics]!
    
    lazy var loadingView: UIView = { [unowned self] in
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = UIColor.black
        view.alpha = 0
        
        view.addSubview(self.loadingSpinner)
        self.loadingSpinner.backgroundColor = UIColor.clear
        self.loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        self.loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.loadingSpinner.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.loadingSpinner.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.view.addSubview(view)
        return view
        }()
    
    lazy var loadingSpinner: AnimatedLoader = AnimatedLoader()
    
    func loadData(tableView: UITableView) {
        showLoadingView()
        CharacterUtillity.characterList() { response in
            if let result = response.result {
                self.currentCharacters = result.RelatedTopics
                self.filteredCharacters = result.RelatedTopics
                self.hideLoadingView()
                tableView.reloadData()
            }
        }
    }
    
    func loadIcon(url: URL, imageView: UIImageView) {
        let iconRequest = CharacterIconRequest(endpoint: url)
        
        showLoadingView()
        CharacterUtillity.characterIcon(iconRequest) { response in
            DispatchQueue.main.async {
                if let imageData = response.data {
                    self.hideLoadingView()
                    if let image = UIImage.init(data: imageData) {
                        imageView.image = image
                    } else {
                        imageView.backgroundColor = UIColor.red
                    }
                }
            }
        }
    }
    
    func showLoadingView(animated: Bool = true, after delay: TimeInterval? = nil) {
        view.bringSubview(toFront: loadingView)
        loadingSpinner.start()
        UIView.animate(withDuration: animated ? 0.3 : 0.0, delay: delay ?? 0, options: [], animations: {
            self.loadingView.alpha = 1
        })
    }
    
    func hideLoadingView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.loadingView.alpha = 0
        }) { (completed) in
            self.loadingSpinner.stop()
        }
    }
}
