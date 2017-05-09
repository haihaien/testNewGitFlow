//
//  ViewController.swift
//  SwiftTest
//
//  Created by 张阳浩 on 17/4/19.
//  Copyright © 2017年 张阳浩. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView = UITableView()
    var dataSoruce = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scalary = (3,20)
        
        switch scalary {
        case (0..<5,let second) where second<10:
            print("小\(second)")
        case (0..<5,let second) where second>30:
            print("da ")
        default:
            print("other")
        }
        let kk = "dasdas"
        self.test()
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.dataSoruce = ["大叔大婶大所多撒","大声道那手机开发环境卡是否健康收到回复就开始对方返回急速卡迪夫舒服哈时间快递费发生的进口粉红色款到发货卡萨","dadsdasdasadsa啊发顺丰就卡死的房价哈开发环境水电费就是东方航空水电费扣水电费水电费好看教案东方航空收到回复快递费苏菲的世界快递费几十块东方航空是否健康水电费好客山东","搭建撒大声地空间啊富士康的浪费你是电脑法律手段"]
        self.tableView.reloadData()
        let vc = BaseViewController()
        let testVC = testViewController()
        
        self.addChildViewController(vc)
        self.addChildViewController(testVC)
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSoruce.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        print(UITableViewAutomaticDimension)
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?TableViewCell
        let title = self.dataSoruce[indexPath.row]
        cell?.contentLable.text = title
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let tansation = CATransition()
        tansation.duration = 1
        tansation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        tansation.type = kCATransitionPush
        tansation.subtype = kCATransitionFromRight
        self.view.window?.layer.add(tansation, forKey: "kTransitionAnimation")
        let vc = BaseViewController()
        self.present(vc, animated: false) { 
            
        }
        
        
        
        
    }
    
    func test()  {
        defer {
            print("运行完了")
        }
        for value in 1...10 {
            print(value)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

