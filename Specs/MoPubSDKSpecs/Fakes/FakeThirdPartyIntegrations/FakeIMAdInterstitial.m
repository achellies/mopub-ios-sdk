//
//  FakeGSFullScreenAd.m
//  MoPub
//
//  Copyright (c) 2013 MoPub. All rights reserved.
//

#import "FakeIMAdInterstitial.h"

@implementation FakeIMAdInterstitial

- (void)loadRequest:(IMAdRequest *)request
{
    self.request = request;
}

- (UIViewController *)presentingViewController
{
    return nil;
}

- (void)presentInterstitialAnimated:(BOOL)_animated
{
    if (self.willPresentSuccessfully) {
        self.didPresent = YES;
        [self.delegate interstitialWillPresentScreen:self];
    } else {
        [self.delegate interstitial:self didFailToPresentScreenWithError:nil];
    }
}

- (void)simulateLoadingAd
{
    [self.delegate interstitialDidFinishRequest:self];
}

- (void)simulateFailingToLoad
{
    [self.delegate interstitial:self didFailToReceiveAdWithError:nil];
}

- (void)simulateUserTap
{
    [self.delegate interstitialWillLeaveApplication:self];
}

- (void)simulateUserDismissingAd
{
    self.didPresent = NO;
    [self.delegate interstitialWillDismissScreen:self];
}

- (void)simulateInterstitialFinishedDisappearing
{
    [self.delegate interstitialDidDismissScreen:self];
}

@end
