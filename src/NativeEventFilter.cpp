#include "NativeEventFilter.h"
void donothing(void *nothing){
    if(nothing)
        return;
    else
        return;
}
void doNothing(const QByteArray &nothing){
    if(*nothing)
        return;
    else
        return;
}
bool NativeEventFilter::nativeEventFilter(const QByteArray &eventType, void *message, long *result)
{
    return false;
    donothing(message);
    donothing(result);
    doNothing(eventType);
}
