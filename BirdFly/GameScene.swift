//
//  GameScene.swift
//  BirdFly
//
//  Created by Shubham Garg on 11/05/18.
//  Copyright © 2018 SHUBHAM GARG. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    var birdx:CGFloat?
    var birdy:CGFloat?
    override func didMove(to view: SKView) {
        run(
            SKAction.repeatForever(
            SKAction.sequence([SKAction.run(addBird),SKAction.wait(forDuration: 1.0),
                SKAction.run(flyBird),
                SKAction.wait(forDuration: 2.0)
                ])
        ))
        
    }
    
    func addBird(){
        let bird =  SKSpriteNode(imageNamed: "1")
        
        backgroundColor = SKColor.white
        birdx = size.width * 0.1
        birdy = size.height * 0.1
        bird.position = CGPoint(x: birdx!, y: birdy!)
        addChild(bird)
        bird.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.0),
            SKAction.removeFromParent()
            ]))
        
        let birdMusic = SKAudioNode(fileNamed: "Blackbird-singing-in-the-garden.mp3")
        birdMusic.autoplayLooped = true
        addChild(birdMusic)
    }
    
    func flyBird() {
       
        let fly = SKSpriteNode(imageNamed: "2")
        fly.position = CGPoint(x:  size.width * 0.1, y: size.height * 0.1)
        
        addChild(fly)
       
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(10.0))
        

        let actionMove = SKAction.move(to: CGPoint(x: size.width + fly.size.width/2, y: size.height + fly.size.height/2), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        
        fly.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }

}
