//
//  Note.swift
//  iNote
//
//  Created by Janice Kartika on 1/18/18.
//  Copyright © 2018 Bukalapak. All rights reserved.
//

import UIKit

class Note: NSObject {
    var title: String = ""
    var content: String = ""
    var image: UIImage?
    
    init(title: String = "", content: String = "", image: UIImage? = nil) {
        self.title = title
        self.content = content
        self.image = image
    }
    
    func initWithMockData() {
        title = "Note Title"
        content = "Note content here. What do you want to write?"
        image = UIImage(named: "ic_bl")
    }
}
