//
//  LCADatePicker.swift
//  health_ios
//
//  Created by mac on 2017/9/22.
//  Copyright © 2017年 com.cnlod.cn. All rights reserved.
//

import UIKit

public class LCADatePicker: UIView {
    //默认显示的日期
   public var mode:UIDatePickerMode = .date {
        didSet{
            datePicker.datePickerMode = mode
        }
    }
   public var selectedDate:Date = Date() {
        didSet{
            datePicker.date = selectedDate
        }
    }
  public  var toolBarHeight:CGFloat = 49
  public  var datePickerHeight:CGFloat = 240
  public  func show() {
        isHidden = false
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let strongSelf = self else {
                return
            }
            var y:CGFloat = 0
            if UIDevice.current.lca_isIphoneX {
                y = strongSelf.lca_height - strongSelf.datePickerHeight - strongSelf.toolBarHeight
            }else {
                y = strongSelf.lca_height - strongSelf.datePickerHeight - strongSelf.toolBarHeight
            }
            strongSelf.setFrame(y: y)
        }
    }
    
   public func hidden() {
        isHidden = true
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let strongSelf = self else {
                return
            }
            let y = strongSelf.lca_height + strongSelf.datePickerHeight + strongSelf.toolBarHeight
            strongSelf.setFrame(y: y)
        }
    }
    public init(frame: CGRect,cancelAction:(()->())?,sureAction:@escaping ((Date)->())) {
        self.cancelAction = cancelAction
        self.sureAction = sureAction
        super.init(frame: frame)
        //利用这种方式设置透明度，子类不会有透明度
        backgroundColor = UIColor.black.withAlphaComponent(0.2)
        addSubview(toolBar)
        addSubview(datePicker)
        addSubview(bottomView)
        datePicker.date = selectedDate
        hidden()
    }
    
    fileprivate var cancelAction:(()->())?
    fileprivate var sureAction:((Date)->())
  
    private func setFrame(y:CGFloat) {
        let toolBarX:CGFloat = 0
        let toolBarY:CGFloat = y
        let toolBarWidth:CGFloat = bounds.size.width
        toolBar.frame = CGRect(x: toolBarX, y: toolBarY, width: toolBarWidth, height: toolBarHeight)
        let datePickerX:CGFloat = 0
        let datePickerY:CGFloat = toolBar.frame.maxY
        let datePickerWidth:CGFloat = bounds.size.width
        datePicker.frame = CGRect(x: datePickerX, y: datePickerY, width: datePickerWidth, height: datePickerHeight)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let y = bounds.size.height + toolBarHeight + datePickerHeight
        setFrame(y: y)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func cancel() {
        hidden()
        cancelAction?()
    }
    
    @objc fileprivate func ok() {
        sureAction(selectedDate)
    }
    
    @objc fileprivate func dateChanged(sender:UIDatePicker) {
        selectedDate = sender.date
    }
    
    fileprivate lazy var toolBar:LCAToolBar = { [unowned self] in
        let toolBar = LCAToolBar()
        toolBar.cancelButton.addTarget(self, action: #selector(LCADatePicker.cancel), for: .touchUpInside)
        toolBar.sureButton.addTarget(self, action: #selector(LCADatePicker.ok), for: .touchUpInside)
        return toolBar
    }()
    fileprivate lazy var datePicker:UIDatePicker = { [unowned self] in
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(LCADatePicker.dateChanged(sender:)), for: .valueChanged)
        datePicker.backgroundColor = UIColor.groupTableViewBackground
        return datePicker
    }()
    fileprivate lazy var bottomView:UIView = { [unowned self] in
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.groupTableViewBackground
        return bottomView
    }()
}
