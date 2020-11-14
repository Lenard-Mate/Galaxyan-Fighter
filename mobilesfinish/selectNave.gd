extends Node2D


var admob = null
var isTop = false
var isReal = false
var adBanner = 'ca-app-pub-3940256099942544/6300978111' 
var adInterstitial = 'ca-app-pub-3940256099942544/1033173712'
var adrewarded = 'ca-app-pub-3940256099942544/5224354917'
# Called when the node enters the scene tree for the first time.

func _ready():
	$Skin.disabled = true;
	if Engine.has_singleton('AdMob'):
		admob = Engine.get_singleton('AdMob')
		admob.init(isReal,get_instance_id())
		admob.loadBanner(adBanner,isTop)
		admob.loadInterstitial(adInterstitial)
		admob.loadRewardedVideo(adrewarded)
		admob.resize()

func _on_standardSkin_pressed():
	pass # Replace with function body.


func _on_Skin_pressed():
	pass # Replace with function body.


func _on_Back_pressed():
	get_tree().change_scene("res://titleScreen.tscn")	


func _on_watch_pressed():
	$Skin.disabled = false;
	admob.showRewardedVideo()

func _on_rewarded_video_ad_closed():
	admob.loadRewardedVideo(adrewarded)	
