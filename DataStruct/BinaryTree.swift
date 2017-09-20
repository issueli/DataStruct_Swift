//
//  BinaryTree.swift
//  DataStruct
//
//  Created by liyi on 2017/9/20.
//  Copyright © 2017年 COY. All rights reserved.
//

import Foundation

var str = "Hello, playground"

class Node {
    
    var data: Any
    var leftChild: Node?
    var rightChild: Node?
    
    init(data: Any) {
        self.data = data
    }
}

class BinaryTree {
    
    var root: Node?
    var size = 0
    
    init() {}
    
    deinit {
        
        self.removeLeft(node: nil)
    }
    
    func insertLeft(in node: Node?, data: Any) -> Bool {
        
        let newNode = Node(data: data)
        newNode.data = data
        
        if node == nil {
            
            // 空树才可以设置为根节点
            if size > 0 { return false }
            root = newNode
            
        } else {
            
            node!.leftChild = newNode
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
            
        } else {
            
            node!.rightChild = newNode
        }
        
        size += 1
        
        return true
    }
    
    // 移除node的左子结点为根的子树。 如果node = nil 则移除树中所有结点
    func removeLeft(node: Node?) {
        
        if size == 0 { return }
        
        var position = node == nil ? root : node!.leftChild
        
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
        
        var position = node == nil ? root : node!.rightChild
        
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
    
    func isEob(node: Node?) -> Bool {
        
        return node == nil
    }
    
    func isLeaf(node: Node) -> Bool {
        
        return ((node.leftChild == nil) && (node.rightChild == nil))
    }
    
    // 遍历二叉树
    
    // 先序 根左右
    func preOrder(node: Node?) -> Array<Any> {
        
        var list = [Any]()
        if !isEob(node: node) {
            
            list.append(node!.data)
            
            if !isEob(node: node?.leftChild) {
                list.append(contentsOf: preOrder(node: node?.leftChild))
            }
            
            if !isEob(node: node?.rightChild) {
                list.append(contentsOf: preOrder(node: node?.rightChild))
            }
        }
        return list
    }
    
    // 中序 左根右
    func inorder(node: Node?) -> Array<Any> {
        
        var list = [Any]()
        
        if !isEob(node: node) {
            
            if !isEob(node: node?.leftChild) {
                list.append(contentsOf: inorder(node: node?.leftChild))
            }
            
            list.append(node!.data)
            
            if !isEob(node: node?.rightChild) {
                list.append(contentsOf: inorder(node: node?.rightChild))
            }
            
        }
        return list
    }
    
    // 后序 左右根
    func postorder(node: Node?) -> Array<Any> {
        
        var list = [Any]()
        if !isEob(node: node) {
            
            if !isEob(node: node?.leftChild) {
                list.append(contentsOf: postorder(node: node?.leftChild))
            }
            
            if !isEob(node: node?.rightChild) {
                list.append(contentsOf: postorder(node: node?.rightChild))
            }
            
            list.append(node!.data)
        }
        return list
    }
    
    // 层级遍历
    func levelOrder(node: Node?) -> Array<Any> {
        
        func s(left: Node?, right: Node?) -> Array<Any> {
            
            var list = [Any]()
            if !isEob(node: left) {
                list.append(left!.data)
            }
            
            if !isEob(node: right) {
                list.append(right!.data)
            }
            
            return list
        }
        
        var list = [Any]()
        
        if !isEob(node: node) {
            
            list.append(node!.data)
            list.append(contentsOf: s(left: node?.leftChild, right: node?.rightChild))
        }
        
        return list
    }
}




