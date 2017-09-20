//
//  main.swift
//  DataStruct
//
//  Created by liyi on 2017/9/20.
//  Copyright © 2017年 COY. All rights reserved.
//

import Foundation

let t = BinaryTree()
t.insertLeft(in: nil, data: 20)
t.insertLeft(in: t.root, data: 9)
t.insertLeft(in: t.root?.leftChild, data: 5)
t.insertRight(in: t.root?.leftChild, data: 15)
t.insertLeft(in: t.root?.leftChild?.rightChild, data: 11)
t.insertRight(in: t.root, data: 53)
t.insertRight(in: t.root?.rightChild, data: 79)

let preorderResult = t.preOrder(node: t.root)
print(preorderResult)

let inorderResult = t.inorder(node: t.root)
print(inorderResult)

let postorderResult = t.postorder(node: t.root)
print(postorderResult)


print(t.size)
