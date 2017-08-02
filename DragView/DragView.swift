//
//  DragView.swift
//  DragView
//
//  Created by ashen on 2017/8/2.
//  Copyright © 2017年 http://www.devashen.com. All rights reserved.
//

import UIKit

@objc protocol DragViewDelegate {
    func dragviewDidSelect()
}


class DragView: UIImageView {

    private var startPoint:CGPoint!
    
    weak var delegate:DragViewDelegate?
    
    init(frame: CGRect, image:UIImage?) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.image = image
        //设置视图点击手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(didselect))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: mehtods
    
    func didselect() {
        self.delegate?.dragviewDidSelect()
    }
    
    // MARK: delegates
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //保存触摸起始点位置
        let point = touches.first!.location(in: self)
        startPoint = point
        //该view置于最前
        self.superview?.bringSubview(toFront: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //计算位移=当前位置-起始位置
        let point = touches.first!.location(in: self)
        let dx = point.x - startPoint.x
        let dy = point.y - startPoint.y
        
        //计算移动后的view中心点
        var newcenter = CGPoint.init(x:self.center.x + dx, y:self.center.y + dy);
        
        /* 限制用户不可将视图托出屏幕 */
        let halfx = self.bounds.midX
        
        //x坐标左边界
        newcenter.x = max(halfx, newcenter.x)
        //x坐标右边界
        newcenter.x = min((self.superview?.bounds.size.width)! - halfx, newcenter.x)
        
        //y坐标同理
        let halfy = self.bounds.midY
        newcenter.y = max(halfy, newcenter.y)
        newcenter.y = min((self.superview?.bounds.size.height)! - halfy, newcenter.y)
        
        //移动view  
        self.center = newcenter
    }

}
