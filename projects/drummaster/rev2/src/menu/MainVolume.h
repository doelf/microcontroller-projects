#ifndef MAINVOLUME_H
#define MAINVOLUME_H

#include <EEPROM/EEPROM.h>

#include "Menu.h"
#include "../hardware.h"

namespace digitalcave {

	class MainVolume : public Menu {
	
		private:
			uint8_t volume;
			
		public:
			static void loadVolumeFromEeprom();
			static void saveVolumeToEeprom();
			
			MainVolume();
			Menu* handleAction();
	};
}

#endif