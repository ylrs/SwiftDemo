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
    var nameLabel     :UILabel?       = UILabel()
    var levelLabel    :UILabel?       = UILabel()
    var topicsLabel   :UILabel?       = UILabel()
    var followLabel   :UILabel?       = UILabel()
    var followerLabel :UILabel?       = UILabel()
    var collectLabel  :UILabel?       = UILabel()

    var userInfo:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        
        initScrollView()
        
        initHeaderView()
        
        getUserInfo()
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
        let view = UIView()
        view.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 170)
        view.backgroundColor = RGBColor(100,75,70)
        scrollView?.addSubview(view)
        
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

    }
    
    
    func getUserInfo() {
        
        weak var ws = self
        NetWorkTool.getJsonData(url: ProfileInfo, requestParam: [:], success: { (result:Dictionary) in

            ws?.userInfo = User.deserialize(from: result)
            ws?.updateUser()
            
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
