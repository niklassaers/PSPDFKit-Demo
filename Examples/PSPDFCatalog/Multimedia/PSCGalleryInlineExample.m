//
//  PSCGalleryInlineExample.m
//  PSPDFCatalog-static
//
//  Created by Matthias Plappert on 03/10/13.
//  Copyright (c) 2013 PSPDFKit GmbH. All rights reserved.
//

#import "PSCGalleryInlineExample.h"
#import "PSCAssetLoader.h"

@implementation PSCGalleryInlineExample

- (id)init {
    if (self = [super init]) {
        self.title = @"Inline Image Gallery";
        self.category = PSCExampleCategoryMultimedia;
    }
    return self;
}

- (UIViewController *)invoke {
    PSPDFDocument *document = [PSCAssetLoader sampleDocumentWithName:kHackerMagazineExample];
    document.annotationSaveMode = PSPDFAnnotationSaveModeDisabled;
    
    // Dynamically add gallery annotation.
    PSPDFLinkAnnotation *galleryAnnotation = [[PSPDFLinkAnnotation alloc] initWithURL:[NSURL URLWithString:@"pspdfkit://gallery"]];
    galleryAnnotation.contents = @"[{\"contentURL\":\"http://www.sanfrancisco.net/pictures/san-francisco.jpg\"},{\"contentURL\":\"http://www.sanfrancisco.net/pictures/san-francisco-alamo-square.jpg\"},{\"contentURL\":\"http://static5.businessinsider.com/image/5242fc7c69bedd21236cd2dd-1200/the-teams-practice-in-front-of-the-san-francisco-skyline.jpg\"}]";
    
    CGRect pageRect = [document pageInfoForPage:0].rotatedPageRect;
    CGPoint center = CGPointMake(CGRectGetMidX(pageRect), CGRectGetMidY(pageRect));
    CGSize size = CGSizeMake(400, 270);
    galleryAnnotation.boundingBox = CGRectMake(center.x - size.width / 2.0f, center.y - size.height / 2.0f, size.width, size.height);
    [document addAnnotations:@[galleryAnnotation]];
    
    PSPDFViewController *pdfController = [[PSPDFViewController alloc] initWithDocument:document];
    return pdfController;
}

@end
