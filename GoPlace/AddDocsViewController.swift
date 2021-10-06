//
//  AddDocsViewController.swift
//  GoPlace
//
//  Created by Aakash Kishnani on 6/10/21.
//

import UIKit

class AddDocsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension AddDocsViewController {
    @IBAction func TapToClose(_ sender: Any) {
        self.view.endEditing(true)
    }
}

