//
//  ViewController.swift
//  CustomiseGridView
//
//  Created by Appinventiv Mac on 07/03/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var images :[UIImage] = [UIImage(named:"1")!,UIImage(named:"a")!,UIImage(named:"3")!,UIImage(named:"b")!,UIImage(named:"c")!,UIImage(named:"6")!,UIImage(named:"7")!,UIImage(named:"8")!,UIImage(named:"9")!,UIImage(named:"10")!,UIImage(named:"11")!,UIImage(named:"12")!,UIImage(named:"d")!,UIImage(named:"14")!,UIImage(named:"15")!,UIImage(named:"e")!,UIImage(named:"17")!,UIImage(named:"18")!,UIImage(named:"19")!,UIImage(named:"2")!]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? MyLayout {
            layout.delegate = self
        }
        collectionView.delegate=self
        collectionView.dataSource=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? MyCell {
        cell.imageView.image = images[indexPath.item]
        return cell
        }else{
            let cell = UICollectionViewCell()
             return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        if indexPath.item == 0 {
           return CGSize(width: (width-15)/2, height: 270)
        }else{
            return CGSize(width: (width-15)/2, height: 95)
        }
        
    }

}

extension ViewController: MyLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        print("Height : \(images[indexPath.item].size.height)")
        print("Width : \(images[indexPath.item].size.width)")
        print("----")
        return images[indexPath.item].size.height
        
    }
}



