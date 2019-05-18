//
//  CollectionVC.swift
//  WallpapersLive
//
//  Created by Antony Kolesynskyi on 4/18/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit
var selectedItem = String()

class CollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutsOfCollectionView()
        myCollectionView.contentInsetAdjustmentBehavior = .never

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func layoutsOfCollectionView() {
        
        let itemWidthSize = UIScreen.main.bounds.width / 3 - 1.5
        let itemHeightSize = UIScreen.main.bounds.width / 2
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemWidthSize, height: itemHeightSize)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 2
        layout.headerReferenceSize.height = 230
        layout.headerReferenceSize.width = 225
        myCollectionView.collectionViewLayout = layout
        
    }

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableCell", for: indexPath) as! ReusableVC
        headerView.headerImageView.image = UIImage(named: "\(headerImage)")
        headerView.headerLabel.text = String("\(headerLabel)")
        //headerView.backgroundColor = #colorLiteral(red: 0.9406020045, green: 0.5628098845, blue: 0.5458678603, alpha: 1)
        return headerView
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCellVC
        
        if category == 0 {
            cell.collectionImageView.image = UIImage(named: "0_\(indexPath.row)")
        } else if category == 1 {
            cell.collectionImageView.image = UIImage(named: "1_\(indexPath.row)")
        } else if category == 2 {
            cell.collectionImageView.image = UIImage(named: "2_\(indexPath.row)")
        } else if category == 3 {
            cell.collectionImageView.image = UIImage(named: "3_\(indexPath.row)")
        } else if category == 4 {
            cell.collectionImageView.image = UIImage(named: "4_\(indexPath.row)")
        } else if category == 5 {
            cell.collectionImageView.image = UIImage(named: "5_\(indexPath.row)")
        } else if category == 6 {
            cell.collectionImageView.image = UIImage(named: "6_\(indexPath.row)")
        } else if category == 7 {
            cell.collectionImageView.image = UIImage(named: "7_\(indexPath.row)")
        } else if category == 8 {
            cell.collectionImageView.image = UIImage(named: "8_\(indexPath.row)")
        } else if category == 9 {
            cell.collectionImageView.image = UIImage(named: "9_\(indexPath.row)")
        }
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if category == 0 {
            selectedItem = "0_\(indexPath.row)"
        } else if category == 1 {
            selectedItem = "1_\(indexPath.row)"
        } else if category == 2 {
            selectedItem = "2_\(indexPath.row)"
        } else if category == 3 {
            selectedItem = "3_\(indexPath.row)"
        } else if category == 4 {
            selectedItem = "4_\(indexPath.row)"
        } else if category == 5 {
            selectedItem = "5_\(indexPath.row)"
        } else if category == 6 {
            selectedItem = "6_\(indexPath.row)"
        } else if category == 7 {
            selectedItem = "7_\(indexPath.row)"
        } else if category == 8 {
            selectedItem = "8_\(indexPath.row)"
        } else if category == 9 {
            selectedItem = "9_\(indexPath.row)"
        }
        performSegue(withIdentifier: "detailIdentifire ", sender: self)
        
    }

}
