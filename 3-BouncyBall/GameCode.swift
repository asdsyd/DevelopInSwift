import Foundation

let ball = OvalShape(width: 40, height: 40)
var barriers: [Shape] = []
var targets: [Shape] = []
let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]

let funnel = PolygonShape(points: funnelPoints)

/*
The setup() function is called once when the app launches. Without it, your app won't compile.
Use it to set up and start your app.

You can create as many other functions as you want, and declare variables and constants,
at the top level of the file (outside any function). You can't write any other kind of code,
for example if statements and for loops, at the top level; they have to be written inside
of a function.
*/

func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" { return }
    
    otherShape.fillColor = .green
}

fileprivate func setupBall() {
    ball.position = Point(x: 250, y: 400)
    scene.add(ball)
    ball.hasPhysics = true
    ball.fillColor = .blue
    ball.onCollision = ballCollided(with:)
    ball.isDraggable = false
    scene.trackShape(ball)
    ball.onExitedScene = ballExitedScene
    ball.onTapped = resetGame
    ball.bounciness = 0.6
}

func printPosition(of shape: Shape) {
    print(shape.position)
}

//Drops the ball by moving it to the funnel's position.
func dropBall() {
    ball.position = funnel.position
    ball.stopAllMotion()
    
    for barrier in barriers {
        barrier.isDraggable = false
    }
    
    for target in targets {
        target.fillColor = .yellow
    }
}

func ballExitedScene() {
    var hitTargets = 0
    for target in targets {
        if target.fillColor == .green {
            hitTargets += 1
        }
    }
    
    if hitTargets == targets.count {
        print("Won the game!")
        scene.presentAlert(text: "You won the game!", completion: alertDismissed)
    } else {
        scene.presentAlert(text: "Uh Oh! Try to hit all targets in one move to win!", completion: alertDismissed)
    }
    
    
    for barrier in barriers {
        barrier.isDraggable = true
    }
    
}

func alertDismissed() {
    
}

func resetGame() {
    ball.position = Point(x: 0, y: -80)
}

fileprivate func addBarrier(at position: Point, width: Double, height: Double, angle: Double) {
    //Add a barrier to the scene.
    let barrierPoints = [
    Point(x: 0, y: 0),
    Point(x: 0, y: height),
    Point(x: width, y: height),
    Point(x: width, y: 0)
    ]
    
    let barrier = PolygonShape(points: barrierPoints)
    
    barriers.append(barrier)
    
    barrier.position = position
    barrier.hasPhysics = true
    barrier.fillColor = .brown
    scene.add(barrier)
    barrier.isImmobile = true
    barrier.angle = angle
}

fileprivate func setupFunnel() {
    //Add a funnel to the scene.
    funnel.position = Point(x: 200, y: scene.height - 25)
    funnel.fillColor = .purple
    scene.add(funnel)
    funnel.onTapped = dropBall
    funnel.isDraggable = false
}

func addTarget(at position: Point) {
    let targetPoints = [
        Point(x: 10, y: 0),
        Point(x: 0, y: 10),
        Point(x: 10, y: 20),
        Point(x: 20, y: 10)
    ]
    
    let target = PolygonShape(points: targetPoints)
    
    targets.append(target)
    target.name = "target"
    target.position = position
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
    target.fillColor = .yellow
    target.isDraggable = false
    
    scene.add(target)
}

func setup() {
    
    setupBall()
    
    addBarrier(at: Point(x: 211, y: 548), width: 80, height: 25, angle: 0.1)
    addBarrier(at: Point(x: 88, y: 240), width: 240, height: 25, angle: -0.2)
    addBarrier(at: Point(x: 80, y: 400), width: 80, height: 25, angle: 0.4)
    addBarrier(at: Point(x: 380, y: 368), width: 80, height: 25, angle: -0.4)
    addBarrier(at: Point(x: 339, y: 556), width: 120, height: 25, angle: 0.4)
    
    setupFunnel()

    //Add a target to the scene
    addTarget(at: Point(x: 143, y: 248))
    addTarget(at: Point(x: 248, y: 56))
    addTarget(at: Point(x: 150, y: 720))
    addTarget(at: Point(x: 378, y: 353))
    
    scene.onShapeMoved = printPosition(of:)
    
    resetGame()
}


