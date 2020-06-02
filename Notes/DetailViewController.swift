//
//  DetailViewController.swift
//  Notes
//
//  Created by user1 on 2020/05/31.
//  Copyright © 2020 yama9112. All rights reserved.
//

import UIKit
import RealmSwift
import Toast

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentsField: PlaceholderTextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var realm: Realm!
    var note: Note!
    var uuid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
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
    
    @objc func textFieldEditingChanged(sender: UITextField) {
        saveButton.isEnabled = sender.text != ""
    }

    @IBAction func tapSaveButton(_ sender: Any) {
        
        try! realm.write() {
            note.title = titleField.text!
            note.contents = contentsField.text!
            note.updateAt = Date()
            realm.add(note, update: .modified)
        }
        
        self.view.makeToast("保存しました。", duration: 2.0, position: .center)
    }

}
