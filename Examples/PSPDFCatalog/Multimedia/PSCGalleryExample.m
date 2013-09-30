//
//  PSCGalleryExample.m
//  PSPDFCatalog
//
//  Copyright (c) 2012-2013 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from this file.
//

#import "PSCGalleryExample.h"
#import "PSCAssetLoader.h"

@implementation PSCGalleryExample

- (id)init {
    if (self = [super init]) {
        self.title = @"Image Gallery";
        self.category = PSCExampleCategoryMultimedia;
    }
    return self;
}

- (UIViewController *)invoke {
    PSPDFDocument *document = [PSCAssetLoader sampleDocumentWithName:kHackerMagazineExample];
    document.annotationSaveMode = PSPDFAnnotationSaveModeDisabled;
    
    // Dynamically add gallery annotation.
    PSPDFLinkAnnotation *galleryAnnotation = [[PSPDFLinkAnnotation alloc] initWithURLString:@"pspdfkit://localhost/Bundle/sample.gallery"];
    galleryAnnotation.boundingBox = CGRectInset([document pageInfoForPage:0].rotatedPageRect, 100, 100);
    [document addAnnotations:@[galleryAnnotation]];
    
    PSPDFViewController *pdfController = [[PSPDFViewController alloc] initWithDocument:document];
    return pdfController;
}

@end
