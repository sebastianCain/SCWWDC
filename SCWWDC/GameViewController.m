//
//  GameViewController.m
//  SceneKitTestingBoiii
//
//  Created by Sebastian Cain on 5/4/15.
//  Copyright (c) 2015 Sebastian Cain. All rights reserved.
//

#import "GameViewController.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	SCNScene *scene = [SCNScene scene];
	self.scene = scene;
	
    // create a new scene
    SCNScene *icoscene = [SCNScene sceneNamed:@"art.scnassets/icosphere.dae"];
    SCNNode *ico = icoscene.rootNode.childNodes[0];
    ico.transform = SCNMatrix4MakeScale(0.5, 0.5, 0.5);
	ico.position = SCNVector3Make(0, 0, 5);
	[scene.rootNode addChildNode:ico];
	self.ico = ico;
	
	[ico runAction:[SCNAction repeatActionForever:[SCNAction rotateByAngle:10 aroundAxis:SCNVector3Make(2, 10, 0) duration:10]]];
	
    // create and add a camera to the scene
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    [scene.rootNode addChildNode:cameraNode];
    
    // place the camera
    cameraNode.position = SCNVector3Make(0, 0, 15);
    
    // create and add a light to the scene
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
	lightNode.light.type = SCNLightTypeOmni;
    lightNode.position = SCNVector3Make(15, 15, 15);
    [scene.rootNode addChildNode:lightNode];
    
    // create and add an ambient light to the scene
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLightNode.light = [SCNLight light];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor grayColor];
    [scene.rootNode addChildNode:ambientLightNode];
	
    // retrieve the SCNView
    
    self.view = [[SCNView alloc]init];
    
    SCNView *scnView = (SCNView *)self.view;
    
    // set the scene to the view
    [scnView setScene:scene];
    
    // allows the user to manipulate the camera
	[scnView setAllowsCameraControl: NO];

    // configure the view
    scnView.backgroundColor = [UIColor clearColor];
    
    // add a tap gesture recognizer
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    NSMutableArray *gestureRecognizers = [NSMutableArray array];
    [gestureRecognizers addObject:tapGesture];
    [gestureRecognizers addObjectsFromArray:scnView.gestureRecognizers];
    scnView.gestureRecognizers = gestureRecognizers;
	
	//[self tripCircAni];
	//[self atomsAni];
}

-(void)tripCircAni {
	SCNNode *allRings = [SCNNode node];
	[self.scene.rootNode addChildNode:allRings];
	for (int x = 0; x < 3; x++) {
		SCNNode *electronring = [SCNNode nodeWithGeometry:[SCNTorus torusWithRingRadius:2 pipeRadius:.03]];
		[electronring setPosition:SCNVector3Make(0, 0, 0)];
		[electronring runAction:[SCNAction rotateByAngle:M_PI*.1*x aroundAxis:SCNVector3Make(0, 0, 1) duration:0]];
		[electronring setOpacity:0.3];
		[allRings addChildNode:electronring];
		
		[electronring runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:2 y:0 z:0 duration:1.0]]];
	}
	
	[allRings setPosition:SCNVector3Make(0, 0, 5)];
	[allRings runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:2 y:0 z:0 duration:1.0]]];
	
}

-(void)atomsAni {
	for (int x = 0; x < 3; x++) {
		SCNNode *electronCenter = [SCNNode node];
		[electronCenter setPosition:SCNVector3Make(0, 0, 5)];
		
		SCNNode *atom = [SCNNode nodeWithGeometry:[SCNSphere sphereWithRadius:.1]];
		atom.position = SCNVector3Make(0, 0, 1.5);
		[electronCenter addChildNode:atom];
		
		[self.scene.rootNode addChildNode:electronCenter];
		SCNAction *orbit = [SCNAction repeatActionForever:[SCNAction rotateByAngle:2*M_PI aroundAxis:SCNVector3Make(cosf(M_PI*0.66*x+1), sinf(M_PI*0.66*x+1), 0) duration:2]];
		[electronCenter runAction:[SCNAction sequence:@[[SCNAction waitForDuration:0.66*x], orbit]]];
	}
}

- (void)handleTap:(UIGestureRecognizer*)gestureRecognize
{
    // retrieve the SCNView
    SCNView *scnView = (SCNView *)self.view;
    
    // check what nodes are tapped
    CGPoint p = [gestureRecognize locationInView:scnView];
    NSArray *hitResults = [scnView hitTest:p options:nil];
    
    // check that we clicked on at least one object
    if([hitResults count] > 0){
        // retrieved the first clicked object
        SCNHitTestResult *result = [hitResults objectAtIndex:0];
        
        // get its material
        SCNMaterial *material = result.node.geometry.firstMaterial;
        
        // highlight it
        [SCNTransaction begin];
        [SCNTransaction setAnimationDuration:0.5];
        
        // on completion - unhighlight
        [SCNTransaction setCompletionBlock:^{
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:0.5];
            
            material.emission.contents = [UIColor blackColor];
            
            [SCNTransaction commit];
        }];
        
        material.emission.contents = [UIColor redColor];
        
        [SCNTransaction commit];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
