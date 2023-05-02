//
//  ViewController.swift
//  CarouselCreditCard
//
//  Created by Emerson Sampaio on 02/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: CarouselCardsView?
    
    override func loadView() {
        self.screen = CarouselCardsView()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

