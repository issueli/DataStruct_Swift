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
t.insertLeft(in: t.root?.left, data: 5)
t.insertRight(in: t.root?.left, data: 15)
t.insertLeft(in: t.root?.left?.right, data: 11)
t.insertRight(in: t.root, data: 53)
t.insertRight(in: t.root?.right, data: 79)

let preorderResult = t.preOrder(node: t.root)
print(preorderResult)

let inorderResult = t.inorder(node: t.root)
print(inorderResult)

let postorderResult = t.postorder(node: t.root)
print(postorderResult)

//t.removeLeft(node: nil)
print(t.size)
print(t.height)
print(t.root?.left?.level ?? "0")
