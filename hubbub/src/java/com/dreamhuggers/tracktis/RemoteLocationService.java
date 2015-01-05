package com.dreamhuggers.tracktis;

public interface RemoteLocationService extends java.rmi.Remote {
    long createLocation(String userId,
                        String location,
                        String description,
                        double latitude,
                        double longitude,
                        double geofence_radius,
                        boolean forEveryone) throws java.rmi.RemoteException;

}
