#
# vim: fdm=indent fdn=1

###############################################################################
# This is a bMotion plugin
# Copyright (C) James Michael Seward 2000-2008
#
# This program is covered by the GPL, please refer the to LICENCE file in the
# distribution; further information can be found in the headers of the scripts
# in the modules directory.
###############################################################################

bMotion_plugin_add_action_complex "balefires" "^balefires" 100 bMotion_plugin_complex_action_balefires "en"

proc bMotion_plugin_complex_action_balefires { nick host handle channel text } {
	global botnicks
	if [regexp -nocase "^balefires (.+)" $text ming who] {
		global bMotionInfo
		if [regexp -nocase $botnicks $who] {
			putcmdlog "bMotion - got balefired by ${nick} (${handle}), sad++ lonely-- friend--"
			bMotionDoAction $channel $nick "%VAR{balefired}"
			bMotionGetUnLonely
			bMotionGetSad
			driftFriendship $nick -1
		} else {
			if {$bMotionInfo(balefire) != 1} { return 0 }
			if {![onchan $who $channel]} {
				# allow us to balefire entire rooms full of people (for maximum annoyance efficiency)
				if {[string compare -nocase $who $channel]} { 
					putcmdlog "bMotion - balefire activated by ${nick} (${handle}), but it wasn't targetting anything reasonable. ignoring."
					return 0
				}
				putcmdlog "bMotion - balefire activated by ${nick} (${handle}), targetting all of ${channel}"
				putserv "PRIVMSG $channel :Sorry, all of ${channel} stopped existing a few minutes ago. Please sit down and be quiet until you are woven into the pattern again."
			} else {
				putcmdlog "bMotion - balefire activated by ${nick} (${handle}), targetting $who specifically"
				putserv "PRIVMSG $who :Sorry, you stopped existing a few minutes ago. Please sit down and be quiet until you are woven into the pattern again."
			}
		}
		return 1
	}
	return 0
}
