//
//  ShakingVC.swift
//  WallpapersLive
//
//  Created by Antony Kolesynskyi on 4/18/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

class ShakingVC: UIViewController {

    
    var defaultImage = "1_5"
    
    @IBOutlet weak var shakingLabel: UILabel!
    @IBOutlet weak var shakingImageView: UIImageView!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let image = shakingImageView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        print("Кнопка сохранения была нажата")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func randomImage() {
        
        let randomCategory = Int.random(in: 0 ..< 9)
        let randomImage = Int.random(in: 0 ..< 15)
        shakingImageView.image = UIImage(named: "\(randomCategory)_\(randomImage)")
        shakingLabel.alpha = 0
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            randomImage()
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func randomCalculation(_ sender: Any) {
        randomImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shakingImageView.image = UIImage(named: "\(defaultImage)")

    }
    
    
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Ошибка сохранения", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
        } else {
            let ac = UIAlertController(title: "Сохранено", message: "Ваша картинка была сохранена", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        
    }

    
}
