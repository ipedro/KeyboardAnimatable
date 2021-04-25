//
//  AnyHashable+Notifications.swift
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

extension AnyHashable {
    
    /// The key for an `NSNumber` object containing a double that identifies the duration of the animation in seconds.
    static var durationKey: AnyHashable { UIResponder.keyboardAnimationDurationUserInfoKey }
    
    /// The key for an `NSValue` object containing a `CGRect` that identifies the ending frame rectangle of the keyboard in screen coordinates. The frame rectangle reflects the current orientation of the device.
    static var frameKey: AnyHashable { UIResponder.keyboardFrameEndUserInfoKey }
    
    /// The key for an `NSNumber` object containing a UIView.AnimationCurve constant that defines how the keyboard will be animated onto or off the screen.
    static var curveKey: AnyHashable { UIResponder.keyboardAnimationCurveUserInfoKey }
    
    /// The key for an `NSNumber` object containing a Boolean that identifies whether the keyboard belongs to the current app. With multitasking on iPad, all visible apps are notified when the keyboard appears and disappears. The value of this key is true for the app that caused the keyboard to appear and false for any other apps.
    static var keyboardIsLocalKey: AnyHashable { UIResponder.keyboardIsLocalUserInfoKey }
    
}
