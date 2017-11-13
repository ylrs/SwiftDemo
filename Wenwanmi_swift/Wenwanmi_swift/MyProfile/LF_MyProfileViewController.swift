//
//  LF_MyProfileViewController.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/2.
//  Copyright © 2017年 YLRS. All rights reserved.
//

import UIKit

class LF_MyProfileViewController: UIViewController {

    var scrollView    :UIScrollView?  = UIScrollView()
    var avatarImage   :UIImageView?   = UIImageView()
    var headerView    :UIView?        = UIView()
    var orderView     :UIView?        = UIView()
    var templeteView  :UIView?        = UIView()
    var nameLabel     :UILabel?       = UILabel()
    var levelLabel    :UILabel?       = UILabel()
    var topicsLabel   :UILabel?       = UILabel()
    var followLabel   :UILabel?       = UILabel()
    var followerLabel :UILabel?       = UILabel()
    var collectLabel  :UILabel?       = UILabel()

    var userInfo:User?
    var templeteArray:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        
        initScrollView()
        
        initHeaderView()
        
        initTempleteView()
        
        getUserInfo()
        
        getTemplete()
        // Do any additional setup after loading the view.
    }

    func initScrollView() {
        scrollView?.backgroundColor = UIColor.white
        scrollView?.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-50);
        self.view.addSubview(scrollView!)
        
        if #available(iOS 11.0, *) {
            scrollView?.contentInsetAdjustmentBehavior = .never
        }
    }
    
    func initHeaderView() {
        
        headerView?.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 170+45+80)
        scrollView?.addSubview(headerView!)
        
        let view = UIView()
        view.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 170)
        view.backgroundColor = RGBColor(100,75,70)
        headerView?.addSubview(view)
        
        avatarImage?.backgroundColor = UIColor.red
        avatarImage?.layer.cornerRadius = 25
        avatarImage?.layer.masksToBounds = true
        avatarImage?.layer.borderColor = UIColor.white.cgColor
        avatarImage?.layer.borderWidth = 1
        view.addSubview(avatarImage!)
        
        nameLabel?.font = UIFont.systemFont(ofSize: 15)
        nameLabel?.textColor = UIColor.white
        nameLabel?.textAlignment = NSTextAlignment.left
        view.addSubview(nameLabel!)
        
        levelLabel?.font = UIFont.italicSystemFont(ofSize: 11)
        levelLabel?.textColor = UIColor.white
        levelLabel?.textAlignment = NSTextAlignment.center
        levelLabel?.backgroundColor = RGBColor(255, 100, 100)
        levelLabel?.layer.cornerRadius = 7.5
        levelLabel?.layer.masksToBounds = true
        view.addSubview(levelLabel!)

        topicsLabel?.font = UIFont.systemFont(ofSize: 13)
        topicsLabel?.textColor = UIColor.white
        topicsLabel?.textAlignment = NSTextAlignment.center
        topicsLabel?.numberOfLines = 0
        view.addSubview(topicsLabel!)
        
        followLabel?.font = UIFont.systemFont(ofSize: 13)
        followLabel?.textColor = UIColor.white
        followLabel?.textAlignment = NSTextAlignment.center
        followLabel?.numberOfLines = 0
        view.addSubview(followLabel!)

        followerLabel?.font = UIFont.systemFont(ofSize: 13)
        followerLabel?.textColor = UIColor.white
        followerLabel?.textAlignment = NSTextAlignment.center
        followerLabel?.numberOfLines = 0
        view.addSubview(followerLabel!)

        collectLabel?.font = UIFont.systemFont(ofSize: 13)
        collectLabel?.textColor = UIColor.white
        collectLabel?.textAlignment = NSTextAlignment.center
        collectLabel?.numberOfLines = 0
        view.addSubview(collectLabel!)

        let width:CGFloat  = kScreenWidth/4.0
        let height:CGFloat = 70.0

        let xian1:UIView = UIView()
        xian1.backgroundColor = UIColor.white
        view.addSubview(xian1)
        
        let xian2:UIView = UIView()
        xian2.backgroundColor = UIColor.white
        view.addSubview(xian2)
        
        let xian3:UIView = UIView()
        xian3.backgroundColor = UIColor.white
        view.addSubview(xian3)
        
        let orderTitle:UILabel = UILabel()
        orderTitle.font = UIFont.systemFont(ofSize: 15)
        orderTitle.textColor = RGBColor(50,50,50)
        orderTitle.text = "我的订单"
        headerView?.addSubview(orderTitle)
        
        let xian4:UIView = UIView()
        xian4.backgroundColor = RGBColor(235,235,235)
        headerView?.addSubview(xian4)

        orderView?.backgroundColor = UIColor.white
        headerView?.addSubview(orderView!)
        
        avatarImage?.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY).offset(-20);
            make.size.equalTo(CGSize.init(width: 50, height: 50))
            make.left.equalTo(15)
        }
        
        nameLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo((avatarImage?.snp.centerY)!);
            make.size.equalTo(CGSize.init(width: kScreenWidth-50, height: 20))
            make.left.equalTo((avatarImage?.snp.right)!).offset(15)
        })
        
        levelLabel?.snp.makeConstraints { (make) in
            make.left.equalTo((nameLabel?.snp.right)!).offset(10)
            make.centerY.equalTo((nameLabel?.snp.centerY)!)
            make.width.equalTo(50)
            make.height.equalTo(15)
        }

        topicsLabel?.snp.makeConstraints({ (make) in
            make.size.equalTo(CGSize.init(width: width, height: height))
            make.left.equalTo(0)
            make.bottom.equalTo(view.snp.bottom)
        })
        
        followLabel?.snp.makeConstraints({ (make) in
            make.size.equalTo(CGSize.init(width: width, height: height))
            make.left.equalTo(width)
            make.bottom.equalTo(view.snp.bottom)
        })
        
        followerLabel?.snp.makeConstraints({ (make) in
            make.size.equalTo(CGSize.init(width: width, height: height))
            make.left.equalTo(width*2)
            make.bottom.equalTo(view.snp.bottom)
        })

        collectLabel?.snp.makeConstraints({ (make) in
            make.size.equalTo(CGSize.init(width: width, height: height))
            make.left.equalTo(width*3)
            make.bottom.equalTo(view.snp.bottom)
        })

        xian1.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 1, height: 20))
            make.centerY.equalTo((topicsLabel?.snp.centerY)!)
            make.left.equalTo((topicsLabel?.snp.right)!)
        }
        
        xian2.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 1, height: 20))
            make.centerY.equalTo((followLabel?.snp.centerY)!)
            make.left.equalTo((followLabel?.snp.right)!)
        }

        xian3.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 1, height: 20))
            make.centerY.equalTo((followerLabel?.snp.centerY)!)
            make.left.equalTo((followerLabel?.snp.right)!)
        }

        orderTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.bottom)
            make.left.equalTo(15)
            make.size.equalTo(CGSize.init(width: kScreenWidth-30, height: 45))
        }
        
        xian4.snp.makeConstraints { (make) in
            make.top.equalTo(orderTitle.snp.bottom).offset(-0.5)
            make.left.equalTo(0)
            make.size.equalTo(CGSize.init(width: kScreenWidth, height: 0.5))
        }
        
        orderView?.snp.makeConstraints({ (make) in
            make.top.equalTo(xian4.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(80)
        })
    }
    
    func initTempleteView() {
        templeteView?.frame = CGRect.init(x: 0, y: (headerView?.frame.size.height)!, width: kScreenWidth, height: 300)
        templeteView?.backgroundColor = UIColor.white
        scrollView?.addSubview(templeteView!)
    }
    
    func getUserInfo() {
        
        weak var ws = self
        NetWorkTool.getJsonData(url: ProfileInfo, requestParam: [:], success: { (result:Dictionary) in

            ws?.userInfo = User.deserialize(from: result)
            ws?.updateUser()
            
        }) { (error) in
            
        }
    }
    
    func getTemplete() {
        weak var ws = self
        NetWorkTool.getJsonData(url: ProfileTemplete, requestParam: ["type":"me"], success: { (result:Dictionary) in
            
            ws?.templeteArray = result["list"] as! NSArray!
            ws?.updateOrderView()
            ws?.updateTemplete()
            
        }) { (error) in
            
        }
    }
    
    func updateUser() {
        let avatarURL = URL.init(string: userInfo?.avatar as String!)
        avatarImage?.kf.setImage(with: avatarURL)
        nameLabel?.text = userInfo?.username
        
        let size:CGSize = nameLabel!.sizeThatFits(CGSize.init(width: Int.max, height: 20))
        nameLabel?.snp.updateConstraints { (make) in
            make.width.equalTo(size.width)
        }

        let level = String(format:"%i",(userInfo?.level)!)
        levelLabel?.text = "Lv." + level
        
        let levelSize = levelLabel?.sizeThatFits(CGSize.init(width: Int.max, height: 15))
        levelLabel?.snp.updateConstraints { (make) in
            make.width.equalTo((levelSize?.width)!+10)
        }
        
        topicsLabel?.attributedText   = self.getAttributed(content: String(format:"帖子\n%@",(userInfo?.posts)!))
        
        followLabel?.attributedText   = self.getAttributed(content: String(format:"关注\n%@",(userInfo?.follows)!))

        followerLabel?.attributedText = self.getAttributed(content: String(format:"粉丝\n%@",(userInfo?.followers)!))

        collectLabel?.attributedText  = self.getAttributed(content: String(format:"收藏\n%@",(userInfo?.favs)!))
    }
    
    func updateOrderView() {
        for item in (orderView?.subviews)! {
            item.removeFromSuperview()
        }
        
        let imageArray:NSArray = ["my_order_daifukuan","my_order_daifahuo","my_order_daishouhuo","my_order_daipingjia","my_order_tuihuo"];
        let nameArray:NSArray  = ["待付款","待发货","待收货","待评价","退货/理赔"];

        let width:CGFloat = kScreenWidth/5.0
        
        for i in 0..<imageArray.count {
            let icon:String = imageArray.object(at: i) as! String
            let name:String = nameArray.object(at: i) as! String
            
            let view:UIView = self.getOrderView(name: name, icon: icon)
            view.frame = CGRect.init(x:width*CGFloat(i) , y: 0, width: width, height: 80)
            orderView?.addSubview(view)
        }
    }
    
    func updateTemplete() {
        for item in (templeteView?.subviews)! {
            item.removeFromSuperview()
        }
        
        var height:CGFloat = 0
        
        for i in 0..<templeteArray!.count {
            let templete:NSDictionary = (templeteArray?.object(at: i) as! NSDictionary?)!
            
            let xian:UIView = UIView()
            xian.backgroundColor = RGBColor(235,235,235)
            xian.frame = CGRect.init(x: 0, y: height, width: kScreenWidth, height: 10)
            templeteView?.addSubview(xian)
            
            height += 10
            
            let modules:NSArray = templete.object(forKey: "modules") as! NSArray
            let viewWidth:CGFloat  = kScreenWidth/4
            let viewHeight:CGFloat = 65
            for j in 0..<modules.count{
                
                let module:NSDictionary = modules.object(at: j) as! NSDictionary
                let icon:String = module.object(forKey: "img") as! String
                let name:String = module.object(forKey: "title") as! String
                
                let index:Int = j%4
                let line:Int  = j/4
                
                let view:UIView = self.getModuleView(name: name, icon: icon)
                view.frame = CGRect.init(x: CGFloat(index)*viewWidth, y: height + CGFloat(line)*viewHeight, width: viewWidth, height: viewHeight)
                templeteView?.addSubview(view)
            }
            
            let moduleLine = (modules.count-1)/4+1
            
            height += CGFloat(moduleLine)*viewHeight
        }
        
        templeteView?.frame = CGRect.init(x: 0, y: (headerView?.frame.size.height)!, width: kScreenWidth, height: height)
        scrollView?.contentSize = CGSize.init(width: kScreenWidth, height:(headerView?.frame.size.height)! + (templeteView?.frame.size.height)!)
    }
    
    func getModuleView(name:String,icon:String) -> UIView {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.white
        
        let iconImg:UIImageView = UIImageView()
        iconImg.contentMode = UIViewContentMode.scaleAspectFill
        iconImg.clipsToBounds = true
        view.addSubview(iconImg)
        let url = URL.init(string: icon)
    
        iconImg.kf.setImage(with: url)
        
        let nameLabel:UILabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 11)
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = RGBColor(50,50,50)
        nameLabel.text = name
        view.addSubview(nameLabel)
        
        iconImg.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(CGSize.init(width: 32, height: 32))
        }

        nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(CGSize.init(width: kScreenWidth/4, height: 12))
        }
        
        return view
    }
    
    func getOrderView(name:String,icon:String) -> UIView {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.white
        
        let iconImg:UIImageView = UIImageView()
        iconImg.contentMode = UIViewContentMode.scaleAspectFit
        iconImg.clipsToBounds = true
        iconImg.image = UIImage.init(named: icon)
        view.addSubview(iconImg)
        
        let nameLabel:UILabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 11)
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = RGBColor(50,50,50)
        nameLabel.text = name
        view.addSubview(nameLabel)
        
        iconImg.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(CGSize.init(width: kScreenWidth/5, height: 20))
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(20+20+10)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(CGSize.init(width: kScreenWidth/5, height: 15))
        }
        
        return view
    }

    func getAttributed(content:String) -> NSMutableAttributedString {
        
        let attributed:NSMutableAttributedString = NSMutableAttributedString.init(string: content)
        
        let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = NSTextAlignment.center
        attributed.addAttribute(NSAttributedStringKey.paragraphStyle,value: paragraphStyle, range: NSMakeRange(0, (content.count)))
        
        return attributed
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
