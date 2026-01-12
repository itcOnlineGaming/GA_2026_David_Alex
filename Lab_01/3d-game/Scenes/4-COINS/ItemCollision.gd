extends StaticBody3D

var CoinPoints

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.name == "Hit_box":
		CoinPoints.spawn_new_coin()
		self.queue_free()
