//
//  DetailViewController.swift
//  Notes
//
//  Created by user1 on 2020/05/31.
//  Copyright © 2020 yama9112. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentsField: PlaceholderTextView!

    var realm: Realm!
    var note: Note!
    var uuid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentsField.placeHolder = "メモ"
        realm = try! Realm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if uuid != "" {
            note = realm.object(ofType: Note.self, forPrimaryKey: uuid)
        }
        
        if uuid == "" || note == nil {
            note = Note()
            titleField.text = "新規メモ"
        }
        else {
            titleField.text = note.title
            contentsField.text = note.contents
        }
    }

    @IBAction func tapSaveButton(_ sender: Any) {
        try! realm.write() {
            note.title = titleField.text!
            note.contents = contentsField.text!
            note.updateAt = Date()
            realm.add(note, update: .modified)
        }
    }

}
