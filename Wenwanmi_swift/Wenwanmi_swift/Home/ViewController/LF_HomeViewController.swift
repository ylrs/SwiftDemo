//
//  LF_HomeViewController.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/2.
//  Copyright © 2017年 YLRS. All rights reserved.
//
import HandyJSON
import UIKit
import ESPullToRefresh
class LF_HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var homeModel:HomeModel?
    var tableView:UITableView?
    var page:Int = 1
    var listArray = [Any]()
    var headerDic:NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //初始化tableView
        initTableView()
        
        // Do any additional setup after loading the view.
    }
    func loadHeaderData() {
        let param = ["type":"index"]
        
        weak var weakSelf = self
        NetWorkTool.getJsonData(url: HomeTemplate, requestParam: param, success: { (result:Dictionary) in
            weakSelf?.headerDic = result as NSDictionary
            weakSelf?.tableView?.reloadData()
        }) { (error) in
            
        }
    }
    func loadData(refresh:kRefreshData) {
        
        switch refresh{
        case .kRefreshNew:
            page = 1
            break;
        case .kRefreshMore:
            page = page + 1
            break;
        }
        
        let pageString = String(format:"%i",page)

        let param = ["type":"midier","page":pageString,"mid":"82"]

        weak var weakSelf = self
        NetWorkTool.getJsonData(url: HomeURL, requestParam: param, success: { (result:Dictionary) in

            weakSelf?.homeModel = HomeModel.deserialize(from: result)!
            
            let count:Int = (weakSelf?.homeModel?.list?.count)!
            let topicArray:Array<Any> = (weakSelf?.homeModel?.list!)!
            switch refresh{
            case .kRefreshNew:
                if count > 0 {
                    weakSelf?.listArray.removeAll()
                    weakSelf?.listArray += topicArray
                }
                weakSelf?.tableView?.es.stopPullToRefresh()
               
                break
            case .kRefreshMore:
            
                weakSelf?.listArray += topicArray
                weakSelf?.tableView?.es.stopLoadingMore()
                
                break
            }
            
            weakSelf?.tableView?.reloadData()
            
        }) { (error) in
            print(error)
        }

    }
    func initTableView(){
        let tableView:UITableView = UITableView(frame:CGRect(x:0,y:64,width:kScreenWidth,height:kScreenHeight-64-50) , style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        let nib = UINib(nibName:"HomeTableCell",bundle:nil)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableCell")
        
        self.tableView?.es.addPullToRefresh {
            self.loadData(refresh: kRefreshData.kRefreshNew)
        }
        
        self.tableView?.es.addInfiniteScrolling {
            self.loadData(refresh: kRefreshData.kRefreshMore)
        }
        
        self.loadHeaderData()
        self.tableView?.es.startPullToRefresh()
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.estimatedSectionHeaderHeight = 0
            tableView.estimatedSectionFooterHeight = 0
        }
        else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if homeModel != nil{
            return listArray.count
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HomeTableCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        
        let topicModel:TopicModel = listArray[indexPath.row] as! TopicModel
        
        cell.setData(model: topicModel)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        if (headerDic != nil) {
            let list:NSArray = headerDic!["list"] as! NSArray
            let header:NSDictionary = list[0] as! NSDictionary
            let images:NSArray = header["sub"] as! NSArray
            
            var imageArray:[GLImageModel] = []
            for i in 0..<images.count{
                let imageDic:NSDictionary = images[i] as! NSDictionary
                let imageURL:String = imageDic["img"] as! String
                imageArray.append(GLImageModel(imageURL,type:.url))
            }
            let circleView = GLLoopView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 150))
            circleView.imageModelArray = imageArray
            circleView.timeInterval = 5
            view.addSubview(circleView)
            circleView.clickLoopViewClosure = { currentindex in
                print(currentindex)
            }
        }
        
        return view
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
