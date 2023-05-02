//
//  structs.swift
//  CarouselCreditCard
//
//  Created by Emerson Sampaio on 02/05/23.
//

import Foundation
import UIKit

struct PagerDM {
    var img: String
    
    var image: UIImage{
        return UIImage(named: img) ?? UIImage(systemName: "trash")!
    }
}

struct FinanceOperation {
    var img: String
    
    var image: UIImage {
        return UIImage(named: img)!
    }
    
    var placeName: String
    var placeDetail: String
    var value: String
    var data: String
}
