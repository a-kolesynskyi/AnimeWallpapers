//
//  CategoryVC.swift
//  WallpapersLive
//
//  Created by Antony Kolesynskyi on 4/18/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

var category = 0
var headerImage = String()
var headerLabel = String()

class CategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let images = ["0_13","1_4","2_9","3_8","4_14","5_4","6_0","7_12","8_3","9_5"]
    
    let labelTopics = ["Ночной тон - сказочный тон. В каждой картинке ты сможешь найти вкрапления ночи. Но тебе придется поискать.","Лёгкая весна, солнце и свет. Качественный арт поднимет твоё настроение.","Закат и рассвет. Начало и конец. Все эти чувства переплетены в одной подборке.","Красочные виды помогают расслабится. Что может бысть более приятным.","Синий цвет является главным акцентом этой подборки. Тебе стоит узнать, что он прячет в себе, и что готов открыть своему наблюдателю.","Виды города, которые знают как умилить тебя. От таких артов сложно оторвать взор.","Арты, самой главной целью которых является - радовать Ваш глаз.","Такие спокойные и понимающее. Здесь ты найдешь множество прекрасных глаз, которые успокоят и поймут тебя.","Каждый из обьектов находящихся внутри, обьязательно будет стоять на твоём экране.","Качественная прорисовка и душа. Именно такие параметры мы установили для этой подборки.","Невероятно качественные анимации и арты. Просто наслаждайся.","Иногда тебе просто нужно постоять и посмотреть вдаль. Наша подборка поможет тебе найти то, что ты ищишь там, за горизонтом.  "]
   
    let titleTopics = ["Ночной тон","Лёгкая весна","Закат и рассвет","Краски природы","Синяя тайна","Городские виды","Нежная красота","Анимация с душой","Исусство анимации","Смотря в даль",]
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var randomButton: UIButton!
    
    @IBAction func randomAction(_ sender: Any) {
        performSegue(withIdentifier: "randomView", sender: self)
    }
    
    var parallaxOffsetSpeed: CGFloat = 120
    var cellHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.contentInsetAdjustmentBehavior = .never
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }
    
    var parallaxImageHeight: CGFloat {
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * self.myTableView.bounds.height ) - cellHeight) / 2
        return maxOffset + self.cellHeight
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryCellVC
        cell.categoriImageView.image = UIImage(named:"\(images[indexPath.row])")
        cell.categoryLabel.text = labelTopics[indexPath.row]
        cell.titleLabel.text = titleTopics[indexPath.row]

        return cell
    }
    
    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //let offsetY = myTableView.contentOffset.y
        for cell in myTableView?.visibleCells as! [CategoryCellVC] {
            cell.parallaxTopConstraint.constant = parallaxOffset(newOffsetY: myTableView.contentOffset.y, cell: cell)
        }
    }
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        category = indexPath.row
        headerImage = String(images[indexPath.row] + ".jpg")
        headerLabel = String(labelTopics[indexPath.row])
        performSegue(withIdentifier: "categoryCell", sender: self)
    }


}
