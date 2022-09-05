/* -*- mode: c++ -*-
 * Atreus -- Chrysalis-enabled Sketch for the Keyboardio Atreus
 * Copyright (C) 2018, 2019  Keyboard.io, Inc
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 */

/**
If some permission issues occur when uploading the firmware to the keyboard,
udev might be at fault, the following can help:
$ wget https://raw.githubusercontent.com/keyboardio/Kaleidoscope/master/etc/60-kaleidoscope.rules
$ sudo cp 60-kaleidoscope.rules /etc/udev/rules.d

$ sudo /etc/init.d/udev reload
OR
$ sudo udevadm control --reload-rules && sudo udevadm trigger

The current user might also need to belong to the dialout group:
sudo usermod -a -G dialout <username>
sudo chmod a+rw /dev/ttyACM0
*/

#ifndef BUILD_INFORMATION
#define BUILD_INFORMATION "locally built"
#endif

#include "Kaleidoscope.h"
#include "Kaleidoscope-EEPROM-Settings.h"
#include "Kaleidoscope-FocusSerial.h"
#include "Kaleidoscope-Macros.h"
#include "Kaleidoscope-MouseKeys.h"
#include "Kaleidoscope-OneShot.h"
#include "Kaleidoscope-Qukeys.h"
#include "Kaleidoscope-CharShift.h"
#include "Kaleidoscope-SpaceCadet.h"


#define MO(n) ShiftToLayer(n)
#define TG(n) LockLayer(n)

enum {
  MACRO_QWERTY,
  MACRO_VERSION_INFO
};

#define Key_Exclamation LSHIFT(Key_1)
#define Key_At LSHIFT(Key_2)
#define Key_Hash LSHIFT(Key_3)
#define Key_Dollar LSHIFT(Key_4)
#define Key_Percent LSHIFT(Key_5)
#define Key_Caret LSHIFT(Key_6)
#define Key_And LSHIFT(Key_7)
#define Key_Star LSHIFT(Key_8)
#define Key_Plus LSHIFT(Key_Equals)

// Dvorak keys
#define DvorakKey_LeftBracket Key_Minus
#define DvorakKey_LeftCurlyBracket LSHIFT(Key_Minus)
#define DvorakKey_RightBracket Key_Equals
#define DvorakKey_RightCurlyBracket LSHIFT(Key_Equals)

enum {
  QWERTY,
  FUN,
  UPPER
};

/* *INDENT-OFF* */
KEYMAPS(
  [QWERTY] = KEYMAP
  (
       Key_Q   ,Key_W           ,Key_E           ,Key_R         ,Key_T                                  ,Key_Y         ,Key_U   ,Key_I        ,Key_O        ,Key_P
      ,Key_A   ,Key_S           ,Key_D           ,Key_F         ,Key_G                                  ,Key_H         ,Key_J   ,Key_K        ,Key_L        ,Key_Semicolon
      ,Key_Z   ,Key_X           ,Key_C           ,Key_V         ,Key_B     ,Key_Backtick ,Key_Backslash ,Key_N         ,Key_M   ,Key_Comma    ,Key_Period   ,Key_Slash
      ,Key_Esc ,Key_LeftGui     ,Key_LeftControl ,Key_LeftShift ,Key_Space ,Key_Tab      ,Key_Backspace ,Key_Enter     ,MO(FUN) ,Key_LeftAlt  ,Key_RightAlt ,___
  ),

  [FUN] = KEYMAP
  (
       DvorakKey_LeftCurlyBracket ,DvorakKey_LeftBracket ,Key_UpArrow        ,DvorakKey_RightBracket ,DvorakKey_RightCurlyBracket                       ,Key_PageUp   ,Key_7 ,Key_8 ,Key_9              ,CS(0)
      ,Key_LeftParen              ,Key_LeftArrow         ,Key_DownArrow      ,Key_RightArrow         ,Key_RightParen                                    ,Key_PageDown ,Key_4 ,Key_5 ,Key_6              ,Key_Quote
      ,CS(1)                      ,Key_At                ,Key_Hash           ,Key_Dollar             ,Key_Percent                ,Key_Caret ,Key_And    ,Key_Star     ,Key_1 ,Key_2 ,Key_3              ,Key_RightBracket
      ,TG(UPPER)                  ,Key_LeftGui           ,Key_LeftControl    ,Key_LeftShift          ,Key_Space                  ,Key_Tab   ,Key_Delete ,Key_Enter    ,___,   Key_0 ,LSHIFT(Key_Insert) ,Key_RightAlt
   ),

  [UPPER] = KEYMAP
  (
       Key_Insert            ,Key_Home                 ,Key_UpArrow   ,Key_End        ,Key_PageUp             ,Key_UpArrow   ,Key_F7              ,Key_F8          ,Key_F9         ,Key_F10
      ,Key_Delete            ,Key_LeftArrow            ,Key_DownArrow ,Key_RightArrow ,Key_PageDown           ,Key_DownArrow ,Key_F4              ,Key_F5          ,Key_F6         ,Key_F11
      ,M(MACRO_VERSION_INFO) ,Consumer_VolumeIncrement ,XXX           ,XXX            ,___          ,___ ,___ ,XXX           ,Key_F1              ,Key_F2          ,Key_F3         ,Key_F12
      ,MoveToLayer(QWERTY)   ,Consumer_VolumeDecrement ,___           ,___            ,___          ,___ ,___ ,___           ,MoveToLayer(QWERTY) ,Key_PrintScreen ,Key_ScrollLock ,Consumer_PlaySlashPause
   )
)
/* *INDENT-ON* */

KALEIDOSCOPE_INIT_PLUGINS(
  EEPROMSettings,
  Focus,
  FocusEEPROMCommand,
  FocusSettingsCommand,
  Qukeys,
  CharShift,
  SpaceCadet,
  OneShot,
  Macros,
  MouseKeys
);

const macro_t *macroAction(uint8_t macroIndex, uint8_t keyState) {
  switch (macroIndex) {
  case MACRO_QWERTY:
    // This macro is currently unused, but is kept around for compatibility
    // reasons. We used to use it in place of `MoveToLayer(QWERTY)`, but no
    // longer do. We keep it so that if someone still has the old layout with
    // the macro in EEPROM, it will keep working after a firmware update.
    Layer.move(QWERTY);
    break;
  case MACRO_VERSION_INFO:
    if (keyToggledOn(keyState)) {
      Macros.type(PSTR("Keyboardio Atreus - Kaleidoscope "));
      Macros.type(PSTR(BUILD_INFORMATION));
    }
    break;
  default:
    break;
  }

  return MACRO_NONE;
}

void setup() {
  QUKEYS(
    kaleidoscope::plugin::Qukey(0, KeyAddr(3, 5), Key_LeftControl),   // Tab/Ctrl
  )
  Qukeys.activate();
  CS_KEYS(
    kaleidoscope::plugin::CharShift::KeyPair(Key_Exclamation, LSHIFT(Key_LeftBracket)),
    kaleidoscope::plugin::CharShift::KeyPair(Key_LeftBracket, Key_NoKey)
  );
  Kaleidoscope.setup();
  SpaceCadet.disable();
}

void loop() {
  Kaleidoscope.loop();
}
