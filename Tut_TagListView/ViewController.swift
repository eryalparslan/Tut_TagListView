//
//  ViewController.swift
//  Tut_TagListView
//
//  Created by ruroot on 9/30/18.
//  Copyright © 2018 Eray Alparslan. All rights reserved.
//

import UIKit
import TagListView
class ViewController: UIViewController {

    @IBOutlet weak var tagView: TagListView!
    @IBOutlet weak var mTextField: UITextField!

    var tagCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if mTextField.text != "" {
            tagView.addTag(mTextField.text!).onTap = { [weak self] tagView in
                self?.tagView.removeTagView(tagView)
                self?.tagCount -= 1
            }
            //tag added
            tagCount += 1
            
            //empty the textfield
            mTextField.text = ""
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

