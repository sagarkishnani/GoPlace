//
//  HomeViewController.swift
//  GoPlace
//
//  Created by Aakash Kishnani on 9/11/21.
//

import UIKit

enum ProviderType: String {
    case basic
}


class HomeViewController: UIViewController {
    @IBOutlet weak var menuNavigation: UIButton!
    private let email: String
    private let provider: ProviderType
    
    
    init (email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
