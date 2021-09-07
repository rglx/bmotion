#
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

bMotion_plugin_add_action_complex "hugs" "^(hugs|snuggles|huggles|knuffelt) %botnicks" 100 bMotion_plugin_complex_action_hugs "en"

proc bMotion_plugin_complex_action_hugs { nick host handle channel text } {
  bMotionGetUnLonely
  bMotionGetHappy
  bMotionDoAction $channel $nick "%VAR{smiles}"
  bMotionDoAction $channel $nick "%VAR{hugs}"
  driftFriendship $nick 2
  return 1
}
