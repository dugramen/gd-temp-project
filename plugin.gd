extends Control

var helpers := preload("res://project-manager/inspect/helpers.gd")
var gdx := preload("res://editor-only/included/gdx.gd").new()
var Paths := preload("res://editor-only/included/paths.gd")

var hbox := HBoxContainer.new()

func _enter_tree() -> void:
	var project_list: Node = helpers.extract_node([0, 1, 0, 1, 0, 1, 0, 0])
	var vbox: VBoxContainer = project_list.get_child(0, true)
	#vbox.add_child(hbox)
	#vbox.move_child(hbox, 0)
	
	
	gdx.render(func(): return (
		[project_list, [
			[VBoxContainer, [
				[hbox, [
					[Button, {
						text = "Temp Project",
						on_pressed = func():
							var new_path := helpers.create_project(Paths.global.path_join("project-manager/temp-project/.project/"))
							print(new_path)
							open_project(new_path)
							pass,
					}],
					[Button, {
						text = "Global Project"
					}]
				]],
				[vbox]
			]]
		]]
	))



func open_project(path: String):
	OS.create_instance([path, "-editor"])

func _exit_tree() -> void:
	hbox.queue_free()
