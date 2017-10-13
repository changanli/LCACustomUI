//
//  String + Extension.swift
//  doctoro2o_ios_hz
//
//  Created by mac on 16/7/21.
//  Copyright © 2016年 cnlod. All rights reserved.
//

import UIKit

public extension String {
    
    //MARK: 反转字符串
    func reverseWords(_ s: String) -> String {
        var chars = [Character](s)
        _reverse(&chars, 0, chars.count - 1)
        
        return String(chars)
    }

    //MARK:替换空字符
    func replaceNullCharacters()->String{
        let text = self.replacingOccurrences(of: " ", with: "")
        return text
    }
    
    //MARK: 反转数组
    fileprivate func _reverse(_ chars: inout [Character], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        
        while start < end {
            _swap(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    
    fileprivate func _swap(_ chars:inout [Character], _ p: Int, _ q: Int) {
        let temp = chars[p]
        chars[p] = chars[q]
        chars[q] = temp
    }
    
    //MARK: 检测是否是数字字符串  true 是， false不是
    func isStrNum(_ str: String) -> Bool {
        return Int(str) != nil
    }
    
    //MARK: 将字符串按字母排序(不考虑大小写)
    func sortStr(_ str: String) -> String {
        var chars = [Character](str)
        chars.sort(by: {$0 < $1})
        return String(chars)
    }


}
