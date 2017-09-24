//
//  List.swift
//  DataStruct
//
//  Created by liyi on 2017/9/22.
//  Copyright © 2017年 COY. All rights reserved.
//

import Foundation

class ListElement {
    
    var data: Any
    var next: ListElement?
    
    init(data: Any) {
        
        self.data = data
    }
}

class List {
    
    var size: Int = 0
    var head: ListElement?
    var tail: ListElement?
    
    init() {
        
    }
    
    deinit {
        
    }
    
    func insert(after element: ListElement?, data: Any) -> Bool {
        
        let newElement = ListElement(data: data)
        
        if element == nil {
           
            // 当作head插入
            if size == 0 {
                tail = newElement
            }
            
            newElement.next = head
            head = newElement
            
        } else {
            
            if element!.next == nil {
                
                tail = newElement
            }
            
            newElement.next = element!.next
            element?.next = newElement;
        }
        
        return true
    }
    
    func remove(after element: ListElement) -> Any {
        
        
        return element.data
    }
}
