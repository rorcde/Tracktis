package com.aloqa.trax.client.maps;

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;

import com.aloqa.trax.shared.shape.Coord;

public interface MapController {
	public static final int ZoomLevelONE = 16, ZoomLevelTWO = 15,
			ZoomLevelTHREE = 14, ZoomLevelFOUR = 13, ZoomLevelFIVE = 12,
			ZoomLevelSIX = 11, ZoomLevelSEVEN = 10, ZoomLevelEIGHT = 9,
			ZoomLevelNINE = 8, ZoomLevelTEN = 7, ZoomLevelELEVEN = 6,
			ZoomLevelTWELVE = 5, ZoomLevelTHIRTEEN = 4, ZoomLevelFOURTEEN = 3,
			ZoomLevelFIVETEEN = 2, ZoomLevelSIXTEEN = 1,
			ZoomLevelSEVENTEEN = 0;

	void setMapHolder(MapHolder h);

	void setMapZoomLevel(int level);

	String getSymbolId(int imgX, int imgY, int geoRadius);

	void updateOwnPosition(Coord c, Image i);

	void removeSymbol(String id);

	void addSymbol(String id, Coord c, Image icon);

	void addSymbol(String id, Coord c, Image icon, String text);

	int getPixelX(double lon);

	int getPixelY(double lat);

	double getPixelXPerMeter();

	double getPixelYPerMeter();

	boolean isMapInitialized();

	void die();
	
	void paint(MapCanvas target,Graphics g);
}
