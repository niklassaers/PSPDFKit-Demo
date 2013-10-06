//
//  PSCMassiveGalleryExample.m
//  PSPDFCatalog-static
//
//  Created by Matthias Plappert on 06/10/13.
//  Copyright (c) 2013 PSPDFKit GmbH. All rights reserved.
//

#import "PSCMassiveGalleryExample.h"
#import "PSCAssetLoader.h"

@implementation PSCMassiveGalleryExample

- (id)init {
    if (self = [super init]) {
        self.title = @"Massive Image Gallery";
        self.category = PSCExampleCategoryMultimedia;
    }
    return self;
}

- (UIViewController *)invoke {
    PSPDFDocument *document = [PSCAssetLoader sampleDocumentWithName:kHackerMagazineExample];
    document.annotationSaveMode = PSPDFAnnotationSaveModeDisabled;
    
    // Dynamically add gallery annotation.
    PSPDFLinkAnnotation *galleryAnnotation = [[PSPDFLinkAnnotation alloc] initWithURLString:@"pspdfkit://localhost/Bundle/massive_sample.gallery"];
    CGRect pageRect = [document pageInfoForPage:0].rotatedPageRect;
    CGPoint center = CGPointMake(CGRectGetMidX(pageRect), CGRectGetMidY(pageRect));
    CGSize size = CGSizeMake(400, 300);
    galleryAnnotation.boundingBox = CGRectMake(center.x - size.width / 2.0f, center.y - size.height / 2.0f, size.width, size.height);
    [document addAnnotations:@[galleryAnnotation]];
    
    PSPDFViewController *pdfController = [[PSPDFViewController alloc] initWithDocument:document];
    return pdfController;
}

@end
