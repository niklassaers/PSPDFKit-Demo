//
//  PSCTopScrobbleBar.m
//  PSPDFCatalog
//
//  Copyright (c) 2013 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from this file.
//

#import "PSCTopScrobbleBar.h"

@implementation PSCTopScrobbleBar

- (void)setToolbarFrameAndVisibility:(BOOL)shouldShow animated:(BOOL)animated {
    NSLog(@"----------CustomScrobbleBar:setToolbarFrameAndVisibility-----------");

    // Stick scrobble bar to the top.
    CGRect newFrame = self.pdfController.contentRect;
    newFrame.size.height = 44.f;
    self.frame = newFrame;

    // Disable view lock (else we get called recursively)
    self.viewLocked = NO;
}

@end
