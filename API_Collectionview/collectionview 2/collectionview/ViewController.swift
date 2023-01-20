//
//  ViewController.swift
//  collectionview
//
//  Created by Pooja Patil on 29/07/20.
//  Copyright © 2020 pooja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var cart = Cart()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Mobile store"
        navigationItem.rightBarButtonItem = .init(image: UIImage.add, style: .plain, target: .none, action: #selector(goToCart))
        navigationItem.leftBarButtonItem = .init(image: UIImage.checkmark, style: .plain, target: .none, action: #selector(goToCart))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    @objc func goToCart() {
        print("Cart screen")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cart.updateCart()
            self.navigationItem.rightBarButtonItem?.title = "Checkout \(cart.items.count)"
            collectionView.reloadData()
    }
    
}

extension ViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mobiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MobileCollectionViewCell", for: indexPath) as! MobileCollectionViewCell
        cell.delegate = self
        cell.setButton(state: self.cart.contains(product: mobiles[indexPath.row]))
        cell.setUpView()
        cell.setUp(with: Mobile(title: mobiles[indexPath.row].title, image: mobiles[indexPath.row].image, amount:  "Amount:\(mobiles[indexPath.row].amount)"))

        //code to scroll infinite times of images
        if indexPath.row + 1 == mobiles.count {
            let newIndexPath = IndexPath(item: mobiles.count, section: 0)
            for i in 0...mobiles.count + 1  {
                mobiles.append(Mobile(title: mobiles[i].title, image: mobiles[i].image, amount: "Amount: \(mobiles[i].amount)"))
            }
            collectionView.insertItems(at: [newIndexPath])
        }//end
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}

extension ViewController: CartDelegate {
    
    // MARK: - CartDelegate
    func updateCart(cell: MobileCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        let product = mobiles[indexPath.item]

        //Update Cart with product
        cart.updateCart(with: product)
        print("cart items:", cart.add(product: product))
        print("amount", product.amount)
        
        self.navigationItem.rightBarButtonItem?.title = "Checkout \(cart.items.count)"
        
//        
    }
}
