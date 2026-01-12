extends Node

func get_timestamp() -> String:
	var t = Time.get_datetime_dict_from_system()
	return "%04d-%02d-%02d %02d:%02d:%02d" % [
		t.year, t.month, t.day,
		t.hour, t.minute, t.second
	]


func save_to_csv(is_sprinting : bool, coins_collected : int):
	var file_path = "user://game_data.csv"
	var file_exists = FileAccess.file_exists(file_path)

	var file = FileAccess.open(file_path, FileAccess.WRITE_READ)
	file.seek_end()

	# Write header only once
	if not file_exists:
		file.store_line("timestamp,is_sprinting,coins_collected")

	var timestamp = get_timestamp()
	var line = "%s,%s,%d" % [timestamp, is_sprinting, coins_collected]

	file.store_line(line)
	file.close()
