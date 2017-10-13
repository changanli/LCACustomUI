//
//  LCAToolBar.swift
//  health_ios
//
//  Created by mac on 2017/9/22.
//  Copyright © 2017年 com.cnlod.cn. All rights reserved.
//

import UIKit

public class LCAToolBar: UIView {
    public var titleLabel:UILabel!
    public var cancelButton:UIButton!
    public var sureButton:UIButton!
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        backgroundColor = UIColor.white
        cancelButton = UIButton(title: "取消", titleColor:UIColor(lca_hex:0x909090), backgroundImage: nil, font: UIFont.systemFont(ofSize: 16), textAlignment: .center, target: nil, action:nil, controlEvent: .touchUpInside)
        sureButton = UIButton(title: "确定", titleColor: UIColor(lca_r: 55, lca_g: 142, lca_b: 248), backgroundImage: nil, font: UIFont.systemFont(ofSize: 16), textAlignment: .center, target: nil, action: nil, controlEvent: .touchUpInside)
        titleLabel = UILabel()
        titleLabel.textColor = UIColor(lca_hex:0x323232)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        addSubview(titleLabel)
        addSubview(cancelButton)
        addSubview(sureButton)
        
        setFrame()
    }
    
    private func setFrame() {
        let cancelX:CGFloat = 0
        let cancelY:CGFloat = 0
        let cancelWidth:CGFloat = 60
        let cancelHeight = lca_height
        cancelButton.frame = CGRect(x: cancelX, y: cancelY, width: cancelWidth, height: cancelHeight)
        let sureButtonWidth = cancelWidth
        let sureButtonHeight = lca_height
        let sureButtonX:CGFloat = self.lca_width - sureButtonWidth
        let sureButtonY:CGFloat = 0
        sureButton.frame = CGRect(x: sureButtonX, y: sureButtonY, width: sureButtonWidth, height: sureButtonHeight)
        let titleLabelX = cancelButton.frame.maxX
        let titleLabelY:CGFloat = 0
        let titleLabelWidth:CGFloat = sureButton.frame.minX - cancelButton.frame.maxX
        let titleLabelHeight:CGFloat = cancelHeight
        titleLabel.frame = CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelWidth, height: titleLabelHeight)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setFrame()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
