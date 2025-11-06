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
	color:Qt.rgba(0,0,0,0.0)
	property bool outputOnly:true
	property alias rectY: rect.y
	property alias heightStrip: rect.height
	property alias colorStrip:rect.color
	property alias opacityStrip:rect.opacity
	property alias borderTopHeight: borderTop.height
	property alias borderBottomHeight: borderBottom.height
	property alias borderTopColor: borderTop.color
	property alias borderBottomColor: borderBottom.color
	property alias borderTopOpacity:borderTop.opacity
	property alias borderBottomOpacity:borderBottom.opacity
	visible: false
	Rectangle {
		id:borderTop
		color:strip.borderTopColor
		height:strip.borderTopHeight
		width:parent.width
		visible:true
		opacity:strip.borderTopOpacity
		y:rect.y-height
	}
	Rectangle {
		id:rect
		color:strip.colorStrip
		height:strip.heightStrip
		width:parent.width
		visible:true
		opacity:strip.opacityStrip
	}
	Rectangle {
		id:borderBottom
		color:strip.borderBottomColor
		height:strip.borderBottomHeight
		width:parent.width
		visible:true
		opacity:strip.borderBottomOpacity
		y:rect.y+rect.height
	}
	Component.onCompleted: {
		strip.show();
	}
}
