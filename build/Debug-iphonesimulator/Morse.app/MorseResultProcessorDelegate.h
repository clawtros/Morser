@protocol MorseResultProcessorDelegate <NSObject>
-(void)touchDurationReceived:(double)touchDuration timeFromLastTap:(double)pauseTime;
@end