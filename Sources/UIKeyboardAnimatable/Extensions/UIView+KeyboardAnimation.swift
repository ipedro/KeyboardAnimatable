//
//  UIView+KeyboardAnimation.swift
//
//  Copyright (c) 2021 Pedro Almeida
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

public extension UIView {
    
    /// Animate changes to one or more views using the keyboard animation's duration and animation curve.
    ///
    /// - Parameters:
    ///   - notification: A notification containing keyboard animation information, others will be ignored.
    ///   - animations: The specified animation block to the animator.
    ///   - completion: An optional block to execute when the animations finish. This block takes the parameter `finalPosition`, which describes the position where the animations stopped. Use this value to specify whether the animations stopped at their starting point, their end point, or their current position.
    static func animate(withKeyboardNotification notification: Notification,
                        animations: @escaping (KeyboardAnimationInfo) -> Void,
                        completion: ((UIViewAnimatingPosition) -> Void)? = nil) {
        
        guard let keyboardAnimationInfo = notification.keyboardAnimationInfo else { return }
        
        let animator = UIViewPropertyAnimator(
            duration: keyboardAnimationInfo.duration,
            curve: keyboardAnimationInfo.curve
        )
        
        animator.addAnimations {
            animations(keyboardAnimationInfo)
        }
        
        if let completion = completion {
            animator.addCompletion(completion)
        }
        
        animator.startAnimation()
    }
}
