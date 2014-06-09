// Playground - noun: a place where people can play


import Cocoa
import QuartzCore
import XCPlayground

class PlaygroundIconView:NSView {
    
    let backgroundLayer=CAShapeLayer()
    
    let seesawBaseLayer=CAShapeLayer()
    
    let seesawLayer=CAShapeLayer()
    
    
    
    init(){
        
        super.init(frame:NSRect(x:0,y:0,width:568,height:568))
        
        
        
        backgroundLayer.frame=self.bounds
        
        seesawBaseLayer.frame=NSRect(x:254,y:124,width:60,height:111)
        
        seesawLayer.frame=NSRect(x:40,y:197, width:488,height:30)
        
        
        
        setUpBackgroundLayer()
        
        setUpSeesawBaseLayer()
        
        setUpSeesawLayer()
        
        
        
        self.wantsLayer=true
        
        
        
        self.layer.addSublayer(backgroundLayer)
        
        self.layer.addSublayer(seesawBaseLayer)
        
        self.layer.addSublayer(seesawLayer)
        
    }
    
    
    
    func setUpBackgroundLayer(){
        
        let lineWidth=9.0
        
        let backgroundPath=NSBezierPath(roundedRect:NSInsetRect(bounds, lineWidth/2, lineWidth/2),xRadius:35.0,yRadius:35.0)
        
        backgroundPath.lineWidth=lineWidth
        
        
        
        backgroundLayer.strokeColor=NSColor.playgroundIconStrokeColor().CGColor
        
        backgroundLayer.fillColor=NSColor.playgroundIconFillColoer().CGColor
        
        backgroundLayer.lineWidth=lineWidth
        
        
        
        backgroundLayer.path=CGPathFromNSBezierPath(backgroundPath)
        
    }
    
    
    
    func setUpSeesawBaseLayer(){
        
        
        
        let seesawBasePath=NSBezierPath()
        
        
        
        
        
        let rectHeight:Int=50;
        
        
        
        
        
        seesawBasePath.moveToPoint(NSPoint(x:0,y:rectHeight))
        
        seesawBasePath.lineToPoint(NSPoint(x:seesawBaseLayer.bounds.width/2,y:seesawBaseLayer.bounds.height))
        
        seesawBasePath.lineToPoint(NSPoint(x:seesawBaseLayer.bounds.width,y:50))
        
        
        
        
        
        seesawBaseLayer.fillColor=NSColor.whiteColor().CGColor
        
        seesawBaseLayer.path=CGPathFromNSBezierPath(seesawBasePath)
        
    }
    
    
    
