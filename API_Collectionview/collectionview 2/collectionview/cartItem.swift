//
//  cartItem.swift
//  collectionview
//
//  Created by Pooja Patil on 12/09/22.
//  Copyright © 2022 pooja. All rights reserved.
//

import Foundation

class CartItem {
    var quantity : Int = 1
    var product : Mobile
    init(product: Mobile) {
        self.product = product
    }
}

class Cart {
    var items : [CartItem] = []
}

extension Cart {

var totalQuantity : Int {
   get { return items.reduce(0) { value, item in
       value + item.quantity
       }
   }
}
func updateCart(with pr: Mobile) {
   if !self.contains(product: pr) {
       self.add(product: pr)
   } else {
       self.remove(product: pr)
   }
}

func updateCart() {
   
   for item in self.items {
       if item.quantity == 0 {
           updateCart(with: item.product)
       }
   }
}

    func add(product: Mobile) {
        let item = items.filter { $0.product == product}
   
   if item.first != nil {
       item.first!.quantity += 1
       print("quanitiy", item.count)
   } else {
       items.append(CartItem(product: product))
   }
}
    
    func addTheAmount(product: Mobile) {
        let item = items.filter { $0.product == product }
        if item.first != nil {
            
        }
        
    }

func remove(product: Mobile) {
   guard let index = items.firstIndex(where: { $0.product == product }) else { return}
   items.remove(at: index)
}

func contains(product: Mobile) -> Bool {
   let item = items.filter { $0.product == product }
   return item.first != nil
    }
}
