#!/usr/bin/env tclsh

# complex_respondall for bmotion: at the very end of our complex responses, if nothing else has been triggered, say things from the respondalls abstracts lists
# updated to use a configuration variable by rglx

if {[bMotion_setting_get "respondAllEnabled"]} {
	bMotion_plugin_add_complex "zzzz_respondall" "%botnicks" 100 "bMotion_plugin_complex_respondall" "en"
}

proc bMotion_plugin_complex_respondall { nick host handle channel text } {
	bMotionDoAction $channel $nick "%VAR{respondalls}"

	# we return 0 here to avoid incrementing the flood counter for the user
	return 0
}

bMotion_abstract_register "respondalls" {
	"%VAR{randomStuff}"
	"%VAR{randomReplies}"
}

