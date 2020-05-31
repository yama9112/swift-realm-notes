//
//  DetailViewController.swift
//  Notes
//
//  Created by user1 on 2020/05/31.
//  Copyright © 2020 yama9112. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentsField: PlaceholderTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentsField.placeHolder = "メモ"
    }

}
