@tool
class_name RiskyGit extends Node
## Riskily does git stuff.

@export_tool_button("git add .") var git_add
@export_tool_button("git commit -m") var git_commit
@export var commitMessage : String = ""
@export_tool_button("git push") var git_push
@export_tool_button("AOTA") var git_allofit
@export_tool_button("CurrentPath") var current_path

func _init() -> void:
	git_add = add_files_to_git
	git_commit = commit_to_git
	git_push = push_to_git
	current_path = print_current_path

func add_files_to_git() -> void:
	var output = []
	var command : String = "git add ."
	OS.execute("CMD.exe", ["/C", command], output, true, true)
	print(output)
	
func commit_to_git() -> void:
	var output = []
	var command : String = "git commit -m"
	if (_validate_commit_message(commitMessage)):
		OS.execute("CMD.exe", ["/C", command], output, true, true)
		print(output)
	else:
		printerr("commitMessage failed validation")

func _validate_commit_message(msg : String) -> bool:
	if (typeof(msg) == TYPE_STRING):
		return true
	else:
		return false

func push_to_git() -> void:
	var output = []
	var command : String = "git push"
	OS.execute("CMD.exe", ["/C", command], output, true, true)
	print(output)

func print_current_path() -> void:
	var output = []
	var command : String = "pwd"
	OS.execute("CMD.exe", ["/C", command], output, true, true)
	print(output)
