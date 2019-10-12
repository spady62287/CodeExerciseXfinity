//
//  CharacterListViewController.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/5/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation
import UIKit

class CharacterListViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        loadData(tableView: self.tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - SearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard let currentCharacters = currentCharacters else {
            return
        }
        
        filteredCharacters = searchText.isEmpty ? currentCharacters : currentCharacters.filter({ (item: CharacterResult.relatedTopics) -> Bool in
            return item.getCharacterName().range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        
        tableView.reloadData()
    }
    
    //MARK: - Tableview Delegate & Datasource
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        if let characters = filteredCharacters {
            return characters.count
        }
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "CharacterCell")
        
        if let characters = filteredCharacters {
            let character = characters[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = character.getCharacterName()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let characters = filteredCharacters {
            let character = characters[(indexPath as NSIndexPath).row]
            
            let storyboard = UIStoryboard(name: "CharacterList", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "CharacterDetail") as! CharacterListDetailViewController
            controller.selectedCharacter = character
            controller.selectedCharacterName = character.getCharacterName()
            
            self.present(controller, animated: true, completion: nil)
            
        }
    }
}
