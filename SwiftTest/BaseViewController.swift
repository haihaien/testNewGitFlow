//
//  BaseViewController.swift
//  SwiftTest
//
//  Created by 张阳浩 on 17/4/19.
//  Copyright © 2017年 张阳浩. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var CollectionView : UICollectionView!
    var layout : DynamicLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.view.backgroundColor = UIColor.red
        layout = DynamicLayout()
       
        CollectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        CollectionView.delegate = self;
        CollectionView.dataSource = self
        CollectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.view.addSubview(CollectionView)
        
        self.CollectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.layout.invalidateLayout()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?CollectionViewCell
        cell?.view.backgroundColor = UIColor.blue
        return cell!
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
