//
//  DeailVC.swift
//  WallpapersLive
//
//  Created by Antony Kolesynskyi on 4/18/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

class DeailVC: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageView.image = UIImage(named: selectedItem)

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func saveButton(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        guard let image = mainImageView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        print("Кнопка сохранения была нажата")
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Ошибка сохранения", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
        } else {
            let ac = UIAlertController(title: "Сохранено", message: "Ваша картинка сохранилась", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        
    }

}
