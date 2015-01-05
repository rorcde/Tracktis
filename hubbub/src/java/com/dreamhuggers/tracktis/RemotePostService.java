package com.dreamhuggers.tracktis;

public interface RemotePostService extends java.rmi.Remote {
    long createPost(String userId, String content) throws java.rmi.RemoteException;
}
