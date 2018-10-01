//
//  ViewController.swift
//  ScrollViewWithKeyboard
//
//  Created by Godfrey Bagley-Clarke on 01/10/2018.
//  Copyright © 2018 Godfrey Bagley-Clarke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.buttonBottomConstraint.constant = keyboardSize.height + 20
            self.view.layoutIfNeeded()
            self.scrollView.scrollRectToVisible((self.textField.frame), animated: true)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            self.buttonBottomConstraint.constant = 20
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func closeKeyboard(_ sender: Any) {
        textField.resignFirstResponder()
    }
}

