//
//  HomeTableCell.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/3.
//  Copyright © 2017年 YLRS. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class HomeTableCell: UITableViewCell {

    @IBOutlet weak var avatarImg    : UIImageView!
    @IBOutlet weak var nameLabel    : UILabel!
    @IBOutlet weak var levelLabel   : UILabel!
    @IBOutlet weak var contentLabel : UILabel!
    @IBOutlet weak var scrollView   : UIScrollView!
    @IBOutlet weak var xian: UIView!
    
    var topicModel: TopicModel?
    var imageWidth: CGFloat?
    func setData(model:TopicModel) {
        self.topicModel = model
        
        let url = URL.init(string: (model.user?.avatar)!)
        
        avatarImg.kf.setImage(with: url)
        
        nameLabel.text = model.user?.username
        
        let size:CGSize = nameLabel.sizeThatFits(CGSize.init(width: Int.max, height: 20))
        nameLabel.snp.updateConstraints { (make) in
            make.width.equalTo(size.width)
        }
        
        let level = String(format:"%i",(model.user?.level)!)
        levelLabel.text = "Lv." + level
        
        let levelSize = levelLabel.sizeThatFits(CGSize.init(width: Int.max, height: 15))
        levelLabel.snp.updateConstraints { (make) in
            make.width.equalTo(levelSize.width+10)
        }
        
        let attributed:NSMutableAttributedString = NSMutableAttributedString.init(string: model.content!)
        
        let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        
        attributed.addAttribute(NSAttributedStringKey.paragraphStyle,value: paragraphStyle, range: NSMakeRange(0, (model.content?.count)!))
        
        contentLabel.attributedText = attributed
        
        let contentSize = contentLabel.sizeThatFits(CGSize.init(width: kScreenWidth-20, height: CGFloat.greatestFiniteMagnitude))
        contentLabel.snp.updateConstraints { (make) in
            make.height.equalTo(contentSize.height)
        }
        
        configImages()
    }
    func configImages() {
        for item in scrollView.subviews{
            item.removeFromSuperview()
        }
        
        let pics:NSArray = (topicModel?.pics)!
        
        for i in 0..<pics.count {
            let picDic:NSDictionary = topicModel?.pics![i] as! NSDictionary
            let url = picDic["url"]
            
            let image = UIImageView()
            image.clipsToBounds = true
            image.contentMode = UIViewContentMode.scaleAspectFill
            image.frame = CGRect.init(x: CGFloat(i)*(imageWidth!+5), y: 0, width: imageWidth!, height: imageWidth!)
            scrollView.addSubview(image)
            
            let image_url = URL.init(string: url as! String)
            image.kf.setImage(with: image_url)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        imageWidth = (kScreenWidth-20-15)/3
        
        avatarImg.clipsToBounds = true
        avatarImg.contentMode = UIViewContentMode.scaleAspectFill
        avatarImg.layer.cornerRadius  = 20
        avatarImg.layer.masksToBounds = true
        
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        nameLabel.textColor = RGBColor(50,50,50)
        nameLabel.textAlignment = NSTextAlignment.left
        
        levelLabel.font = UIFont.italicSystemFont(ofSize: 11)
        levelLabel.textColor = UIColor.white
        levelLabel.textAlignment = NSTextAlignment.center
        levelLabel.backgroundColor = RGBColor(255, 100, 100)
        levelLabel.layer.cornerRadius = 7.5
        levelLabel.layer.masksToBounds = true
        
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.textColor = RGBColor(50,50,50)
        contentLabel.textAlignment = NSTextAlignment.left
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        xian.backgroundColor = RGBColor(200,200,200)
        
        avatarImg.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.top.left.equalTo(10)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImg.snp.right).offset(10)
            make.centerY.equalTo(avatarImg.snp.centerY)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        levelLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(10)
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.width.equalTo(50)
            make.height.equalTo(15)
        }

        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImg.snp.left)
            make.top.equalTo(avatarImg.snp.bottom).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.height.equalTo(100)
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(imageWidth!)
        }
        
        xian.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(0.5)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.bottom.equalTo(scrollView.snp.bottom).offset(10)
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.trailing.equalTo(self)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
