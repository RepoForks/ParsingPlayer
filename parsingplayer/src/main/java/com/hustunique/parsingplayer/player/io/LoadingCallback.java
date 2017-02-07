package com.hustunique.parsingplayer.player.io;

/**
 * Created by JianGuo on 2/5/17.
 * callback used in {@link CallbackTask}, note that this callback will execute in the same thread as
 * {@link CallbackTask#run()} executes.
 */
public interface LoadingCallback<T> {
    void onSuccess(T result);
    void onFailed(Exception e);
}