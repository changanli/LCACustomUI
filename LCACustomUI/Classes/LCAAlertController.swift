//
//  LCAAlertController.swift
//  Extensions
//
//  Created by mac on 2017/9/25.
//  Copyright © 2017年 com.cnlod.cn. All rights reserved.
//

import UIKit
import LCAExtension

//MARK:配置字体大小和颜色
public struct LCAAlertConfiguration {
    //标题
    var titleFont = UIFont.systemFont(ofSize: 16)
    var titleColor = UIColor(lca_hex:0x323232)
    //消息
    var messageFont:UIFont = UIFont.systemFont(ofSize: 14)
    var messageColor:UIColor = UIColor(lca_hex:0x323232)
    //取消
    var cancelColor:UIColor = UIColor(lca_hex:0x909090)
    //确定
    var okColor:UIColor = UIColor(lca_r: 38, lca_g: 150, lca_b: 251)
}

public class LCAAlertController: UIAlertController {
    
   public var configuration:LCAAlertConfiguration = LCAAlertConfiguration()
    //MARK:提示 我知道了
    public class func show(target:UIViewController,tip:String?,okAction:((_ action:UIAlertAction)->())?) {
        let vc = LCAAlertController(title: tip, message: nil, okTitle: "我知道了", okAction: { (okAct) in
            target.dismiss(animated: true, completion: {})
             okAction?(okAct)
        }, cancelTitle: nil, cancelAction: nil)
        target.present(vc, animated: true, completion: nil)
    }
    
    //MARK:采用默认样式
   public convenience init(title:String?,message:String?,okAction:((_ action:UIAlertAction)->())?,cancelAction:((_ action:UIAlertAction)->())?) {
        self.init(title: title, message: message, configuration: LCAAlertConfiguration(), okAction: okAction, cancelAction: cancelAction)
    }
    //MARK: 确定 取消
   public convenience init(title:String?,message:String?,configuration:LCAAlertConfiguration,okAction:((_ action:UIAlertAction)->())?,cancelAction:((_ action:UIAlertAction)->())?) {
        self.init(title: title, message: message, configuration: configuration, okTitle: "确定", okAction: okAction, cancelTitle: "取消", cancelAction: cancelAction)
    }
    //MARK:
  public convenience init(title:String?,message:String?,okTitle:String?,okAction:((_ action:UIAlertAction)->())?,cancelTitle:String?,cancelAction:((_ action:UIAlertAction)->())?) {
        self.init(title: title, message: message, configuration: LCAAlertConfiguration(), okTitle: okTitle, okAction: okAction, cancelTitle: cancelTitle, cancelAction: cancelAction)
    }
    
   public convenience init(title:String?,message:String?,configuration:LCAAlertConfiguration,okTitle:String?,okAction:((_ action:UIAlertAction)->())?,cancelTitle:String?,cancelAction:((_ action:UIAlertAction)->())?) {
        self.init(title: title, message: message, preferredStyle: .alert)
        self.configuration = configuration
        if let tle = title {
            let attributeTitle = NSMutableAttributedString(string:tle)
            attributeTitle.addAttribute(NSAttributedStringKey.font, value: configuration.titleFont, range: NSMakeRange(0, tle.count))
            attributeTitle.addAttribute(NSAttributedStringKey.foregroundColor, value: configuration.titleColor, range: NSMakeRange(0, tle.count))
            setValue(attributeTitle, forKey: "attributedTitle")
        }
        if let msg = message {
            let attributeMessage = NSMutableAttributedString(string:msg)
            attributeMessage.addAttribute(NSAttributedStringKey.font, value: configuration.messageFont, range: NSMakeRange(0, msg.count))
            attributeMessage.addAttribute(NSAttributedStringKey.foregroundColor, value: configuration.messageColor, range: NSMakeRange(0, msg.count))
            setValue(attributeMessage, forKey: "attributedMessage")
        }
        if let okTitle = okTitle {
            let ok = UIAlertAction(title: okTitle, style: .default) { (action) in
                okAction?(action)
            }
            ok.setValue(configuration.okColor, forKey: "_titleTextColor")
             addAction(ok)
        }
        
        if let cancelTitle = cancelTitle {
            let cancel = UIAlertAction(title: cancelTitle, style: .cancel) { (action) in
                cancelAction?(action)
            }
            cancel.setValue(configuration.cancelColor, forKey: "_titleTextColor")
            addAction(cancel)
        }
    }
    
  public  convenience init(attributeTitle:NSMutableAttributedString?,attributeMessage:NSMutableAttributedString?,okColor:UIColor,okTitle:String?,okAction:((_ action:UIAlertAction)->())?,cancelColor:UIColor,cancelTitle:String?,cancelAction:((_ action:UIAlertAction)->())?) {
        self.init(title: attributeTitle?.string, message: attributeMessage?.string, preferredStyle: .alert)
        if let attributeTitle = attributeTitle {
            setValue(attributeTitle, forKey: "attributedTitle")
        }
        if let attributeMessage = attributeMessage {
              setValue(attributeMessage, forKey: "attributedMessage")
        }
        if let okTitle = okTitle {
            let ok = UIAlertAction(title: okTitle, style: .default) { (action) in
                okAction?(action)
            }
            ok.setValue(okColor, forKey: "_titleTextColor")
            addAction(ok)
        }
        if let cancelTitle = cancelTitle {
            let cancel = UIAlertAction(title: cancelTitle, style: .cancel) { (action) in
                cancelAction?(action)
            }
            cancel.setValue(cancelColor, forKey: "_titleTextColor")
            addAction(cancel)
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
