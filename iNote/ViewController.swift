//
//  ViewController.swift
//  iNote
//
//  Created by Janice Kartika on 1/18/18.
//  Copyright © 2018 Bukalapak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var notes: [Note] = []
    var gridLayout: GridHelper = GridHelper(numberOfColumns: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "iNote"
        collectionView.register(UINib(nibName: "NoteCell", bundle: nil), forCellWithReuseIdentifier: "NoteCell")
        collectionView.collectionViewLayout = gridLayout
        
        let note: Note = Note()
        note.initWithMockData()
        notes.append(note)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NoteCollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "NoteCell", for: indexPath) as! NoteCollectionViewCell
        let note: Note = notes[indexPath.item]
        
        cell.noteTitle.text = note.title
        cell.noteContent.text = note.content
        cell.noteImage.image = note.image
        
        return cell
    }
}
