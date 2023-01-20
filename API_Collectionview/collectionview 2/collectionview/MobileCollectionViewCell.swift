//
//  MobileCollectionViewCell.swift
//  collectionview
//
//  Created by Pooja Patil on 29/07/20.
//  Copyright © 2020 pooja. All rights reserved.
//

import UIKit
import Foundation


protocol CartDelegate {
    func updateCart(cell: MobileCollectionViewCell)
}

class MobileCollectionViewCell: UICollectionViewCell
{
    weak var mainClass: ViewController?
    var delegate: CartDelegate?
    var quantity: Int = 1
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var deleteItems: UIButton!
    @IBOutlet weak var mobileImage: UIImageView!
    @IBOutlet weak var mobileTitle: UILabel!
    
    func setUp(with mobile: Mobile) {
        mobileImage.image = mobile.image
        mobileTitle.text = mobile.title
        amount.text = mobile.amount
    }
    
    func setUpView() {
        addToCart.setTitle("", for: .normal)
        deleteItems.setTitle("", for: .normal)
    }

    func setButton(state: Bool) {
            addToCart.isSelected = state
            //addToCart.backgroundColor = (!addToCart.isSelected) ? .black : .red
        }
    
    
    @IBAction func addToCartItems(_ sender: UIButton) {
        setButton(state: !addToCart.isSelected)
        self.delegate?.updateCart(cell: self)
    }
    
    
    @IBAction func deleteItems(_ sender: UIButton) {
    }
    
}