    func setUpSeesawLayer(){
        
        
        
        let createChildLayer:()->CAShapeLayer={
            
            let childLayer=CAShapeLayer()
            
            let headPath=NSBezierPath(ovalInRect:NSRect(x:60,y:150,width:49,height:49))
            
            
            
            let bodyPath=NSBezierPath()
            
            
            
            bodyPath.moveToPoint(NSPoint(x:58,y:155))
            
            bodyPath.lineToPoint(NSPoint(x:88,y:140))
            
            bodyPath.lineToPoint(NSPoint(x:126,y:100))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:120,y:90))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:125,y:71))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:113,y:71))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:112,y:94))
            
            bodyPath.lineToPoint(NSPoint(x:83,y:113))
            
            bodyPath.lineToPoint(NSPoint(x:68,y:94))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:97,y:70))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:122,y:12))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:98,y:0))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:64,y:41))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:7,y:71))
            
            
            
            bodyPath.lineToPoint(NSPoint(x:0,y:94))
            
            
            
            bodyPath.moveToPoint(NSPoint(x:58,y:155))
            
            
            
            let childPath=NSBezierPath()
            
            
            
            childPath.appendBezierPath(headPath)
            
            childPath.appendBezierPath(bodyPath)
            
            
            
            childLayer.fillColor=NSColor.whiteColor().CGColor
            
            childLayer.path=CGPathFromNSBezierPath(childPath)
            
            
            
            return childLayer
            
        }
        
        
        
        
        
        let leftChildLayer = createChildLayer()
        
        let rightChildLayer = createChildLayer()
        
        
        
        rightChildLayer.transform=CATransform3DMakeRotation(M_PI,0.0,0.0,1.0)
        
        rightChildLayer.geometryFlipped=true
        
        
        
        
        
        let benchLayer = CALayer()
        
        
        
        benchLayer.frame=NSRect(x:0,y:41,width:self.seesawLayer.bounds.width,height:30)
        
        
        
        benchLayer.backgroundColor=NSColor.whiteColor().CGColor
        
        
        
        
        
        leftChildLayer.frame=NSRect(x:25,y:0,width:126,height:200)
        
        rightChildLayer.frame=NSRect(x:488-(126+25),y:0,width:126,height:200)
        
        
        
        
        
        seesawLayer.addSublayer(leftChildLayer)
        
        seesawLayer.addSublayer(rightChildLayer)
        
        seesawLayer.addSublayer(benchLayer)
        
        
        
        seesawLayer.delegate=self
        
    }
    
    
    
    
    
    let maxSeesawAngle=M_PI / 12
    
    
    
    var currentSeesawAngle = 0.0
    
    
    
    var animate:Bool = false{
    
    
    
    didSet(oldAnimate){
        
        if animate != oldAnimate && animate {
            
            if currentSeesawAngle == 0  {
                
                
                
                //@Bailey
                
                // 设置捕捉动态记录和显示的参数
                
                XCPCaptureValue("Left Seesaw Position",0 )
                
                animateSeesawToAngle(maxSeesawAngle,duration: 0.75)
                
                
                
            }
                
            else
                
            {
                
                animateSeesawToAngle(currentSeesawAngle * -1)
                
            }
            
        }
        
    }
    
    }
    
    
    
    func animateSeesawToAngle(angle:CGFloat,duration:CFTimeInterval = 1.5 )-> CAAnimation{
        
        let angleAnimation = CABasicAnimation(keyPath:"transform")
        
        angleAnimation.fromValue=NSValue(CATransform3D:seesawLayer.transform)
        
        
        
        angleAnimation.toValue=NSValue(CATransform3D:CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0))
        
        
        
        angleAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        
        
        angleAnimation.duration = duration
        
        angleAnimation.delegate=self
        
        seesawLayer.addAnimation(
            
            angleAnimation, forKey: "transform")
        
        
        
        seesawLayer.transform=CATransform3DMakeRotation(angle,0.0, 0.0, 1.0)
        
        currentSeesawAngle=angle
        
        return angleAnimation
        
        
        
    }
    
    
    
    override func animationDidStop(_:CAAnimation!,finished:Bool){
        
        if finished && animate {
            
            
            
            //@Bailey
            
            // 设置捕捉动态记录和显示的参数
            
            XCPCaptureValue("Left Seesaw Position",-currentSeesawAngle )
            
            animateSeesawToAngle(currentSeesawAngle * -1)
            
        }
        
    }
    
}

extension NSColor {
    
    class func playgroundIconFillColoer()->NSColor{
        
        return NSColor(red:12/255,green:65/255,blue:135/255,alpha:1.0)
        
    }
    
    class func playgroundIconStrokeColor()->NSColor{
        
        return NSColor(red:9/255,green:44/255,blue:91/255,alpha:1.0)
        
    }
    
}

func CGPathFromNSBezierPath(nsPath:NSBezierPath)->CGPath! {
    
    if nsPath.elementCount==0{
        
        return nil
        
    }
    
    
    
    let path=CGPathCreateMutable()
    
    var didClosePath=false
    
    for i in 0..nsPath.elementCount{
        
        var points=NSPoint[](count:3,repeatedValue:NSZeroPoint)
        
        
        
        switch nsPath.elementAtIndex(i, associatedPoints: &points){
            
        case .MoveToBezierPathElement:
            
            CGPathMoveToPoint(path,nil,points[0].x,points[0].y)
            
            
            
        case .LineToBezierPathElement:
            
            CGPathAddLineToPoint(path, nil, points[0].x, points[0].y)
            
            
            
        case .CurveToBezierPathElement:
            
            CGPathAddCurveToPoint(path,nil, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y)
            
        case .ClosePathBezierPathElement:
            
            CGPathCloseSubpath(path)
            
            didClosePath=true
            
        }
        
    }
    
    if !didClosePath{
        
        CGPathCloseSubpath(path)
        
    }
    
    return CGPathCreateCopy(path)
    
}

let view=PlaygroundIconView()

view.animate=true

//@Bailey

//显示游乐场跷跷板动态图标以及时间轴用于程序计算回溯

XCPShowView("20140605",view)

view
