//
//  KeyboardNotificationName.swift
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

/// An alias for a type used to represent the name of a keyboard related notification.
public enum KeyboardNotificationName {
    
    /// Posted immediately prior to the display of the keyboard.
    case willShow
    
    /// Posted immediately after the display of the keyboard.
    case didShow
    
    /// Posted immediately prior to the dismissal of the keyboard.
    case willHide
    
    /// Posted immediately after the dismissal of the keyboard.
    case didHide
    
    /// Posted immediately prior to a change in the keyboard’s frame.
    case willChangeFrame
    
    /// Posted immediately after a change in the keyboard’s frame.
    case didChangeFrame
    
    var notificationName: Notification.Name {
        switch self {
        
        case .willShow:
            return .keyboardWillShow
        
        case .didShow:
            return .keyboardDidShow
        
        case .willHide:
            return .keyboardWillHide
        
        case .didHide:
            return .keyboardDidHide
            
        case .willChangeFrame:
            return .keyboardWillChangeFrame
        
        case .didChangeFrame:
            return .keyboardDidChangeFrame
        }
    }
}
