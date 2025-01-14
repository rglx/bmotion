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

bMotion_plugin_add_complex "sport" "^!sport" 100 bMotion_plugin_complex_sport "en"

proc bMotion_plugin_complex_sport { nick host handle channel text } {
  if [regexp -nocase "^!sport( adult| xxx)?$" $text blah adult] {
    if {$adult != ""} {
      bMotionDoAction $channel "" "%VAR{sport_adult_superadjectives} %VAR{sport_adult_adjectives} %VAR{sport_adult_sports}"
      return 1
    } else {
      bMotionDoAction $channel "" "%VAR{sport_superadjectives} %VAR{sport_adjectives} %VAR{sport_sports}"
      return 1
    }
  }
}

bMotion_abstract_register "sport_superadjectives" {
  "extreme"
  "super"
  "ultra"
  "uber"
  "radical"
  "mega"
  "hot"
  "amazing"
  "massive"
  "nice"
  "large"
  "pro"
  "midget"
  "micro"
  "nano"
  "energetic"
  "rechargable"
  "caffinated"
  "diet"
  "full-fat"
  "semi-skimmed"
  "warm"
  "amateur"
  "eXtreme"
  "full-contact"
  "world championship"
  "olympic"
	"human-powered"
	"wetsuit"
	"legendary"
	"offroad"
	"sprint"
	"artistic"
	"pocket"
	"gaelic"
	"boring"
}

bMotion_abstract_register "sport_adjectives" {
  "downhill"
  "uphill"
  "sideways"
  "horizontal"
  "vertical"
  "underwater"
  "overland"
  "zero-G"
  "unicycle"
  "supercharged"
  "turbocharged"
  "orange"
  "furry"
  "cheese"
  "battered"
  "marinated"
  "reverse"
  "backwards"
  "upside-down"
  "speed"
  "salamander"
  "chocolate"
  "electric"
  "smooth"
  "mud"
  "tar pit"
  "sulfuric acid"
  "cordless"
  "polo"
  "monster-truck"
  "thimble"
}

bMotion_abstract_register "sport_sports" {
	"archery"
	"athletics"
	"badminton"
	"basketball"
	"beach volleyball"
	"boxing"
	"canoeing"
	"cycling"
	"diving"
	"equestrian"
	"fencing"
	"football"
	"gymnastics"
	"handball"
	"field hockey"
	"judo"
	"modern pentathlon"
	"rowing"
	"rugby"
	"sailing"
	"shooting"
	"swimming"
	"synchronized swimming"
	"table tennis"
	"taekwondo"
	"tennis"
	"triathlon"
	"volleyball"
	"weightlifting"
	"wrestling"
	"geocaching"
	"canoeing"
	"backstroke"
	"breaststroke"
	"butterfly stroke"
	"freestyle swimming"
	"individual Medley"
	"synchronized swimming"
	"medley relay"
  "football"
  "American Football"
  "basketball"
  "snowboarding"
  "sking"
  "rallying"
  "Formula 1"
  "tennis"
  "badminton"
  "boxing"
  "wrestling"
  "jogging"
  "NASCAR"
  "lacross"
  "bobsled"
  "Llama racing"
  "10-pin bowling"
  "shove ha'penny"
  "hockey"
  "ice hockey"
  "bridge"
  "Twister"
  "Scalextric(tm)"
  "bungee jumping"
  "line dancing"
  "golf"
  "chess"
  "Monopoly"
  "Draughts"
  "wind-surfing"
  "web surfing"
  "leap-frog"
  "migdet tossing"
  "window cleaning"
  "lavatory flushing"
  "drinking"
  "eating"
  "singing"
  "poker"
  "Uno"
  "jumping"
  "aging"
  "long jump"
  "vaulting"
  "diving"
  "circus"
}

bMotion_abstract_register "sport_adult_superadjectives_t" {
  "nude"
  "horny"
  "sticky"
  "moist"
  "seeing-impared"
  "animated"
}

bMotion_abstract_register "sport_adult_adjectives_t" {
  "bent"
  "%ruser"
  "facial"
  "greased"
  "hand-cuffed"
  "rubber"
  "bottom"
  "lingerie"
  "wife"
  "husband"
}

bMotion_abstract_register "sport_adult_sports_t" {
  "chicken fancying"
	"vomiting"
  "horthy riding (wahey)"
  "sex"
  "swapping"
  "tossing"
  "strip-tease"
  "gibbon tickling"
  "spanking"
  "groin grinding"
  "moaning"
  "licking"
}

#create the big lists :)
bMotion_abstract_register "sport_adult_superadjectives" {
  "%VAR{sport_adjectives}"
  "%VAR{sport_adult_superadjectives_t}"
	"%VAR{scrap_adult_adjectives_t}"
}
bMotion_abstract_register "sport_adult_adjectives" {
  "%VAR{sport_adjectives}"
  "%VAR{sport_adult_adjectives_t}"
	"%VAR{scrap_adult_construction_t}"
}
bMotion_abstract_register "sport_adult_sports" {
  "%VAR{sport_sports}"
  "%VAR{sport_adult_sports_t}"
}
