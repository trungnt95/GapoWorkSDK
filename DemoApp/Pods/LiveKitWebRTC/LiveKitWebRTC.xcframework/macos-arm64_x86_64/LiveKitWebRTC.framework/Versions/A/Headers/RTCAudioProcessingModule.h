/*
 * Copyright 2023 LiveKit
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <Foundation/Foundation.h>

#import <LiveKitWebRTC/RTCMacros.h>

NS_ASSUME_NONNULL_BEGIN

@class RTC_OBJC_TYPE(RTCAudioProcessingConfig);

RTC_OBJC_EXPORT @protocol RTC_OBJC_TYPE (RTCAudioProcessingModule)<NSObject>

- (void)applyConfig: (RTC_OBJC_TYPE(RTCAudioProcessingConfig) *)config;

// TODO: Implement...

@end

NS_ASSUME_NONNULL_END
