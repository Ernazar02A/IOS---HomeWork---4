//
//  DetailViewController.swift
//  IOS - HomeWork - 4
//
//  Created by MacBook Pro on 22/4/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var material: UILabel!
    @IBOutlet weak var dimensions: UILabel!
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var likeButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    @IBOutlet var stars: [UIImageView]!
    
    var card: Card?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateInfoCard()
        barItemUpdate()
    }
    
    func barItemUpdate() {
        likeButton.setBackgroundImage(UIImage(named: "like"), for: .normal, barMetrics: .default)
        saveButton.setBackgroundImage(UIImage(named: "save"), for: .normal, barMetrics: .default)
        likeButton.image = UIImage(named: "empty")
        saveButton.image = UIImage(named: "empty")
    }
    
    var likeChack = 1
    
    @IBAction func likeChange(_ sender: UIBarButtonItem) {
        if likeChack == 1 {
            sender.image = UIImage(systemName: "heart.fill")
            sender.tintColor = .red
            likeChack = 2
        } else {
            sender.image = UIImage(named: "empty")
            sender.tintColor = .red
            likeChack = 1
        }
    }
    
    var count = 1
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        if count == 5 {
            
        } else {
            count += 1
            amount.text = String(count)
        }
        starUp()
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        if count == 1 {
            
        } else {
            count -= 1
            amount.text = String(count)
        }
        for i in stars {
            i.image = UIImage(named: "Star_empty")
        }
        starUp()
    }
    
    func starUp() {
        for i in 0...count - 1 {
            stars[i].image
             = UIImage(named: "Star")
        }
    }
    
    func updateInfoCard() {
        image.image = UIImage(named: (card?.bigImage)!)
        name.text = card?.name
        price.text = card?.price
        room.text = card?.roomType
        color.text = card?.color
        material.text = card?.material
        dimensions.text = card?.dimensions
        weight.text = card?.weight
    }
}
