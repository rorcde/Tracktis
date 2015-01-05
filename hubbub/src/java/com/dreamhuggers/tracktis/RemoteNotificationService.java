package com.dreamhuggers.tracktis;

public interface RemoteNotificationService extends java.rmi.Remote {
    long createNotification(
	String name,
	String followed,
	Location location,
	String frequency,
	boolean enter,
	String startDate,
	String endDate) throws java.rmi.RemoteException;

}