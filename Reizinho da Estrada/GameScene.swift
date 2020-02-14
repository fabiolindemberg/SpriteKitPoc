//
//  GameScene.swift
//  Reizinho da Estrada
//
//  Created by Fábio Pereira on 11/08/19.
//  Copyright © 2019 Fábio Pereira. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var player : SKSpriteNode? = nil
    private var background: SKSpriteNode?
    private let backgroudImageName = "fundo"
    private let playerImageName = "nick"
    
    fileprivate func setupBackground() {
        background = SKSpriteNode(texture: SKTexture(imageNamed: backgroudImageName))
        self.addChild(background!)
    }
    
    fileprivate func setupPlayer() {
        let widthValue = 170
        let heigthValue = 150
        let xValue = -305
        let yValue = -115
        
        var playerImageFrames : [SKTexture] = []
        
        for i in 1...2 {
            playerImageFrames.append(SKTexture(imageNamed: "\(playerImageName)\(i)"))
        }
        
        let animationAction = SKAction.animate(with: playerImageFrames, timePerFrame: 0.3)
        let repeatAction = SKAction.repeatForever(animationAction)
        
        player = SKSpriteNode(imageNamed: "\(playerImageName)1")
        player?.size = CGSize(width: widthValue, height: heigthValue)
        player?.anchorPoint = CGPoint(x: 0, y: 0)
        //player?.position = CGPoint(x: xValue, y: yValue)
        player?.run(repeatAction)
        self.scene?.addChild(player!)
        
        let scene = SKScene(size: self.bounds.size)
        //self.addChild(player!)
    }
    
    override func didMove(to view: SKView) {
        //setupBackground()
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if player == nil {
            setupPlayer()
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
