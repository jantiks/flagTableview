//
//  DetailViewController.swift
//  flagTableiew
//
//  Created by Tigran on 11/25/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedImage = imageName {
            title = selectedImage.uppercased()
            imageView.image = UIImage(named: selectedImage)
        }
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(barTapped))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func barTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
        else {
            print("there is no image")
            return
        }
        
        let ac = UIActivityViewController(activityItems: [image], applicationActivities: [])
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac,animated: true)
    }
   

}
