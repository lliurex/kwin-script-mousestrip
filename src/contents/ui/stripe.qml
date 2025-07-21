/*
	This script is part of the Lliurex Project 
	SPDX-FileCopyrightText: 2024 juanma1980 <juanma1980@gmail.com>
	SPDX-License-Identifier: GPL-3.0
*/
import QtQuick 2.12;
import QtQuick.Window 2.12;

Window {
	id: strip
	flags:Qt.FrameLessHint|Qt.WindowStaysOnTopHint|Qt.WindowSystemMenuHint| Qt.X11BypassWindowManagerHint | Qt.FramelessWindowHint| Qt.WindowTransparentForInput| Qt.TransparentForMouseEvents|Qt.OnScreenDisplay
	color:Qt.rgba(255,0,0,1.0)
	property bool outputOnly:true
	visible: false
	Rectangle {
		id:rect
		anchors.fill:parent
		visible:true
		color:strip.color
		opacity:parent.opacity
	}
	Component.onCompleted: {
		strip.show();
	}
}
