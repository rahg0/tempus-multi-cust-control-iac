package Cx
import data.generic.common as common_lib

CxPolicy[result] {
    module := input.document[i].module[name]
	roles := module.roles
	role := roles[_]

	contains(role, "roles/viewer")

	result := {
		"documentId": input.document[i].id,
		"resourceType": "module",
		"resourceName": input.document[i].id,
		"searchKey": sprintf("%s.roles", [input.document[i].id]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "roles should not include roles/viewer",
		"keyActualValue": sprintf("roles includes %s", [role]),
#                "searchLine": common_lib.build_search_line(["module", "opus_viewer_bindings", "roles"], []),
                 "searchLine": common_lib.build_search_line(["module", name, "roles"], []),
	}
}
