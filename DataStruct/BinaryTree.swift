//
//  BinaryTree.swift
//  DataStruct
//
//  Created by liyi on 2017/9/20.
//  Copyright © 2017年 COY. All rights reserved.
//

import Foundation

class Node {
    
    var data: Any
    var level: Int = 0
    var left: Node?
    var right: Node?
    
    init(data: Any) {
        self.data = data
    }
    
    var isLeaf: Bool {
        
        get {
            return (left == nil) && (right == nil)
        }
    }
}

enum NodeSide {
    
    case left
    case right
}

class BinaryTree {
    
    var root: Node?
    var size = 0
    var height = 0
    
    init() {}
    
    deinit {
        
        self.removeLeft(node: nil)
    }
    
    func insert(in node: Node?, side: NodeSide, data: Any) -> Bool {
        
        let newNode = Node(data: data)
        
        if node == nil {
            
            if size > 0 {
                return false
            }
            root = newNode
            height = 1
            
        } else {
            
            newNode.level = node!.level + 1
            height = (height < newNode.level + 1) ? newNode.level + 1 : height
            
            switch side {
            case .left:
                node!.left = newNode
            case .right:
                node!.right = newNode
            }
        }
        return true
    }
    
    func insertLeft(in node: Node?, data: Any) -> Bool {
        
        let newNode = Node(data: data)
        
        if node == nil {
            
            // 空树才可以设置为根节点
            if size > 0 { return false }
            root = newNode
            height = 1
        } else {

            newNode.level = node!.level + 1
            if newNode.level + 1 > height {
                height = newNode.level + 1
            }
            node!.left = newNode
        }
        
        size += 1
        return true
    }
    
    func insertRight(in node: Node?, data: Any) -> Bool {
        
        let newNode = Node(data: data)
        newNode.data = data
        
        if node == nil {
            
            // 空树才可以设置为根节点
            if size > 0 { return false }
            
            root = newNode
            height = 1
            
        } else {
            
            newNode.level = node!.level + 1
            if newNode.level + 1 > height {
                height = newNode.level + 1
            }
            node!.right = newNode
        }
        
        size += 1
        
        return true
    }
    
    // 移除node的左子结点为根的子树。 如果node = nil 则移除树中所有结点
    func removeLeft(node: Node?) {
        
        if size == 0 { return }
        
        var position = node == nil ? root : node!.left
        
        guard let p = position else {
            return
        }
        
        removeLeft(node: p)
        removeRight(node: p)
        
        position = nil
        
        size -= 1
    }
    
    func removeRight(node: Node?) {
        
        if size == 0 { return }
        
        var position = node == nil ? root : node!.right
        
        guard let p = position else {
            return
        }
        
        removeLeft(node: p)
        removeRight(node: p)
        
        position = nil
        
        size -= 1
    }
    
    func merge(with tree: BinaryTree) {
        
    }
    
    func isEnd(node: Node?) -> Bool {
        
        return node == nil
    }
    
    static func height(tree: Node?) {
        
    }
    
    // 遍历二叉树
    // 先序 根左右
    func preOrder(node: Node?) -> Array<Any> {
        
        var list = [Any]()
        if !isEnd(node: node) {
            
            list.append(node!.data)
            
            if !isEnd(node: node?.left) {
                list.append(contentsOf: preOrder(node: node?.left))
            }
            
            if !isEnd(node: node?.right) {
                list.append(contentsOf: preOrder(node: node?.right))
            }
        }
        return list
    }
    
    // 中序 左根右
    func inorder(node: Node?) -> Array<Any> {
        
        var list = [Any]()
        
        if !isEnd(node: node) {
            
            if !isEnd(node: node?.left) {
                list.append(contentsOf: inorder(node: node?.left))
            }
            
            list.append(node!.data)
            
            if !isEnd(node: node?.right) {
                list.append(contentsOf: inorder(node: node?.right))
            }
            
        }
        return list
    }
    
    // 后序 左右根
    func postorder(node: Node?) -> Array<Any> {
        
        var list = [Any]()
        if !isEnd(node: node) {
            
            if !isEnd(node: node?.left) {
                list.append(contentsOf: postorder(node: node?.left))
            }
            
            if !isEnd(node: node?.right) {
                list.append(contentsOf: postorder(node: node?.right))
            }
            
            list.append(node!.data)
        }
        return list
    }
    
    // 层级遍历
    func levelOrder(node: Node?) -> Array<Any> {
        
        func s(left: Node?, right: Node?) -> Array<Any> {
            
            var list = [Any]()
            if !isEnd(node: left) {
                list.append(left!.data)
            }
            
            if !isEnd(node: right) {
                list.append(right!.data)
            }
            
            return list
        }
        
        var list = [Any]()
        
        if !isEnd(node: node) {
            
            list.append(node!.data)
            list.append(contentsOf: s(left: node?.left, right: node?.right))
        }
        
        return list
    }
}




