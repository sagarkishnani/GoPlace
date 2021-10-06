//
//  ConfirmationViewController.swift
//  GoPlace
//
//  Created by Aakash Kishnani on 5/10/21.
//

import UIKit

class ConfirmationViewController: UIViewController {
    @IBAction func clickBtnConfirm(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
