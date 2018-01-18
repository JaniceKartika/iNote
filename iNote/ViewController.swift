//
//  ViewController.swift
//  iNote
//
//  Created by Janice Kartika on 1/18/18.
//  Copyright © 2018 Bukalapak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var notes: [Note] = []
    var gridLayout: GridHelper = GridHelper(numberOfColumns: 1)
    
    var isGrid: Bool = false
    
    var filteredNotes: [Note] {
        if let searchText = searchBar.text, !searchText.isEmpty {
            return notes.filter{ $0.title.contains(searchText) }
        }
        return notes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "iNote"
        collectionView.register(UINib(nibName: "NoteCell", bundle: nil), forCellWithReuseIdentifier: "NoteCell")
        collectionView.collectionViewLayout = gridLayout
        
        let note: Note = Note()
        note.initWithMockData()
        notes.append(note)
        
        let noteTemp: Note = Note(title: "Anda", content: "zanda")
        notes.append(noteTemp)
        
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Title", "Content"]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredNotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NoteCollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "NoteCell", for: indexPath) as! NoteCollectionViewCell
        let note: Note = filteredNotes[indexPath.item]
        
        cell.noteTitle.text = note.title
        cell.noteContent.text = note.content
        cell.noteImage.image = note.image
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope == 0 {
            notes.sort(by: sortByTitle)
        } else {
            notes.sort(by: sortByContent)
        }
        collectionView.reloadData()
    }
    
    func sortByTitle(first: Note, second: Note) -> Bool {
        return first.title < second.title
    }
    
    func sortByContent(first: Note, second: Note) -> Bool {
        return first.content < second.content
    }
    
    @IBAction func organizeClicked(_ sender: Any) {
        if isGrid {
            gridLayout = GridHelper(numberOfColumns: 1)
        } else {
            gridLayout = GridHelper(numberOfColumns: 2)
        }
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.setCollectionViewLayout(gridLayout, animated: true)
        isGrid = !isGrid
    }
    
    @IBAction func unwindToListNote(segue: UIStoryboardSegue) {
        if let vc: NewNoteViewController = segue.source as? NewNoteViewController {
            notes.append(Note(title: vc.titleTextView.text ?? "", content: vc.contentTextView.text))
            collectionView.reloadData()
        }
    }
}
