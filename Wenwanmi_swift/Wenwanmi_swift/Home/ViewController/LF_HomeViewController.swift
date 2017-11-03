//
//  LF_HomeViewController.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/2.
//  Copyright © 2017年 YLRS. All rights reserved.
//
import HandyJSON
import UIKit
class LF_HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var homeModel:HomeModel?
    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //初始化tableView
        initTableView()
        
        //请求数据
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        weak var weakSelf = self
        let param = ["type":"post","page":"1","uid":"39"]
        NetWorkTool.getJsonData(url: HomeURL, requestParam: param, success: { (result:Dictionary) in
            
            weakSelf?.homeModel = HomeModel.deserialize(from: result)!
            
            weakSelf?.tableView?.reloadData()
            
        }) { (error) in
            print(error)
        }

    }
    func initTableView(){
        let tableView:UITableView = UITableView(frame:CGRect(x:0,y:0,width:kScreenWidth,height:kScreenHeight) , style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        let nib = UINib(nibName:"HomeTableCell",bundle:nil)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if homeModel != nil{
            return (homeModel?.list?.count)!
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HomeTableCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        
        let topicModel:TopicModel = (homeModel?.list![indexPath.row])!
        
        cell.setData(model: topicModel)
        
        return cell
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
