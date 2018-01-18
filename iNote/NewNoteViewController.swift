//
//  NewNoteViewController.swift
//  iNote
//
//  Created by Ridwan Arvihafiz on 18/1/18.
//  Copyright © 2018 Bukalapak. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {

    @IBOutlet weak var titleTextView: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToList",
            let vc: ViewController = segue.destination as? ViewController {
            vc.notes.append(Note(title: titleTextView.text ?? "", content: contentTextView.text))
        }
    }
}
