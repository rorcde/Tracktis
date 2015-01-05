package com.aloqa.trax.client.maps;

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Graphics;

public class MapCanvas extends Canvas {

	private MapController mc;

	protected void paint(Graphics g) {
		if (mc != null)
			mc.paint(this, g);

	}

	public void setMapController(MapController mapController) {
		this.mc = mapController;

	}
}
