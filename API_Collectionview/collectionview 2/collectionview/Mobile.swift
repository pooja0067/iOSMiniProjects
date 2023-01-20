//
//  Mobile.swift
//  collectionview
//
//  Created by Pooja Patil on 29/07/20.
//  Copyright © 2020 pooja. All rights reserved.
//

import Foundation
import UIKit

struct  Mobile: Equatable{
    let title : String
    let image : UIImage
    var amount: String
}

var mobiles : [Mobile] = [
    Mobile(title: "iphone7", image: UIImage(named: "iphone7.jpg")!, amount: "20"),
    Mobile(title: "iphone11", image: UIImage(named: "iphone11.jpeg")!, amount: "123"),
    Mobile(title: "oppoA5", image: UIImage(named: "oppoA5.jpeg")!, amount: "908"),
    Mobile(title: "oppoA31", image: UIImage(named: "oppoA31.jpg")!, amount: "567"),
    Mobile(title: "Redminote7", image: UIImage(named: "redminote7.jpg")!, amount: "500"),
    Mobile(title: "Redminote6", image: UIImage(named: "remi6.jpeg")!, amount: "900"),
    Mobile(title: "Vivo11", image: UIImage(named: "vivo11.jpeg")!, amount: "700"),
    Mobile(title: "Vivo", image: UIImage(named: "Vivo.jpg")!, amount: "300")]





        
