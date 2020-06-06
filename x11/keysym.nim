#
#Converted from X11/keysym.h and X11/keysymdef.h
#
#Capital letter consts renamed from XK_... to XKc_...
# (since Pascal isn't case-sensitive)
#
#i.e.
#C      Pascal
#XK_a   XK_a
#XK_A   XKc_A
#

#* default keysyms *
import x

const
  XK_VoidSymbol*: KeySym = 0x00FFFFFF # void symbol

when defined(XK_MISCELLANY) or true:
  const
    #*
    # * TTY Functions, cleverly chosen to map to ascii, for convenience of
    # * programming, but could have been arbitrary (at the cost of lookup
    # * tables in client code.
    # *
    XK_BackSpace*: KeySym = 0x0000FF08  # back space, back char
    XK_Tab*: KeySym = 0x0000FF09
    XK_Linefeed*: KeySym = 0x0000FF0A   # Linefeed, LF
    XK_Clear*: KeySym = 0x0000FF0B
    XK_Return*: KeySym = 0x0000FF0D     # Return, enter
    XK_Pause*: KeySym = 0x0000FF13      # Pause, hold
    XK_Scroll_Lock*: KeySym = 0x0000FF14
    XK_Sys_Req*: KeySym = 0x0000FF15
    XK_Escape*: KeySym = 0x0000FF1B
    XK_Delete*: KeySym = 0x0000FFFF     # Delete, rubout \
                                # International & multi-key character composition
    XK_Multi_key*: KeySym = 0x0000FF20  # Multi-key character compose
    XK_Codeinput*: KeySym = 0x0000FF37
    XK_SingleCandidate*: KeySym = 0x0000FF3C
    XK_MultipleCandidate*: KeySym = 0x0000FF3D
    XK_PreviousCandidate*: KeySym = 0x0000FF3E # Japanese keyboard support
    XK_Kanji*: KeySym = 0x0000FF21      # Kanji, Kanji convert
    XK_Muhenkan*: KeySym = 0x0000FF22   # Cancel Conversion
    XK_Henkan_Mode*: KeySym = 0x0000FF23 # Start/Stop Conversion
    XK_Henkan*: KeySym = 0x0000FF23     # Alias for Henkan_Mode
    XK_Romaji*: KeySym = 0x0000FF24     # to Romaji
    XK_Hiragana*: KeySym = 0x0000FF25   # to Hiragana
    XK_Katakana*: KeySym = 0x0000FF26   # to Katakana
    XK_Hiragana_Katakana*: KeySym = 0x0000FF27 # Hiragana/Katakana toggle
    XK_Zenkaku*: KeySym = 0x0000FF28    # to Zenkaku
    XK_Hankaku*: KeySym = 0x0000FF29    # to Hankaku
    XK_Zenkaku_Hankaku*: KeySym = 0x0000FF2A # Zenkaku/Hankaku toggle
    XK_Touroku*: KeySym = 0x0000FF2B    # Add to Dictionary
    XK_Massyo*: KeySym = 0x0000FF2C     # Delete from Dictionary
    XK_Kana_Lock*: KeySym = 0x0000FF2D  # Kana Lock
    XK_Kana_Shift*: KeySym = 0x0000FF2E # Kana Shift
    XK_Eisu_Shift*: KeySym = 0x0000FF2F # Alphanumeric Shift
    XK_Eisu_toggle*: KeySym = 0x0000FF30 # Alphanumeric toggle
    XK_Kanji_Bangou*: KeySym = 0x0000FF37 # Codeinput
    XK_Zen_Koho*: KeySym = 0x0000FF3D   # Multiple/All Candidate(s)
    XK_Mae_Koho*: KeySym = 0x0000FF3E   # Previous Candidate \
                                # = $FF31 thru = $FF3F are under XK_KOREAN
                                # Cursor control & motion
    XK_Home*: KeySym = 0x0000FF50
    XK_Left*: KeySym = 0x0000FF51       # Move left, left arrow
    XK_Up*: KeySym = 0x0000FF52         # Move up, up arrow
    XK_Right*: KeySym = 0x0000FF53      # Move right, right arrow
    XK_Down*: KeySym = 0x0000FF54       # Move down, down arrow
    XK_Prior*: KeySym = 0x0000FF55      # Prior, previous
    XK_Page_Up*: KeySym = 0x0000FF55
    XK_Next*: KeySym = 0x0000FF56       # Next
    XK_Page_Down*: KeySym = 0x0000FF56
    XK_End*: KeySym = 0x0000FF57        # EOL
    XK_Begin*: KeySym = 0x0000FF58      # BOL \
                                # Misc Functions
    XK_Select*: KeySym = 0x0000FF60     # Select, mark
    XK_Print*: KeySym = 0x0000FF61
    XK_Execute*: KeySym = 0x0000FF62    # Execute, run, do
    XK_Insert*: KeySym = 0x0000FF63     # Insert, insert here
    XK_Undo*: KeySym = 0x0000FF65       # Undo, oops
    XK_Redo*: KeySym = 0x0000FF66       # redo, again
    XK_Menu*: KeySym = 0x0000FF67
    XK_Find*: KeySym = 0x0000FF68       # Find, search
    XK_Cancel*: KeySym = 0x0000FF69     # Cancel, stop, abort, exit
    XK_Help*: KeySym = 0x0000FF6A       # Help
    XK_Break*: KeySym = 0x0000FF6B
    XK_Mode_switch*: KeySym = 0x0000FF7E # Character set switch
    XK_script_switch*: KeySym = 0x0000FF7E # Alias for mode_switch
    XK_Num_Lock*: KeySym = 0x0000FF7F   # Keypad Functions, keypad numbers cleverly chosen to map to ascii
    XK_KP_Space*: KeySym = 0x0000FF80   # space
    XK_KP_Tab*: KeySym = 0x0000FF89
    XK_KP_Enter*: KeySym = 0x0000FF8D   # enter
    XK_KP_F1*: KeySym = 0x0000FF91      # PF1, KP_A, ...
    XK_KP_F2*: KeySym = 0x0000FF92
    XK_KP_F3*: KeySym = 0x0000FF93
    XK_KP_F4*: KeySym = 0x0000FF94
    XK_KP_Home*: KeySym = 0x0000FF95
    XK_KP_Left*: KeySym = 0x0000FF96
    XK_KP_Up*: KeySym = 0x0000FF97
    XK_KP_Right*: KeySym = 0x0000FF98
    XK_KP_Down*: KeySym = 0x0000FF99
    XK_KP_Prior*: KeySym = 0x0000FF9A
    XK_KP_Page_Up*: KeySym = 0x0000FF9A
    XK_KP_Next*: KeySym = 0x0000FF9B
    XK_KP_Page_Down*: KeySym = 0x0000FF9B
    XK_KP_End*: KeySym = 0x0000FF9C
    XK_KP_Begin*: KeySym = 0x0000FF9D
    XK_KP_Insert*: KeySym = 0x0000FF9E
    XK_KP_Delete*: KeySym = 0x0000FF9F
    XK_KP_Equal*: KeySym = 0x0000FFBD   # equals
    XK_KP_Multiply*: KeySym = 0x0000FFAA
    XK_KP_Add*: KeySym = 0x0000FFAB
    XK_KP_Separator*: KeySym = 0x0000FFAC # separator, often comma
    XK_KP_Subtract*: KeySym = 0x0000FFAD
    XK_KP_Decimal*: KeySym = 0x0000FFAE
    XK_KP_Divide*: KeySym = 0x0000FFAF
    XK_KP_0*: KeySym = 0x0000FFB0
    XK_KP_1*: KeySym = 0x0000FFB1
    XK_KP_2*: KeySym = 0x0000FFB2
    XK_KP_3*: KeySym = 0x0000FFB3
    XK_KP_4*: KeySym = 0x0000FFB4
    XK_KP_5*: KeySym = 0x0000FFB5
    XK_KP_6*: KeySym = 0x0000FFB6
    XK_KP_7*: KeySym = 0x0000FFB7
    XK_KP_8*: KeySym = 0x0000FFB8
    XK_KP_9*: KeySym = 0x0000FFB9 #*\
                          # * Auxilliary Functions; note the duplicate definitions for left and right
                          # * function keys;  Sun keyboards and a few other manufactures have such
                          # * function key groups on the left and/or right sides of the keyboard.
                          # * We've not found a keyboard with more than 35 function keys total.
                          # *
    XK_F1*: KeySym = 0x0000FFBE
    XK_F2*: KeySym = 0x0000FFBF
    XK_F3*: KeySym = 0x0000FFC0
    XK_F4*: KeySym = 0x0000FFC1
    XK_F5*: KeySym = 0x0000FFC2
    XK_F6*: KeySym = 0x0000FFC3
    XK_F7*: KeySym = 0x0000FFC4
    XK_F8*: KeySym = 0x0000FFC5
    XK_F9*: KeySym = 0x0000FFC6
    XK_F10*: KeySym = 0x0000FFC7
    XK_F11*: KeySym = 0x0000FFC8
    XK_L1*: KeySym = 0x0000FFC8
    XK_F12*: KeySym = 0x0000FFC9
    XK_L2*: KeySym = 0x0000FFC9
    XK_F13*: KeySym = 0x0000FFCA
    XK_L3*: KeySym = 0x0000FFCA
    XK_F14*: KeySym = 0x0000FFCB
    XK_L4*: KeySym = 0x0000FFCB
    XK_F15*: KeySym = 0x0000FFCC
    XK_L5*: KeySym = 0x0000FFCC
    XK_F16*: KeySym = 0x0000FFCD
    XK_L6*: KeySym = 0x0000FFCD
    XK_F17*: KeySym = 0x0000FFCE
    XK_L7*: KeySym = 0x0000FFCE
    XK_F18*: KeySym = 0x0000FFCF
    XK_L8*: KeySym = 0x0000FFCF
    XK_F19*: KeySym = 0x0000FFD0
    XK_L9*: KeySym = 0x0000FFD0
    XK_F20*: KeySym = 0x0000FFD1
    XK_L10*: KeySym = 0x0000FFD1
    XK_F21*: KeySym = 0x0000FFD2
    XK_R1*: KeySym = 0x0000FFD2
    XK_F22*: KeySym = 0x0000FFD3
    XK_R2*: KeySym = 0x0000FFD3
    XK_F23*: KeySym = 0x0000FFD4
    XK_R3*: KeySym = 0x0000FFD4
    XK_F24*: KeySym = 0x0000FFD5
    XK_R4*: KeySym = 0x0000FFD5
    XK_F25*: KeySym = 0x0000FFD6
    XK_R5*: KeySym = 0x0000FFD6
    XK_F26*: KeySym = 0x0000FFD7
    XK_R6*: KeySym = 0x0000FFD7
    XK_F27*: KeySym = 0x0000FFD8
    XK_R7*: KeySym = 0x0000FFD8
    XK_F28*: KeySym = 0x0000FFD9
    XK_R8*: KeySym = 0x0000FFD9
    XK_F29*: KeySym = 0x0000FFDA
    XK_R9*: KeySym = 0x0000FFDA
    XK_F30*: KeySym = 0x0000FFDB
    XK_R10*: KeySym = 0x0000FFDB
    XK_F31*: KeySym = 0x0000FFDC
    XK_R11*: KeySym = 0x0000FFDC
    XK_F32*: KeySym = 0x0000FFDD
    XK_R12*: KeySym = 0x0000FFDD
    XK_F33*: KeySym = 0x0000FFDE
    XK_R13*: KeySym = 0x0000FFDE
    XK_F34*: KeySym = 0x0000FFDF
    XK_R14*: KeySym = 0x0000FFDF
    XK_F35*: KeySym = 0x0000FFE0
    XK_R15*: KeySym = 0x0000FFE0        # Modifiers
    XK_Shift_L*: KeySym = 0x0000FFE1    # Left shift
    XK_Shift_R*: KeySym = 0x0000FFE2    # Right shift
    XK_Control_L*: KeySym = 0x0000FFE3  # Left control
    XK_Control_R*: KeySym = 0x0000FFE4  # Right control
    XK_Caps_Lock*: KeySym = 0x0000FFE5  # Caps lock
    XK_Shift_Lock*: KeySym = 0x0000FFE6 # Shift lock
    XK_Meta_L*: KeySym = 0x0000FFE7     # Left meta
    XK_Meta_R*: KeySym = 0x0000FFE8     # Right meta
    XK_Alt_L*: KeySym = 0x0000FFE9      # Left alt
    XK_Alt_R*: KeySym = 0x0000FFEA      # Right alt
    XK_Super_L*: KeySym = 0x0000FFEB    # Left super
    XK_Super_R*: KeySym = 0x0000FFEC    # Right super
    XK_Hyper_L*: KeySym = 0x0000FFED    # Left hyper
    XK_Hyper_R*: KeySym = 0x0000FFEE    # Right hyper
# XK_MISCELLANY
#*
# * ISO 9995 Function and Modifier Keys
# * Byte 3 = = $FE
# *

when defined(XK_XKB_KEYS) or true:
  const
    XK_ISO_Lock*: KeySym = 0x0000FE01
    XK_ISO_Level2_Latch*: KeySym = 0x0000FE02
    XK_ISO_Level3_Shift*: KeySym = 0x0000FE03
    XK_ISO_Level3_Latch*: KeySym = 0x0000FE04
    XK_ISO_Level3_Lock*: KeySym = 0x0000FE05
    XK_ISO_Group_Shift*: KeySym = 0x0000FF7E # Alias for mode_switch
    XK_ISO_Group_Latch*: KeySym = 0x0000FE06
    XK_ISO_Group_Lock*: KeySym = 0x0000FE07
    XK_ISO_Next_Group*: KeySym = 0x0000FE08
    XK_ISO_Next_Group_Lock*: KeySym = 0x0000FE09
    XK_ISO_Prev_Group*: KeySym = 0x0000FE0A
    XK_ISO_Prev_Group_Lock*: KeySym = 0x0000FE0B
    XK_ISO_First_Group*: KeySym = 0x0000FE0C
    XK_ISO_First_Group_Lock*: KeySym = 0x0000FE0D
    XK_ISO_Last_Group*: KeySym = 0x0000FE0E
    XK_ISO_Last_Group_Lock*: KeySym = 0x0000FE0F
    XK_ISO_Left_Tab*: KeySym = 0x0000FE20
    XK_ISO_Move_Line_Up*: KeySym = 0x0000FE21
    XK_ISO_Move_Line_Down*: KeySym = 0x0000FE22
    XK_ISO_Partial_Line_Up*: KeySym = 0x0000FE23
    XK_ISO_Partial_Line_Down*: KeySym = 0x0000FE24
    XK_ISO_Partial_Space_Left*: KeySym = 0x0000FE25
    XK_ISO_Partial_Space_Right*: KeySym = 0x0000FE26
    XK_ISO_Set_Margin_Left*: KeySym = 0x0000FE27
    XK_ISO_Set_Margin_Right*: KeySym = 0x0000FE28
    XK_ISO_Release_Margin_Left*: KeySym = 0x0000FE29
    XK_ISO_Release_Margin_Right*: KeySym = 0x0000FE2A
    XK_ISO_Release_Both_Margins*: KeySym = 0x0000FE2B
    XK_ISO_Fast_Cursor_Left*: KeySym = 0x0000FE2C
    XK_ISO_Fast_Cursor_Right*: KeySym = 0x0000FE2D
    XK_ISO_Fast_Cursor_Up*: KeySym = 0x0000FE2E
    XK_ISO_Fast_Cursor_Down*: KeySym = 0x0000FE2F
    XK_ISO_Continuous_Underline*: KeySym = 0x0000FE30
    XK_ISO_Discontinuous_Underline*: KeySym = 0x0000FE31
    XK_ISO_Emphasize*: KeySym = 0x0000FE32
    XK_ISO_Center_Object*: KeySym = 0x0000FE33
    XK_ISO_Enter*: KeySym = 0x0000FE34
    XK_dead_grave*: KeySym = 0x0000FE50
    XK_dead_acute*: KeySym = 0x0000FE51
    XK_dead_circumflex*: KeySym = 0x0000FE52
    XK_dead_tilde*: KeySym = 0x0000FE53
    XK_dead_macron*: KeySym = 0x0000FE54
    XK_dead_breve*: KeySym = 0x0000FE55
    XK_dead_abovedot*: KeySym = 0x0000FE56
    XK_dead_diaeresis*: KeySym = 0x0000FE57
    XK_dead_abovering*: KeySym = 0x0000FE58
    XK_dead_doubleacute*: KeySym = 0x0000FE59
    XK_dead_caron*: KeySym = 0x0000FE5A
    XK_dead_cedilla*: KeySym = 0x0000FE5B
    XK_dead_ogonek*: KeySym = 0x0000FE5C
    XK_dead_iota*: KeySym = 0x0000FE5D
    XK_dead_voiced_sound*: KeySym = 0x0000FE5E
    XK_dead_semivoiced_sound*: KeySym = 0x0000FE5F
    XK_dead_belowdot*: KeySym = 0x0000FE60
    XK_dead_hook*: KeySym = 0x0000FE61
    XK_dead_horn*: KeySym = 0x0000FE62
    XK_First_Virtual_Screen*: KeySym = 0x0000FED0
    XK_Prev_Virtual_Screen*: KeySym = 0x0000FED1
    XK_Next_Virtual_Screen*: KeySym = 0x0000FED2
    XK_Last_Virtual_Screen*: KeySym = 0x0000FED4
    XK_Terminate_Server*: KeySym = 0x0000FED5
    XK_AccessX_Enable*: KeySym = 0x0000FE70
    XK_AccessX_Feedback_Enable*: KeySym = 0x0000FE71
    XK_RepeatKeys_Enable*: KeySym = 0x0000FE72
    XK_SlowKeys_Enable*: KeySym = 0x0000FE73
    XK_BounceKeys_Enable*: KeySym = 0x0000FE74
    XK_StickyKeys_Enable*: KeySym = 0x0000FE75
    XK_MouseKeys_Enable*: KeySym = 0x0000FE76
    XK_MouseKeys_Accel_Enable*: KeySym = 0x0000FE77
    XK_Overlay1_Enable*: KeySym = 0x0000FE78
    XK_Overlay2_Enable*: KeySym = 0x0000FE79
    XK_AudibleBell_Enable*: KeySym = 0x0000FE7A
    XK_Pointer_Left*: KeySym = 0x0000FEE0
    XK_Pointer_Right*: KeySym = 0x0000FEE1
    XK_Pointer_Up*: KeySym = 0x0000FEE2
    XK_Pointer_Down*: KeySym = 0x0000FEE3
    XK_Pointer_UpLeft*: KeySym = 0x0000FEE4
    XK_Pointer_UpRight*: KeySym = 0x0000FEE5
    XK_Pointer_DownLeft*: KeySym = 0x0000FEE6
    XK_Pointer_DownRight*: KeySym = 0x0000FEE7
    XK_Pointer_Button_Dflt*: KeySym = 0x0000FEE8
    XK_Pointer_Button1*: KeySym = 0x0000FEE9
    XK_Pointer_Button2*: KeySym = 0x0000FEEA
    XK_Pointer_Button3*: KeySym = 0x0000FEEB
    XK_Pointer_Button4*: KeySym = 0x0000FEEC
    XK_Pointer_Button5*: KeySym = 0x0000FEED
    XK_Pointer_DblClick_Dflt*: KeySym = 0x0000FEEE
    XK_Pointer_DblClick1*: KeySym = 0x0000FEEF
    XK_Pointer_DblClick2*: KeySym = 0x0000FEF0
    XK_Pointer_DblClick3*: KeySym = 0x0000FEF1
    XK_Pointer_DblClick4*: KeySym = 0x0000FEF2
    XK_Pointer_DblClick5*: KeySym = 0x0000FEF3
    XK_Pointer_Drag_Dflt*: KeySym = 0x0000FEF4
    XK_Pointer_Drag1*: KeySym = 0x0000FEF5
    XK_Pointer_Drag2*: KeySym = 0x0000FEF6
    XK_Pointer_Drag3*: KeySym = 0x0000FEF7
    XK_Pointer_Drag4*: KeySym = 0x0000FEF8
    XK_Pointer_Drag5*: KeySym = 0x0000FEFD
    XK_Pointer_EnableKeys*: KeySym = 0x0000FEF9
    XK_Pointer_Accelerate*: KeySym = 0x0000FEFA
    XK_Pointer_DfltBtnNext*: KeySym = 0x0000FEFB
    XK_Pointer_DfltBtnPrev*: KeySym = 0x0000FEFC
  #*
  # * 3270 Terminal Keys
  # * Byte 3 = = $FD
  # *

when defined(XK_3270) or true:
  const
    XK_3270_Duplicate*: KeySym = 0x0000FD01
    XK_3270_FieldMark*: KeySym = 0x0000FD02
    XK_3270_Right2*: KeySym = 0x0000FD03
    XK_3270_Left2*: KeySym = 0x0000FD04
    XK_3270_BackTab*: KeySym = 0x0000FD05
    XK_3270_EraseEOF*: KeySym = 0x0000FD06
    XK_3270_EraseInput*: KeySym = 0x0000FD07
    XK_3270_Reset*: KeySym = 0x0000FD08
    XK_3270_Quit*: KeySym = 0x0000FD09
    XK_3270_PA1*: KeySym = 0x0000FD0A
    XK_3270_PA2*: KeySym = 0x0000FD0B
    XK_3270_PA3*: KeySym = 0x0000FD0C
    XK_3270_Test*: KeySym = 0x0000FD0D
    XK_3270_Attn*: KeySym = 0x0000FD0E
    XK_3270_CursorBlink*: KeySym = 0x0000FD0F
    XK_3270_AltCursor*: KeySym = 0x0000FD10
    XK_3270_KeyClick*: KeySym = 0x0000FD11
    XK_3270_Jump*: KeySym = 0x0000FD12
    XK_3270_Ident*: KeySym = 0x0000FD13
    XK_3270_Rule*: KeySym = 0x0000FD14
    XK_3270_Copy*: KeySym = 0x0000FD15
    XK_3270_Play*: KeySym = 0x0000FD16
    XK_3270_Setup*: KeySym = 0x0000FD17
    XK_3270_Record*: KeySym = 0x0000FD18
    XK_3270_ChangeScreen*: KeySym = 0x0000FD19
    XK_3270_DeleteWord*: KeySym = 0x0000FD1A
    XK_3270_ExSelect*: KeySym = 0x0000FD1B
    XK_3270_CursorSelect*: KeySym = 0x0000FD1C
    XK_3270_PrintScreen*: KeySym = 0x0000FD1D
    XK_3270_Enter*: KeySym = 0x0000FD1E
#*
# *  Latin 1
# *  Byte 3 = 0
# *

when defined(XK_LATIN1) or true:
  const
    XK_space*: KeySym = 0x00000020
    XK_exclam*: KeySym = 0x00000021
    XK_quotedbl*: KeySym = 0x00000022
    XK_numbersign*: KeySym = 0x00000023
    XK_dollar*: KeySym = 0x00000024
    XK_percent*: KeySym = 0x00000025
    XK_ampersand*: KeySym = 0x00000026
    XK_apostrophe*: KeySym = 0x00000027
    XK_quoteright*: KeySym = 0x00000027 # deprecated
    XK_parenleft*: KeySym = 0x00000028
    XK_parenright*: KeySym = 0x00000029
    XK_asterisk*: KeySym = 0x0000002A
    XK_plus*: KeySym = 0x0000002B
    XK_comma*: KeySym = 0x0000002C
    XK_minus*: KeySym = 0x0000002D
    XK_period*: KeySym = 0x0000002E
    XK_slash*: KeySym = 0x0000002F
    XK_0*: KeySym = 0x00000030
    XK_1*: KeySym = 0x00000031
    XK_2*: KeySym = 0x00000032
    XK_3*: KeySym = 0x00000033
    XK_4*: KeySym = 0x00000034
    XK_5*: KeySym = 0x00000035
    XK_6*: KeySym = 0x00000036
    XK_7*: KeySym = 0x00000037
    XK_8*: KeySym = 0x00000038
    XK_9*: KeySym = 0x00000039
    XK_colon*: KeySym = 0x0000003A
    XK_semicolon*: KeySym = 0x0000003B
    XK_less*: KeySym = 0x0000003C
    XK_equal*: KeySym = 0x0000003D
    XK_greater*: KeySym = 0x0000003E
    XK_question*: KeySym = 0x0000003F
    XK_at*: KeySym = 0x00000040
    XKc_A*: KeySym = 0x00000041
    XKc_B*: KeySym = 0x00000042
    XKc_C*: KeySym = 0x00000043
    XKc_D*: KeySym = 0x00000044
    XKc_E*: KeySym = 0x00000045
    XKc_F*: KeySym = 0x00000046
    XKc_G*: KeySym = 0x00000047
    XKc_H*: KeySym = 0x00000048
    XKc_I*: KeySym = 0x00000049
    XKc_J*: KeySym = 0x0000004A
    XKc_K*: KeySym = 0x0000004B
    XKc_L*: KeySym = 0x0000004C
    XKc_M*: KeySym = 0x0000004D
    XKc_N*: KeySym = 0x0000004E
    XKc_O*: KeySym = 0x0000004F
    XKc_P*: KeySym = 0x00000050
    XKc_Q*: KeySym = 0x00000051
    XKc_R*: KeySym = 0x00000052
    XKc_S*: KeySym = 0x00000053
    XKc_T*: KeySym = 0x00000054
    XKc_U*: KeySym = 0x00000055
    XKc_V*: KeySym = 0x00000056
    XKc_W*: KeySym = 0x00000057
    XKc_X*: KeySym = 0x00000058
    XKc_Y*: KeySym = 0x00000059
    XKc_Z*: KeySym = 0x0000005A
    XK_bracketleft*: KeySym = 0x0000005B
    XK_backslash*: KeySym = 0x0000005C
    XK_bracketright*: KeySym = 0x0000005D
    XK_asciicircum*: KeySym = 0x0000005E
    XK_underscore*: KeySym = 0x0000005F
    XK_grave*: KeySym = 0x00000060
    XK_quoteleft*: KeySym = 0x00000060  # deprecated
    XK_a*: KeySym = 0x00000061
    XK_b*: KeySym = 0x00000062
    XK_c*: KeySym = 0x00000063
    XK_d*: KeySym = 0x00000064
    XK_e*: KeySym = 0x00000065
    XK_f*: KeySym = 0x00000066
    XK_g*: KeySym = 0x00000067
    XK_h*: KeySym = 0x00000068
    XK_i*: KeySym = 0x00000069
    XK_j*: KeySym = 0x0000006A
    XK_k*: KeySym = 0x0000006B
    XK_l*: KeySym = 0x0000006C
    XK_m*: KeySym = 0x0000006D
    XK_n*: KeySym = 0x0000006E
    XK_o*: KeySym = 0x0000006F
    XK_p*: KeySym = 0x00000070
    XK_q*: KeySym = 0x00000071
    XK_r*: KeySym = 0x00000072
    XK_s*: KeySym = 0x00000073
    XK_t*: KeySym = 0x00000074
    XK_u*: KeySym = 0x00000075
    XK_v*: KeySym = 0x00000076
    XK_w*: KeySym = 0x00000077
    XK_x*: KeySym = 0x00000078
    XK_y*: KeySym = 0x00000079
    XK_z*: KeySym = 0x0000007A
    XK_braceleft*: KeySym = 0x0000007B
    XK_bar*: KeySym = 0x0000007C
    XK_braceright*: KeySym = 0x0000007D
    XK_asciitilde*: KeySym = 0x0000007E
    XK_nobreakspace*: KeySym = 0x000000A0
    XK_exclamdown*: KeySym = 0x000000A1
    XK_cent*: KeySym = 0x000000A2
    XK_sterling*: KeySym = 0x000000A3
    XK_currency*: KeySym = 0x000000A4
    XK_yen*: KeySym = 0x000000A5
    XK_brokenbar*: KeySym = 0x000000A6
    XK_section*: KeySym = 0x000000A7
    XK_diaeresis*: KeySym = 0x000000A8
    XK_copyright*: KeySym = 0x000000A9
    XK_ordfeminine*: KeySym = 0x000000AA
    XK_guillemotleft*: KeySym = 0x000000AB # left angle quotation mark
    XK_notsign*: KeySym = 0x000000AC
    XK_hyphen*: KeySym = 0x000000AD
    XK_registered*: KeySym = 0x000000AE
    XK_macron*: KeySym = 0x000000AF
    XK_degree*: KeySym = 0x000000B0
    XK_plusminus*: KeySym = 0x000000B1
    XK_twosuperior*: KeySym = 0x000000B2
    XK_threesuperior*: KeySym = 0x000000B3
    XK_acute*: KeySym = 0x000000B4
    XK_mu*: KeySym = 0x000000B5
    XK_paragraph*: KeySym = 0x000000B6
    XK_periodcentered*: KeySym = 0x000000B7
    XK_cedilla*: KeySym = 0x000000B8
    XK_onesuperior*: KeySym = 0x000000B9
    XK_masculine*: KeySym = 0x000000BA
    XK_guillemotright*: KeySym = 0x000000BB # right angle quotation mark
    XK_onequarter*: KeySym = 0x000000BC
    XK_onehalf*: KeySym = 0x000000BD
    XK_threequarters*: KeySym = 0x000000BE
    XK_questiondown*: KeySym = 0x000000BF
    XKc_Agrave*: KeySym = 0x000000C0
    XKc_Aacute*: KeySym = 0x000000C1
    XKc_Acircumflex*: KeySym = 0x000000C2
    XKc_Atilde*: KeySym = 0x000000C3
    XKc_Adiaeresis*: KeySym = 0x000000C4
    XKc_Aring*: KeySym = 0x000000C5
    XKc_AE*: KeySym = 0x000000C6
    XKc_Ccedilla*: KeySym = 0x000000C7
    XKc_Egrave*: KeySym = 0x000000C8
    XKc_Eacute*: KeySym = 0x000000C9
    XKc_Ecircumflex*: KeySym = 0x000000CA
    XKc_Ediaeresis*: KeySym = 0x000000CB
    XKc_Igrave*: KeySym = 0x000000CC
    XKc_Iacute*: KeySym = 0x000000CD
    XKc_Icircumflex*: KeySym = 0x000000CE
    XKc_Idiaeresis*: KeySym = 0x000000CF
    XKc_ETH*: KeySym = 0x000000D0
    XKc_Ntilde*: KeySym = 0x000000D1
    XKc_Ograve*: KeySym = 0x000000D2
    XKc_Oacute*: KeySym = 0x000000D3
    XKc_Ocircumflex*: KeySym = 0x000000D4
    XKc_Otilde*: KeySym = 0x000000D5
    XKc_Odiaeresis*: KeySym = 0x000000D6
    XK_multiply*: KeySym = 0x000000D7
    XKc_Ooblique*: KeySym = 0x000000D8
    XKc_Oslash*: KeySym = XKc_Ooblique
    XKc_Ugrave*: KeySym = 0x000000D9
    XKc_Uacute*: KeySym = 0x000000DA
    XKc_Ucircumflex*: KeySym = 0x000000DB
    XKc_Udiaeresis*: KeySym = 0x000000DC
    XKc_Yacute*: KeySym = 0x000000DD
    XKc_THORN*: KeySym = 0x000000DE
    XK_ssharp*: KeySym = 0x000000DF
    XK_agrave*: KeySym = 0x000000E0
    XK_aacute*: KeySym = 0x000000E1
    XK_acircumflex*: KeySym = 0x000000E2
    XK_atilde*: KeySym = 0x000000E3
    XK_adiaeresis*: KeySym = 0x000000E4
    XK_aring*: KeySym = 0x000000E5
    XK_ae*: KeySym = 0x000000E6
    XK_ccedilla*: KeySym = 0x000000E7
    XK_egrave*: KeySym = 0x000000E8
    XK_eacute*: KeySym = 0x000000E9
    XK_ecircumflex*: KeySym = 0x000000EA
    XK_ediaeresis*: KeySym = 0x000000EB
    XK_igrave*: KeySym = 0x000000EC
    XK_iacute*: KeySym = 0x000000ED
    XK_icircumflex*: KeySym = 0x000000EE
    XK_idiaeresis*: KeySym = 0x000000EF
    XK_eth*: KeySym = 0x000000F0
    XK_ntilde*: KeySym = 0x000000F1
    XK_ograve*: KeySym = 0x000000F2
    XK_oacute*: KeySym = 0x000000F3
    XK_ocircumflex*: KeySym = 0x000000F4
    XK_otilde*: KeySym = 0x000000F5
    XK_odiaeresis*: KeySym = 0x000000F6
    XK_division*: KeySym = 0x000000F7
    XK_oslash*: KeySym = 0x000000F8
    XK_ooblique*: KeySym = XK_oslash
    XK_ugrave*: KeySym = 0x000000F9
    XK_uacute*: KeySym = 0x000000FA
    XK_ucircumflex*: KeySym = 0x000000FB
    XK_udiaeresis*: KeySym = 0x000000FC
    XK_yacute*: KeySym = 0x000000FD
    XK_thorn*: KeySym = 0x000000FE
    XK_ydiaeresis*: KeySym = 0x000000FF
# XK_LATIN1
#*
# *   Latin 2
# *   Byte 3 = 1
# *

when defined(XK_LATIN2) or true:
  const
    XKc_Aogonek*: KeySym = 0x000001A1
    XK_breve*: KeySym = 0x000001A2
    XKc_Lstroke*: KeySym = 0x000001A3
    XKc_Lcaron*: KeySym = 0x000001A5
    XKc_Sacute*: KeySym = 0x000001A6
    XKc_Scaron*: KeySym = 0x000001A9
    XKc_Scedilla*: KeySym = 0x000001AA
    XKc_Tcaron*: KeySym = 0x000001AB
    XKc_Zacute*: KeySym = 0x000001AC
    XKc_Zcaron*: KeySym = 0x000001AE
    XKc_Zabovedot*: KeySym = 0x000001AF
    XK_aogonek*: KeySym = 0x000001B1
    XK_ogonek*: KeySym = 0x000001B2
    XK_lstroke*: KeySym = 0x000001B3
    XK_lcaron*: KeySym = 0x000001B5
    XK_sacute*: KeySym = 0x000001B6
    XK_caron*: KeySym = 0x000001B7
    XK_scaron*: KeySym = 0x000001B9
    XK_scedilla*: KeySym = 0x000001BA
    XK_tcaron*: KeySym = 0x000001BB
    XK_zacute*: KeySym = 0x000001BC
    XK_doubleacute*: KeySym = 0x000001BD
    XK_zcaron*: KeySym = 0x000001BE
    XK_zabovedot*: KeySym = 0x000001BF
    XKc_Racute*: KeySym = 0x000001C0
    XKc_Abreve*: KeySym = 0x000001C3
    XKc_Lacute*: KeySym = 0x000001C5
    XKc_Cacute*: KeySym = 0x000001C6
    XKc_Ccaron*: KeySym = 0x000001C8
    XKc_Eogonek*: KeySym = 0x000001CA
    XKc_Ecaron*: KeySym = 0x000001CC
    XKc_Dcaron*: KeySym = 0x000001CF
    XKc_Dstroke*: KeySym = 0x000001D0
    XKc_Nacute*: KeySym = 0x000001D1
    XKc_Ncaron*: KeySym = 0x000001D2
    XKc_Odoubleacute*: KeySym = 0x000001D5
    XKc_Rcaron*: KeySym = 0x000001D8
    XKc_Uring*: KeySym = 0x000001D9
    XKc_Udoubleacute*: KeySym = 0x000001DB
    XKc_Tcedilla*: KeySym = 0x000001DE
    XK_racute*: KeySym = 0x000001E0
    XK_abreve*: KeySym = 0x000001E3
    XK_lacute*: KeySym = 0x000001E5
    XK_cacute*: KeySym = 0x000001E6
    XK_ccaron*: KeySym = 0x000001E8
    XK_eogonek*: KeySym = 0x000001EA
    XK_ecaron*: KeySym = 0x000001EC
    XK_dcaron*: KeySym = 0x000001EF
    XK_dstroke*: KeySym = 0x000001F0
    XK_nacute*: KeySym = 0x000001F1
    XK_ncaron*: KeySym = 0x000001F2
    XK_odoubleacute*: KeySym = 0x000001F5
    XK_udoubleacute*: KeySym = 0x000001FB
    XK_rcaron*: KeySym = 0x000001F8
    XK_uring*: KeySym = 0x000001F9
    XK_tcedilla*: KeySym = 0x000001FE
    XK_abovedot*: KeySym = 0x000001FF
# XK_LATIN2
#*
# *   Latin 3
# *   Byte 3 = 2
# *

when defined(XK_LATIN3) or true:
  const
    XKc_Hstroke*: KeySym = 0x000002A1
    XKc_Hcircumflex*: KeySym = 0x000002A6
    XKc_Iabovedot*: KeySym = 0x000002A9
    XKc_Gbreve*: KeySym = 0x000002AB
    XKc_Jcircumflex*: KeySym = 0x000002AC
    XK_hstroke*: KeySym = 0x000002B1
    XK_hcircumflex*: KeySym = 0x000002B6
    XK_idotless*: KeySym = 0x000002B9
    XK_gbreve*: KeySym = 0x000002BB
    XK_jcircumflex*: KeySym = 0x000002BC
    XKc_Cabovedot*: KeySym = 0x000002C5
    XKc_Ccircumflex*: KeySym = 0x000002C6
    XKc_Gabovedot*: KeySym = 0x000002D5
    XKc_Gcircumflex*: KeySym = 0x000002D8
    XKc_Ubreve*: KeySym = 0x000002DD
    XKc_Scircumflex*: KeySym = 0x000002DE
    XK_cabovedot*: KeySym = 0x000002E5
    XK_ccircumflex*: KeySym = 0x000002E6
    XK_gabovedot*: KeySym = 0x000002F5
    XK_gcircumflex*: KeySym = 0x000002F8
    XK_ubreve*: KeySym = 0x000002FD
    XK_scircumflex*: KeySym = 0x000002FE
# XK_LATIN3
#*
# *   Latin 4
# *   Byte 3 = 3
# *

when defined(XK_LATIN4) or true:
  const
    XK_kra*: KeySym = 0x000003A2
    XK_kappa*: KeySym = 0x000003A2      # deprecated
    XKc_Rcedilla*: KeySym = 0x000003A3
    XKc_Itilde*: KeySym = 0x000003A5
    XKc_Lcedilla*: KeySym = 0x000003A6
    XKc_Emacron*: KeySym = 0x000003AA
    XKc_Gcedilla*: KeySym = 0x000003AB
    XKc_Tslash*: KeySym = 0x000003AC
    XK_rcedilla*: KeySym = 0x000003B3
    XK_itilde*: KeySym = 0x000003B5
    XK_lcedilla*: KeySym = 0x000003B6
    XK_emacron*: KeySym = 0x000003BA
    XK_gcedilla*: KeySym = 0x000003BB
    XK_tslash*: KeySym = 0x000003BC
    XKc_ENG*: KeySym = 0x000003BD
    XK_eng*: KeySym = 0x000003BF
    XKc_Amacron*: KeySym = 0x000003C0
    XKc_Iogonek*: KeySym = 0x000003C7
    XKc_Eabovedot*: KeySym = 0x000003CC
    XKc_Imacron*: KeySym = 0x000003CF
    XKc_Ncedilla*: KeySym = 0x000003D1
    XKc_Omacron*: KeySym = 0x000003D2
    XKc_Kcedilla*: KeySym = 0x000003D3
    XKc_Uogonek*: KeySym = 0x000003D9
    XKc_Utilde*: KeySym = 0x000003DD
    XKc_Umacron*: KeySym = 0x000003DE
    XK_amacron*: KeySym = 0x000003E0
    XK_iogonek*: KeySym = 0x000003E7
    XK_eabovedot*: KeySym = 0x000003EC
    XK_imacron*: KeySym = 0x000003EF
    XK_ncedilla*: KeySym = 0x000003F1
    XK_omacron*: KeySym = 0x000003F2
    XK_kcedilla*: KeySym = 0x000003F3
    XK_uogonek*: KeySym = 0x000003F9
    XK_utilde*: KeySym = 0x000003FD
    XK_umacron*: KeySym = 0x000003FE
# XK_LATIN4
#*
# * Latin-8
# * Byte 3 = 18
# *

when defined(XK_LATIN8) or true:
  const
    XKc_Babovedot*: KeySym = 0x000012A1
    XK_babovedot*: KeySym = 0x000012A2
    XKc_Dabovedot*: KeySym = 0x000012A6
    XKc_Wgrave*: KeySym = 0x000012A8
    XKc_Wacute*: KeySym = 0x000012AA
    XK_dabovedot*: KeySym = 0x000012AB
    XKc_Ygrave*: KeySym = 0x000012AC
    XKc_Fabovedot*: KeySym = 0x000012B0
    XK_fabovedot*: KeySym = 0x000012B1
    XKc_Mabovedot*: KeySym = 0x000012B4
    XK_mabovedot*: KeySym = 0x000012B5
    XKc_Pabovedot*: KeySym = 0x000012B7
    XK_wgrave*: KeySym = 0x000012B8
    XK_pabovedot*: KeySym = 0x000012B9
    XK_wacute*: KeySym = 0x000012BA
    XKc_Sabovedot*: KeySym = 0x000012BB
    XK_ygrave*: KeySym = 0x000012BC
    XKc_Wdiaeresis*: KeySym = 0x000012BD
    XK_wdiaeresis*: KeySym = 0x000012BE
    XK_sabovedot*: KeySym = 0x000012BF
    XKc_Wcircumflex*: KeySym = 0x000012D0
    XKc_Tabovedot*: KeySym = 0x000012D7
    XKc_Ycircumflex*: KeySym = 0x000012DE
    XK_wcircumflex*: KeySym = 0x000012F0
    XK_tabovedot*: KeySym = 0x000012F7
    XK_ycircumflex*: KeySym = 0x000012FE
# XK_LATIN8
#*
# * Latin-9 (a.k.a. Latin-0)
# * Byte 3 = 19
# *

when defined(XK_LATIN9) or true:
  const
    XKc_OE*: KeySym = 0x000013BC
    XK_oe*: KeySym = 0x000013BD
    XKc_Ydiaeresis*: KeySym = 0x000013BE
# XK_LATIN9
#*
# * Katakana
# * Byte 3 = 4
# *

when defined(XK_KATAKANA) or true:
  const
    XK_overline*: KeySym = 0x0000047E
    XK_kana_fullstop*: KeySym = 0x000004A1
    XK_kana_openingbracket*: KeySym = 0x000004A2
    XK_kana_closingbracket*: KeySym = 0x000004A3
    XK_kana_comma*: KeySym = 0x000004A4
    XK_kana_conjunctive*: KeySym = 0x000004A5
    XK_kana_middledot*: KeySym = 0x000004A5 # deprecated
    XKc_kana_WO*: KeySym = 0x000004A6
    XK_kana_a*: KeySym = 0x000004A7
    XK_kana_i*: KeySym = 0x000004A8
    XK_kana_u*: KeySym = 0x000004A9
    XK_kana_e*: KeySym = 0x000004AA
    XK_kana_o*: KeySym = 0x000004AB
    XK_kana_ya*: KeySym = 0x000004AC
    XK_kana_yu*: KeySym = 0x000004AD
    XK_kana_yo*: KeySym = 0x000004AE
    XK_kana_tsu*: KeySym = 0x000004AF
    XK_kana_tu*: KeySym = 0x000004AF    # deprecated
    XK_prolongedsound*: KeySym = 0x000004B0
    XKc_kana_A*: KeySym = 0x000004B1
    XKc_kana_I*: KeySym = 0x000004B2
    XKc_kana_U*: KeySym = 0x000004B3
    XKc_kana_E*: KeySym = 0x000004B4
    XKc_kana_O*: KeySym = 0x000004B5
    XKc_kana_KA*: KeySym = 0x000004B6
    XKc_kana_KI*: KeySym = 0x000004B7
    XKc_kana_KU*: KeySym = 0x000004B8
    XKc_kana_KE*: KeySym = 0x000004B9
    XKc_kana_KO*: KeySym = 0x000004BA
    XKc_kana_SA*: KeySym = 0x000004BB
    XKc_kana_SHI*: KeySym = 0x000004BC
    XKc_kana_SU*: KeySym = 0x000004BD
    XKc_kana_SE*: KeySym = 0x000004BE
    XKc_kana_SO*: KeySym = 0x000004BF
    XKc_kana_TA*: KeySym = 0x000004C0
    XKc_kana_CHI*: KeySym = 0x000004C1
    XKc_kana_TI*: KeySym = 0x000004C1   # deprecated
    XKc_kana_TSU*: KeySym = 0x000004C2
    XKc_kana_TU*: KeySym = 0x000004C2   # deprecated
    XKc_kana_TE*: KeySym = 0x000004C3
    XKc_kana_TO*: KeySym = 0x000004C4
    XKc_kana_NA*: KeySym = 0x000004C5
    XKc_kana_NI*: KeySym = 0x000004C6
    XKc_kana_NU*: KeySym = 0x000004C7
    XKc_kana_NE*: KeySym = 0x000004C8
    XKc_kana_NO*: KeySym = 0x000004C9
    XKc_kana_HA*: KeySym = 0x000004CA
    XKc_kana_HI*: KeySym = 0x000004CB
    XKc_kana_FU*: KeySym = 0x000004CC
    XKc_kana_HU*: KeySym = 0x000004CC   # deprecated
    XKc_kana_HE*: KeySym = 0x000004CD
    XKc_kana_HO*: KeySym = 0x000004CE
    XKc_kana_MA*: KeySym = 0x000004CF
    XKc_kana_MI*: KeySym = 0x000004D0
    XKc_kana_MU*: KeySym = 0x000004D1
    XKc_kana_ME*: KeySym = 0x000004D2
    XKc_kana_MO*: KeySym = 0x000004D3
    XKc_kana_YA*: KeySym = 0x000004D4
    XKc_kana_YU*: KeySym = 0x000004D5
    XKc_kana_YO*: KeySym = 0x000004D6
    XKc_kana_RA*: KeySym = 0x000004D7
    XKc_kana_RI*: KeySym = 0x000004D8
    XKc_kana_RU*: KeySym = 0x000004D9
    XKc_kana_RE*: KeySym = 0x000004DA
    XKc_kana_RO*: KeySym = 0x000004DB
    XKc_kana_WA*: KeySym = 0x000004DC
    XKc_kana_N*: KeySym = 0x000004DD
    XK_voicedsound*: KeySym = 0x000004DE
    XK_semivoicedsound*: KeySym = 0x000004DF
    XK_kana_switch*: KeySym = 0x0000FF7E # Alias for mode_switch
# XK_KATAKANA
#*
# *  Arabic
# *  Byte 3 = 5
# *

when defined(XK_ARABIC) or true:
  const
    XK_Farsi_0*: KeySym = 0x00000590
    XK_Farsi_1*: KeySym = 0x00000591
    XK_Farsi_2*: KeySym = 0x00000592
    XK_Farsi_3*: KeySym = 0x00000593
    XK_Farsi_4*: KeySym = 0x00000594
    XK_Farsi_5*: KeySym = 0x00000595
    XK_Farsi_6*: KeySym = 0x00000596
    XK_Farsi_7*: KeySym = 0x00000597
    XK_Farsi_8*: KeySym = 0x00000598
    XK_Farsi_9*: KeySym = 0x00000599
    XK_Arabic_percent*: KeySym = 0x000005A5
    XK_Arabic_superscript_alef*: KeySym = 0x000005A6
    XK_Arabic_tteh*: KeySym = 0x000005A7
    XK_Arabic_peh*: KeySym = 0x000005A8
    XK_Arabic_tcheh*: KeySym = 0x000005A9
    XK_Arabic_ddal*: KeySym = 0x000005AA
    XK_Arabic_rreh*: KeySym = 0x000005AB
    XK_Arabic_comma*: KeySym = 0x000005AC
    XK_Arabic_fullstop*: KeySym = 0x000005AE
    XK_Arabic_0*: KeySym = 0x000005B0
    XK_Arabic_1*: KeySym = 0x000005B1
    XK_Arabic_2*: KeySym = 0x000005B2
    XK_Arabic_3*: KeySym = 0x000005B3
    XK_Arabic_4*: KeySym = 0x000005B4
    XK_Arabic_5*: KeySym = 0x000005B5
    XK_Arabic_6*: KeySym = 0x000005B6
    XK_Arabic_7*: KeySym = 0x000005B7
    XK_Arabic_8*: KeySym = 0x000005B8
    XK_Arabic_9*: KeySym = 0x000005B9
    XK_Arabic_semicolon*: KeySym = 0x000005BB
    XK_Arabic_question_mark*: KeySym = 0x000005BF
    XK_Arabic_hamza*: KeySym = 0x000005C1
    XK_Arabic_maddaonalef*: KeySym = 0x000005C2
    XK_Arabic_hamzaonalef*: KeySym = 0x000005C3
    XK_Arabic_hamzaonwaw*: KeySym = 0x000005C4
    XK_Arabic_hamzaunderalef*: KeySym = 0x000005C5
    XK_Arabic_hamzaonyeh*: KeySym = 0x000005C6
    XK_Arabic_alef*: KeySym = 0x000005C7
    XK_Arabic_beh*: KeySym = 0x000005C8
    XK_Arabic_tehmarbuta*: KeySym = 0x000005C9
    XK_Arabic_teh*: KeySym = 0x000005CA
    XK_Arabic_theh*: KeySym = 0x000005CB
    XK_Arabic_jeem*: KeySym = 0x000005CC
    XK_Arabic_hah*: KeySym = 0x000005CD
    XK_Arabic_khah*: KeySym = 0x000005CE
    XK_Arabic_dal*: KeySym = 0x000005CF
    XK_Arabic_thal*: KeySym = 0x000005D0
    XK_Arabic_ra*: KeySym = 0x000005D1
    XK_Arabic_zain*: KeySym = 0x000005D2
    XK_Arabic_seen*: KeySym = 0x000005D3
    XK_Arabic_sheen*: KeySym = 0x000005D4
    XK_Arabic_sad*: KeySym = 0x000005D5
    XK_Arabic_dad*: KeySym = 0x000005D6
    XK_Arabic_tah*: KeySym = 0x000005D7
    XK_Arabic_zah*: KeySym = 0x000005D8
    XK_Arabic_ain*: KeySym = 0x000005D9
    XK_Arabic_ghain*: KeySym = 0x000005DA
    XK_Arabic_tatweel*: KeySym = 0x000005E0
    XK_Arabic_feh*: KeySym = 0x000005E1
    XK_Arabic_qaf*: KeySym = 0x000005E2
    XK_Arabic_kaf*: KeySym = 0x000005E3
    XK_Arabic_lam*: KeySym = 0x000005E4
    XK_Arabic_meem*: KeySym = 0x000005E5
    XK_Arabic_noon*: KeySym = 0x000005E6
    XK_Arabic_ha*: KeySym = 0x000005E7
    XK_Arabic_heh*: KeySym = 0x000005E7 # deprecated
    XK_Arabic_waw*: KeySym = 0x000005E8
    XK_Arabic_alefmaksura*: KeySym = 0x000005E9
    XK_Arabic_yeh*: KeySym = 0x000005EA
    XK_Arabic_fathatan*: KeySym = 0x000005EB
    XK_Arabic_dammatan*: KeySym = 0x000005EC
    XK_Arabic_kasratan*: KeySym = 0x000005ED
    XK_Arabic_fatha*: KeySym = 0x000005EE
    XK_Arabic_damma*: KeySym = 0x000005EF
    XK_Arabic_kasra*: KeySym = 0x000005F0
    XK_Arabic_shadda*: KeySym = 0x000005F1
    XK_Arabic_sukun*: KeySym = 0x000005F2
    XK_Arabic_madda_above*: KeySym = 0x000005F3
    XK_Arabic_hamza_above*: KeySym = 0x000005F4
    XK_Arabic_hamza_below*: KeySym = 0x000005F5
    XK_Arabic_jeh*: KeySym = 0x000005F6
    XK_Arabic_veh*: KeySym = 0x000005F7
    XK_Arabic_keheh*: KeySym = 0x000005F8
    XK_Arabic_gaf*: KeySym = 0x000005F9
    XK_Arabic_noon_ghunna*: KeySym = 0x000005FA
    XK_Arabic_heh_doachashmee*: KeySym = 0x000005FB
    XK_Farsi_yeh*: KeySym = 0x000005FC
    XK_Arabic_farsi_yeh*: KeySym = XK_Farsi_yeh
    XK_Arabic_yeh_baree*: KeySym = 0x000005FD
    XK_Arabic_heh_goal*: KeySym = 0x000005FE
    XK_Arabic_switch*: KeySym = 0x0000FF7E # Alias for mode_switch
# XK_ARABIC
#*
# * Cyrillic
# * Byte 3 = 6
# *

when defined(XK_CYRILLIC) or true:
  const
    XKc_Cyrillic_GHE_bar*: KeySym = 0x00000680
    XK_Cyrillic_ghe_bar*: KeySym = 0x00000690
    XKc_Cyrillic_ZHE_descender*: KeySym = 0x00000681
    XK_Cyrillic_zhe_descender*: KeySym = 0x00000691
    XKc_Cyrillic_KA_descender*: KeySym = 0x00000682
    XK_Cyrillic_ka_descender*: KeySym = 0x00000692
    XKc_Cyrillic_KA_vertstroke*: KeySym = 0x00000683
    XK_Cyrillic_ka_vertstroke*: KeySym = 0x00000693
    XKc_Cyrillic_EN_descender*: KeySym = 0x00000684
    XK_Cyrillic_en_descender*: KeySym = 0x00000694
    XKc_Cyrillic_U_straight*: KeySym = 0x00000685
    XK_Cyrillic_u_straight*: KeySym = 0x00000695
    XKc_Cyrillic_U_straight_bar*: KeySym = 0x00000686
    XK_Cyrillic_u_straight_bar*: KeySym = 0x00000696
    XKc_Cyrillic_HA_descender*: KeySym = 0x00000687
    XK_Cyrillic_ha_descender*: KeySym = 0x00000697
    XKc_Cyrillic_CHE_descender*: KeySym = 0x00000688
    XK_Cyrillic_che_descender*: KeySym = 0x00000698
    XKc_Cyrillic_CHE_vertstroke*: KeySym = 0x00000689
    XK_Cyrillic_che_vertstroke*: KeySym = 0x00000699
    XKc_Cyrillic_SHHA*: KeySym = 0x0000068A
    XK_Cyrillic_shha*: KeySym = 0x0000069A
    XKc_Cyrillic_SCHWA*: KeySym = 0x0000068C
    XK_Cyrillic_schwa*: KeySym = 0x0000069C
    XKc_Cyrillic_I_macron*: KeySym = 0x0000068D
    XK_Cyrillic_i_macron*: KeySym = 0x0000069D
    XKc_Cyrillic_O_bar*: KeySym = 0x0000068E
    XK_Cyrillic_o_bar*: KeySym = 0x0000069E
    XKc_Cyrillic_U_macron*: KeySym = 0x0000068F
    XK_Cyrillic_u_macron*: KeySym = 0x0000069F
    XK_Serbian_dje*: KeySym = 0x000006A1
    XK_Macedonia_gje*: KeySym = 0x000006A2
    XK_Cyrillic_io*: KeySym = 0x000006A3
    XK_Ukrainian_ie*: KeySym = 0x000006A4
    XK_Ukranian_je*: KeySym = 0x000006A4 # deprecated
    XK_Macedonia_dse*: KeySym = 0x000006A5
    XK_Ukrainian_i*: KeySym = 0x000006A6
    XK_Ukranian_i*: KeySym = 0x000006A6 # deprecated
    XK_Ukrainian_yi*: KeySym = 0x000006A7
    XK_Ukranian_yi*: KeySym = 0x000006A7 # deprecated
    XK_Cyrillic_je*: KeySym = 0x000006A8
    XK_Serbian_je*: KeySym = 0x000006A8 # deprecated
    XK_Cyrillic_lje*: KeySym = 0x000006A9
    XK_Serbian_lje*: KeySym = 0x000006A9 # deprecated
    XK_Cyrillic_nje*: KeySym = 0x000006AA
    XK_Serbian_nje*: KeySym = 0x000006AA # deprecated
    XK_Serbian_tshe*: KeySym = 0x000006AB
    XK_Macedonia_kje*: KeySym = 0x000006AC
    XK_Ukrainian_ghe_with_upturn*: KeySym = 0x000006AD
    XK_Byelorussian_shortu*: KeySym = 0x000006AE
    XK_Cyrillic_dzhe*: KeySym = 0x000006AF
    XK_Serbian_dze*: KeySym = 0x000006AF # deprecated
    XK_numerosign*: KeySym = 0x000006B0
    XKc_Serbian_DJE*: KeySym = 0x000006B1
    XKc_Macedonia_GJE*: KeySym = 0x000006B2
    XKc_Cyrillic_IO*: KeySym = 0x000006B3
    XKc_Ukrainian_IE*: KeySym = 0x000006B4
    XKc_Ukranian_JE*: KeySym = 0x000006B4 # deprecated
    XKc_Macedonia_DSE*: KeySym = 0x000006B5
    XKc_Ukrainian_I*: KeySym = 0x000006B6
    XKc_Ukranian_I*: KeySym = 0x000006B6 # deprecated
    XKc_Ukrainian_YI*: KeySym = 0x000006B7
    XKc_Ukranian_YI*: KeySym = 0x000006B7 # deprecated
    XKc_Cyrillic_JE*: KeySym = 0x000006B8
    XKc_Serbian_JE*: KeySym = 0x000006B8 # deprecated
    XKc_Cyrillic_LJE*: KeySym = 0x000006B9
    XKc_Serbian_LJE*: KeySym = 0x000006B9 # deprecated
    XKc_Cyrillic_NJE*: KeySym = 0x000006BA
    XKc_Serbian_NJE*: KeySym = 0x000006BA # deprecated
    XKc_Serbian_TSHE*: KeySym = 0x000006BB
    XKc_Macedonia_KJE*: KeySym = 0x000006BC
    XKc_Ukrainian_GHE_WITH_UPTURN*: KeySym = 0x000006BD
    XKc_Byelorussian_SHORTU*: KeySym = 0x000006BE
    XKc_Cyrillic_DZHE*: KeySym = 0x000006BF
    XKc_Serbian_DZE*: KeySym = 0x000006BF # deprecated
    XK_Cyrillic_yu*: KeySym = 0x000006C0
    XK_Cyrillic_a*: KeySym = 0x000006C1
    XK_Cyrillic_be*: KeySym = 0x000006C2
    XK_Cyrillic_tse*: KeySym = 0x000006C3
    XK_Cyrillic_de*: KeySym = 0x000006C4
    XK_Cyrillic_ie*: KeySym = 0x000006C5
    XK_Cyrillic_ef*: KeySym = 0x000006C6
    XK_Cyrillic_ghe*: KeySym = 0x000006C7
    XK_Cyrillic_ha*: KeySym = 0x000006C8
    XK_Cyrillic_i*: KeySym = 0x000006C9
    XK_Cyrillic_shorti*: KeySym = 0x000006CA
    XK_Cyrillic_ka*: KeySym = 0x000006CB
    XK_Cyrillic_el*: KeySym = 0x000006CC
    XK_Cyrillic_em*: KeySym = 0x000006CD
    XK_Cyrillic_en*: KeySym = 0x000006CE
    XK_Cyrillic_o*: KeySym = 0x000006CF
    XK_Cyrillic_pe*: KeySym = 0x000006D0
    XK_Cyrillic_ya*: KeySym = 0x000006D1
    XK_Cyrillic_er*: KeySym = 0x000006D2
    XK_Cyrillic_es*: KeySym = 0x000006D3
    XK_Cyrillic_te*: KeySym = 0x000006D4
    XK_Cyrillic_u*: KeySym = 0x000006D5
    XK_Cyrillic_zhe*: KeySym = 0x000006D6
    XK_Cyrillic_ve*: KeySym = 0x000006D7
    XK_Cyrillic_softsign*: KeySym = 0x000006D8
    XK_Cyrillic_yeru*: KeySym = 0x000006D9
    XK_Cyrillic_ze*: KeySym = 0x000006DA
    XK_Cyrillic_sha*: KeySym = 0x000006DB
    XK_Cyrillic_e*: KeySym = 0x000006DC
    XK_Cyrillic_shcha*: KeySym = 0x000006DD
    XK_Cyrillic_che*: KeySym = 0x000006DE
    XK_Cyrillic_hardsign*: KeySym = 0x000006DF
    XKc_Cyrillic_YU*: KeySym = 0x000006E0
    XKc_Cyrillic_A*: KeySym = 0x000006E1
    XKc_Cyrillic_BE*: KeySym = 0x000006E2
    XKc_Cyrillic_TSE*: KeySym = 0x000006E3
    XKc_Cyrillic_DE*: KeySym = 0x000006E4
    XKc_Cyrillic_IE*: KeySym = 0x000006E5
    XKc_Cyrillic_EF*: KeySym = 0x000006E6
    XKc_Cyrillic_GHE*: KeySym = 0x000006E7
    XKc_Cyrillic_HA*: KeySym = 0x000006E8
    XKc_Cyrillic_I*: KeySym = 0x000006E9
    XKc_Cyrillic_SHORTI*: KeySym = 0x000006EA
    XKc_Cyrillic_KA*: KeySym = 0x000006EB
    XKc_Cyrillic_EL*: KeySym = 0x000006EC
    XKc_Cyrillic_EM*: KeySym = 0x000006ED
    XKc_Cyrillic_EN*: KeySym = 0x000006EE
    XKc_Cyrillic_O*: KeySym = 0x000006EF
    XKc_Cyrillic_PE*: KeySym = 0x000006F0
    XKc_Cyrillic_YA*: KeySym = 0x000006F1
    XKc_Cyrillic_ER*: KeySym = 0x000006F2
    XKc_Cyrillic_ES*: KeySym = 0x000006F3
    XKc_Cyrillic_TE*: KeySym = 0x000006F4
    XKc_Cyrillic_U*: KeySym = 0x000006F5
    XKc_Cyrillic_ZHE*: KeySym = 0x000006F6
    XKc_Cyrillic_VE*: KeySym = 0x000006F7
    XKc_Cyrillic_SOFTSIGN*: KeySym = 0x000006F8
    XKc_Cyrillic_YERU*: KeySym = 0x000006F9
    XKc_Cyrillic_ZE*: KeySym = 0x000006FA
    XKc_Cyrillic_SHA*: KeySym = 0x000006FB
    XKc_Cyrillic_E*: KeySym = 0x000006FC
    XKc_Cyrillic_SHCHA*: KeySym = 0x000006FD
    XKc_Cyrillic_CHE*: KeySym = 0x000006FE
    XKc_Cyrillic_HARDSIGN*: KeySym = 0x000006FF
# XK_CYRILLIC
#*
# * Greek
# * Byte 3 = 7
# *

when defined(XK_GREEK) or true:
  const
    XKc_Greek_ALPHAaccent*: KeySym = 0x000007A1
    XKc_Greek_EPSILONaccent*: KeySym = 0x000007A2
    XKc_Greek_ETAaccent*: KeySym = 0x000007A3
    XKc_Greek_IOTAaccent*: KeySym = 0x000007A4
    XKc_Greek_IOTAdieresis*: KeySym = 0x000007A5
    XKc_Greek_IOTAdiaeresis*: KeySym = XKc_Greek_IOTAdieresis # old typo
    XKc_Greek_OMICRONaccent*: KeySym = 0x000007A7
    XKc_Greek_UPSILONaccent*: KeySym = 0x000007A8
    XKc_Greek_UPSILONdieresis*: KeySym = 0x000007A9
    XKc_Greek_OMEGAaccent*: KeySym = 0x000007AB
    XK_Greek_accentdieresis*: KeySym = 0x000007AE
    XK_Greek_horizbar*: KeySym = 0x000007AF
    XK_Greek_alphaaccent*: KeySym = 0x000007B1
    XK_Greek_epsilonaccent*: KeySym = 0x000007B2
    XK_Greek_etaaccent*: KeySym = 0x000007B3
    XK_Greek_iotaaccent*: KeySym = 0x000007B4
    XK_Greek_iotadieresis*: KeySym = 0x000007B5
    XK_Greek_iotaaccentdieresis*: KeySym = 0x000007B6
    XK_Greek_omicronaccent*: KeySym = 0x000007B7
    XK_Greek_upsilonaccent*: KeySym = 0x000007B8
    XK_Greek_upsilondieresis*: KeySym = 0x000007B9
    XK_Greek_upsilonaccentdieresis*: KeySym = 0x000007BA
    XK_Greek_omegaaccent*: KeySym = 0x000007BB
    XKc_Greek_ALPHA*: KeySym = 0x000007C1
    XKc_Greek_BETA*: KeySym = 0x000007C2
    XKc_Greek_GAMMA*: KeySym = 0x000007C3
    XKc_Greek_DELTA*: KeySym = 0x000007C4
    XKc_Greek_EPSILON*: KeySym = 0x000007C5
    XKc_Greek_ZETA*: KeySym = 0x000007C6
    XKc_Greek_ETA*: KeySym = 0x000007C7
    XKc_Greek_THETA*: KeySym = 0x000007C8
    XKc_Greek_IOTA*: KeySym = 0x000007C9
    XKc_Greek_KAPPA*: KeySym = 0x000007CA
    XKc_Greek_LAMDA*: KeySym = 0x000007CB
    XKc_Greek_LAMBDA*: KeySym = 0x000007CB
    XKc_Greek_MU*: KeySym = 0x000007CC
    XKc_Greek_NU*: KeySym = 0x000007CD
    XKc_Greek_XI*: KeySym = 0x000007CE
    XKc_Greek_OMICRON*: KeySym = 0x000007CF
    XKc_Greek_PI*: KeySym = 0x000007D0
    XKc_Greek_RHO*: KeySym = 0x000007D1
    XKc_Greek_SIGMA*: KeySym = 0x000007D2
    XKc_Greek_TAU*: KeySym = 0x000007D4
    XKc_Greek_UPSILON*: KeySym = 0x000007D5
    XKc_Greek_PHI*: KeySym = 0x000007D6
    XKc_Greek_CHI*: KeySym = 0x000007D7
    XKc_Greek_PSI*: KeySym = 0x000007D8
    XKc_Greek_OMEGA*: KeySym = 0x000007D9
    XK_Greek_alpha*: KeySym = 0x000007E1
    XK_Greek_beta*: KeySym = 0x000007E2
    XK_Greek_gamma*: KeySym = 0x000007E3
    XK_Greek_delta*: KeySym = 0x000007E4
    XK_Greek_epsilon*: KeySym = 0x000007E5
    XK_Greek_zeta*: KeySym = 0x000007E6
    XK_Greek_eta*: KeySym = 0x000007E7
    XK_Greek_theta*: KeySym = 0x000007E8
    XK_Greek_iota*: KeySym = 0x000007E9
    XK_Greek_kappa*: KeySym = 0x000007EA
    XK_Greek_lamda*: KeySym = 0x000007EB
    XK_Greek_lambda*: KeySym = 0x000007EB
    XK_Greek_mu*: KeySym = 0x000007EC
    XK_Greek_nu*: KeySym = 0x000007ED
    XK_Greek_xi*: KeySym = 0x000007EE
    XK_Greek_omicron*: KeySym = 0x000007EF
    XK_Greek_pi*: KeySym = 0x000007F0
    XK_Greek_rho*: KeySym = 0x000007F1
    XK_Greek_sigma*: KeySym = 0x000007F2
    XK_Greek_finalsmallsigma*: KeySym = 0x000007F3
    XK_Greek_tau*: KeySym = 0x000007F4
    XK_Greek_upsilon*: KeySym = 0x000007F5
    XK_Greek_phi*: KeySym = 0x000007F6
    XK_Greek_chi*: KeySym = 0x000007F7
    XK_Greek_psi*: KeySym = 0x000007F8
    XK_Greek_omega*: KeySym = 0x000007F9
    XK_Greek_switch*: KeySym = 0x0000FF7E # Alias for mode_switch
# XK_GREEK
#*
# * Technical
# * Byte 3 = 8
# *

when defined(XK_TECHNICAL) or true:
  const
    XK_leftradical*: KeySym = 0x000008A1
    XK_topleftradical*: KeySym = 0x000008A2
    XK_horizconnector*: KeySym = 0x000008A3
    XK_topintegral*: KeySym = 0x000008A4
    XK_botintegral*: KeySym = 0x000008A5
    XK_vertconnector*: KeySym = 0x000008A6
    XK_topleftsqbracket*: KeySym = 0x000008A7
    XK_botleftsqbracket*: KeySym = 0x000008A8
    XK_toprightsqbracket*: KeySym = 0x000008A9
    XK_botrightsqbracket*: KeySym = 0x000008AA
    XK_topleftparens*: KeySym = 0x000008AB
    XK_botleftparens*: KeySym = 0x000008AC
    XK_toprightparens*: KeySym = 0x000008AD
    XK_botrightparens*: KeySym = 0x000008AE
    XK_leftmiddlecurlybrace*: KeySym = 0x000008AF
    XK_rightmiddlecurlybrace*: KeySym = 0x000008B0
    XK_topleftsummation*: KeySym = 0x000008B1
    XK_botleftsummation*: KeySym = 0x000008B2
    XK_topvertsummationconnector*: KeySym = 0x000008B3
    XK_botvertsummationconnector*: KeySym = 0x000008B4
    XK_toprightsummation*: KeySym = 0x000008B5
    XK_botrightsummation*: KeySym = 0x000008B6
    XK_rightmiddlesummation*: KeySym = 0x000008B7
    XK_lessthanequal*: KeySym = 0x000008BC
    XK_notequal*: KeySym = 0x000008BD
    XK_greaterthanequal*: KeySym = 0x000008BE
    XK_integral*: KeySym = 0x000008BF
    XK_therefore*: KeySym = 0x000008C0
    XK_variation*: KeySym = 0x000008C1
    XK_infinity*: KeySym = 0x000008C2
    XK_nabla*: KeySym = 0x000008C5
    XK_approximate*: KeySym = 0x000008C8
    XK_similarequal*: KeySym = 0x000008C9
    XK_ifonlyif*: KeySym = 0x000008CD
    XK_implies*: KeySym = 0x000008CE
    XK_identical*: KeySym = 0x000008CF
    XK_radical*: KeySym = 0x000008D6
    XK_includedin*: KeySym = 0x000008DA
    XK_includes*: KeySym = 0x000008DB
    XK_intersection*: KeySym = 0x000008DC
    XK_union*: KeySym = 0x000008DD
    XK_logicaland*: KeySym = 0x000008DE
    XK_logicalor*: KeySym = 0x000008DF
    XK_partialderivative*: KeySym = 0x000008EF
    XK_function*: KeySym = 0x000008F6
    XK_leftarrow*: KeySym = 0x000008FB
    XK_uparrow*: KeySym = 0x000008FC
    XK_rightarrow*: KeySym = 0x000008FD
    XK_downarrow*: KeySym = 0x000008FE
# XK_TECHNICAL
#*
# *  Special
# *  Byte 3 = 9
# *

when defined(XK_SPECIAL):
  const
    XK_blank*: KeySym = 0x000009DF
    XK_soliddiamond*: KeySym = 0x000009E0
    XK_checkerboard*: KeySym = 0x000009E1
    XK_ht*: KeySym = 0x000009E2
    XK_ff*: KeySym = 0x000009E3
    XK_cr*: KeySym = 0x000009E4
    XK_lf*: KeySym = 0x000009E5
    XK_nl*: KeySym = 0x000009E8
    XK_vt*: KeySym = 0x000009E9
    XK_lowrightcorner*: KeySym = 0x000009EA
    XK_uprightcorner*: KeySym = 0x000009EB
    XK_upleftcorner*: KeySym = 0x000009EC
    XK_lowleftcorner*: KeySym = 0x000009ED
    XK_crossinglines*: KeySym = 0x000009EE
    XK_horizlinescan1*: KeySym = 0x000009EF
    XK_horizlinescan3*: KeySym = 0x000009F0
    XK_horizlinescan5*: KeySym = 0x000009F1
    XK_horizlinescan7*: KeySym = 0x000009F2
    XK_horizlinescan9*: KeySym = 0x000009F3
    XK_leftt*: KeySym = 0x000009F4
    XK_rightt*: KeySym = 0x000009F5
    XK_bott*: KeySym = 0x000009F6
    XK_topt*: KeySym = 0x000009F7
    XK_vertbar*: KeySym = 0x000009F8
# XK_SPECIAL
#*
# *  Publishing
# *  Byte 3 = a
# *

when defined(XK_PUBLISHING) or true:
  const
    XK_emspace*: KeySym = 0x00000AA1
    XK_enspace*: KeySym = 0x00000AA2
    XK_em3space*: KeySym = 0x00000AA3
    XK_em4space*: KeySym = 0x00000AA4
    XK_digitspace*: KeySym = 0x00000AA5
    XK_punctspace*: KeySym = 0x00000AA6
    XK_thinspace*: KeySym = 0x00000AA7
    XK_hairspace*: KeySym = 0x00000AA8
    XK_emdash*: KeySym = 0x00000AA9
    XK_endash*: KeySym = 0x00000AAA
    XK_signifblank*: KeySym = 0x00000AAC
    XK_ellipsis*: KeySym = 0x00000AAE
    XK_doubbaselinedot*: KeySym = 0x00000AAF
    XK_onethird*: KeySym = 0x00000AB0
    XK_twothirds*: KeySym = 0x00000AB1
    XK_onefifth*: KeySym = 0x00000AB2
    XK_twofifths*: KeySym = 0x00000AB3
    XK_threefifths*: KeySym = 0x00000AB4
    XK_fourfifths*: KeySym = 0x00000AB5
    XK_onesixth*: KeySym = 0x00000AB6
    XK_fivesixths*: KeySym = 0x00000AB7
    XK_careof*: KeySym = 0x00000AB8
    XK_figdash*: KeySym = 0x00000ABB
    XK_leftanglebracket*: KeySym = 0x00000ABC
    XK_decimalpoint*: KeySym = 0x00000ABD
    XK_rightanglebracket*: KeySym = 0x00000ABE
    XK_marker*: KeySym = 0x00000ABF
    XK_oneeighth*: KeySym = 0x00000AC3
    XK_threeeighths*: KeySym = 0x00000AC4
    XK_fiveeighths*: KeySym = 0x00000AC5
    XK_seveneighths*: KeySym = 0x00000AC6
    XK_trademark*: KeySym = 0x00000AC9
    XK_signaturemark*: KeySym = 0x00000ACA
    XK_trademarkincircle*: KeySym = 0x00000ACB
    XK_leftopentriangle*: KeySym = 0x00000ACC
    XK_rightopentriangle*: KeySym = 0x00000ACD
    XK_emopencircle*: KeySym = 0x00000ACE
    XK_emopenrectangle*: KeySym = 0x00000ACF
    XK_leftsinglequotemark*: KeySym = 0x00000AD0
    XK_rightsinglequotemark*: KeySym = 0x00000AD1
    XK_leftdoublequotemark*: KeySym = 0x00000AD2
    XK_rightdoublequotemark*: KeySym = 0x00000AD3
    XK_prescription*: KeySym = 0x00000AD4
    XK_minutes*: KeySym = 0x00000AD6
    XK_seconds*: KeySym = 0x00000AD7
    XK_latincross*: KeySym = 0x00000AD9
    XK_hexagram*: KeySym = 0x00000ADA
    XK_filledrectbullet*: KeySym = 0x00000ADB
    XK_filledlefttribullet*: KeySym = 0x00000ADC
    XK_filledrighttribullet*: KeySym = 0x00000ADD
    XK_emfilledcircle*: KeySym = 0x00000ADE
    XK_emfilledrect*: KeySym = 0x00000ADF
    XK_enopencircbullet*: KeySym = 0x00000AE0
    XK_enopensquarebullet*: KeySym = 0x00000AE1
    XK_openrectbullet*: KeySym = 0x00000AE2
    XK_opentribulletup*: KeySym = 0x00000AE3
    XK_opentribulletdown*: KeySym = 0x00000AE4
    XK_openstar*: KeySym = 0x00000AE5
    XK_enfilledcircbullet*: KeySym = 0x00000AE6
    XK_enfilledsqbullet*: KeySym = 0x00000AE7
    XK_filledtribulletup*: KeySym = 0x00000AE8
    XK_filledtribulletdown*: KeySym = 0x00000AE9
    XK_leftpointer*: KeySym = 0x00000AEA
    XK_rightpointer*: KeySym = 0x00000AEB
    XK_club*: KeySym = 0x00000AEC
    XK_diamond*: KeySym = 0x00000AED
    XK_heart*: KeySym = 0x00000AEE
    XK_maltesecross*: KeySym = 0x00000AF0
    XK_dagger*: KeySym = 0x00000AF1
    XK_doubledagger*: KeySym = 0x00000AF2
    XK_checkmark*: KeySym = 0x00000AF3
    XK_ballotcross*: KeySym = 0x00000AF4
    XK_musicalsharp*: KeySym = 0x00000AF5
    XK_musicalflat*: KeySym = 0x00000AF6
    XK_malesymbol*: KeySym = 0x00000AF7
    XK_femalesymbol*: KeySym = 0x00000AF8
    XK_telephone*: KeySym = 0x00000AF9
    XK_telephonerecorder*: KeySym = 0x00000AFA
    XK_phonographcopyright*: KeySym = 0x00000AFB
    XK_caret*: KeySym = 0x00000AFC
    XK_singlelowquotemark*: KeySym = 0x00000AFD
    XK_doublelowquotemark*: KeySym = 0x00000AFE
    XK_cursor*: KeySym = 0x00000AFF
# XK_PUBLISHING
#*
# *  APL
# *  Byte 3 = b
# *

when defined(XK_APL) or true:
  const
    XK_leftcaret*: KeySym = 0x00000BA3
    XK_rightcaret*: KeySym = 0x00000BA6
    XK_downcaret*: KeySym = 0x00000BA8
    XK_upcaret*: KeySym = 0x00000BA9
    XK_overbar*: KeySym = 0x00000BC0
    XK_downtack*: KeySym = 0x00000BC2
    XK_upshoe*: KeySym = 0x00000BC3
    XK_downstile*: KeySym = 0x00000BC4
    XK_underbar*: KeySym = 0x00000BC6
    XK_jot*: KeySym = 0x00000BCA
    XK_quad*: KeySym = 0x00000BCC
    XK_uptack*: KeySym = 0x00000BCE
    XK_circle*: KeySym = 0x00000BCF
    XK_upstile*: KeySym = 0x00000BD3
    XK_downshoe*: KeySym = 0x00000BD6
    XK_rightshoe*: KeySym = 0x00000BD8
    XK_leftshoe*: KeySym = 0x00000BDA
    XK_lefttack*: KeySym = 0x00000BDC
    XK_righttack*: KeySym = 0x00000BFC
# XK_APL
#*
# * Hebrew
# * Byte 3 = c
# *

when defined(XK_HEBREW) or true:
  const
    XK_hebrew_doublelowline*: KeySym = 0x00000CDF
    XK_hebrew_aleph*: KeySym = 0x00000CE0
    XK_hebrew_bet*: KeySym = 0x00000CE1
    XK_hebrew_beth*: KeySym = 0x00000CE1 # deprecated
    XK_hebrew_gimel*: KeySym = 0x00000CE2
    XK_hebrew_gimmel*: KeySym = 0x00000CE2 # deprecated
    XK_hebrew_dalet*: KeySym = 0x00000CE3
    XK_hebrew_daleth*: KeySym = 0x00000CE3 # deprecated
    XK_hebrew_he*: KeySym = 0x00000CE4
    XK_hebrew_waw*: KeySym = 0x00000CE5
    XK_hebrew_zain*: KeySym = 0x00000CE6
    XK_hebrew_zayin*: KeySym = 0x00000CE6 # deprecated
    XK_hebrew_chet*: KeySym = 0x00000CE7
    XK_hebrew_het*: KeySym = 0x00000CE7 # deprecated
    XK_hebrew_tet*: KeySym = 0x00000CE8
    XK_hebrew_teth*: KeySym = 0x00000CE8 # deprecated
    XK_hebrew_yod*: KeySym = 0x00000CE9
    XK_hebrew_finalkaph*: KeySym = 0x00000CEA
    XK_hebrew_kaph*: KeySym = 0x00000CEB
    XK_hebrew_lamed*: KeySym = 0x00000CEC
    XK_hebrew_finalmem*: KeySym = 0x00000CED
    XK_hebrew_mem*: KeySym = 0x00000CEE
    XK_hebrew_finalnun*: KeySym = 0x00000CEF
    XK_hebrew_nun*: KeySym = 0x00000CF0
    XK_hebrew_samech*: KeySym = 0x00000CF1
    XK_hebrew_samekh*: KeySym = 0x00000CF1 # deprecated
    XK_hebrew_ayin*: KeySym = 0x00000CF2
    XK_hebrew_finalpe*: KeySym = 0x00000CF3
    XK_hebrew_pe*: KeySym = 0x00000CF4
    XK_hebrew_finalzade*: KeySym = 0x00000CF5
    XK_hebrew_finalzadi*: KeySym = 0x00000CF5 # deprecated
    XK_hebrew_zade*: KeySym = 0x00000CF6
    XK_hebrew_zadi*: KeySym = 0x00000CF6 # deprecated
    XK_hebrew_qoph*: KeySym = 0x00000CF7
    XK_hebrew_kuf*: KeySym = 0x00000CF7 # deprecated
    XK_hebrew_resh*: KeySym = 0x00000CF8
    XK_hebrew_shin*: KeySym = 0x00000CF9
    XK_hebrew_taw*: KeySym = 0x00000CFA
    XK_hebrew_taf*: KeySym = 0x00000CFA # deprecated
    XK_Hebrew_switch*: KeySym = 0x0000FF7E # Alias for mode_switch
# XK_HEBREW
#*
# * Thai
# * Byte 3 = d
# *

when defined(XK_THAI) or true:
  const
    XK_Thai_kokai*: KeySym = 0x00000DA1
    XK_Thai_khokhai*: KeySym = 0x00000DA2
    XK_Thai_khokhuat*: KeySym = 0x00000DA3
    XK_Thai_khokhwai*: KeySym = 0x00000DA4
    XK_Thai_khokhon*: KeySym = 0x00000DA5
    XK_Thai_khorakhang*: KeySym = 0x00000DA6
    XK_Thai_ngongu*: KeySym = 0x00000DA7
    XK_Thai_chochan*: KeySym = 0x00000DA8
    XK_Thai_choching*: KeySym = 0x00000DA9
    XK_Thai_chochang*: KeySym = 0x00000DAA
    XK_Thai_soso*: KeySym = 0x00000DAB
    XK_Thai_chochoe*: KeySym = 0x00000DAC
    XK_Thai_yoying*: KeySym = 0x00000DAD
    XK_Thai_dochada*: KeySym = 0x00000DAE
    XK_Thai_topatak*: KeySym = 0x00000DAF
    XK_Thai_thothan*: KeySym = 0x00000DB0
    XK_Thai_thonangmontho*: KeySym = 0x00000DB1
    XK_Thai_thophuthao*: KeySym = 0x00000DB2
    XK_Thai_nonen*: KeySym = 0x00000DB3
    XK_Thai_dodek*: KeySym = 0x00000DB4
    XK_Thai_totao*: KeySym = 0x00000DB5
    XK_Thai_thothung*: KeySym = 0x00000DB6
    XK_Thai_thothahan*: KeySym = 0x00000DB7
    XK_Thai_thothong*: KeySym = 0x00000DB8
    XK_Thai_nonu*: KeySym = 0x00000DB9
    XK_Thai_bobaimai*: KeySym = 0x00000DBA
    XK_Thai_popla*: KeySym = 0x00000DBB
    XK_Thai_phophung*: KeySym = 0x00000DBC
    XK_Thai_fofa*: KeySym = 0x00000DBD
    XK_Thai_phophan*: KeySym = 0x00000DBE
    XK_Thai_fofan*: KeySym = 0x00000DBF
    XK_Thai_phosamphao*: KeySym = 0x00000DC0
    XK_Thai_moma*: KeySym = 0x00000DC1
    XK_Thai_yoyak*: KeySym = 0x00000DC2
    XK_Thai_rorua*: KeySym = 0x00000DC3
    XK_Thai_ru*: KeySym = 0x00000DC4
    XK_Thai_loling*: KeySym = 0x00000DC5
    XK_Thai_lu*: KeySym = 0x00000DC6
    XK_Thai_wowaen*: KeySym = 0x00000DC7
    XK_Thai_sosala*: KeySym = 0x00000DC8
    XK_Thai_sorusi*: KeySym = 0x00000DC9
    XK_Thai_sosua*: KeySym = 0x00000DCA
    XK_Thai_hohip*: KeySym = 0x00000DCB
    XK_Thai_lochula*: KeySym = 0x00000DCC
    XK_Thai_oang*: KeySym = 0x00000DCD
    XK_Thai_honokhuk*: KeySym = 0x00000DCE
    XK_Thai_paiyannoi*: KeySym = 0x00000DCF
    XK_Thai_saraa*: KeySym = 0x00000DD0
    XK_Thai_maihanakat*: KeySym = 0x00000DD1
    XK_Thai_saraaa*: KeySym = 0x00000DD2
    XK_Thai_saraam*: KeySym = 0x00000DD3
    XK_Thai_sarai*: KeySym = 0x00000DD4
    XK_Thai_saraii*: KeySym = 0x00000DD5
    XK_Thai_saraue*: KeySym = 0x00000DD6
    XK_Thai_sarauee*: KeySym = 0x00000DD7
    XK_Thai_sarau*: KeySym = 0x00000DD8
    XK_Thai_sarauu*: KeySym = 0x00000DD9
    XK_Thai_phinthu*: KeySym = 0x00000DDA
    XK_Thai_maihanakat_maitho*: KeySym = 0x00000DDE
    XK_Thai_baht*: KeySym = 0x00000DDF
    XK_Thai_sarae*: KeySym = 0x00000DE0
    XK_Thai_saraae*: KeySym = 0x00000DE1
    XK_Thai_sarao*: KeySym = 0x00000DE2
    XK_Thai_saraaimaimuan*: KeySym = 0x00000DE3
    XK_Thai_saraaimaimalai*: KeySym = 0x00000DE4
    XK_Thai_lakkhangyao*: KeySym = 0x00000DE5
    XK_Thai_maiyamok*: KeySym = 0x00000DE6
    XK_Thai_maitaikhu*: KeySym = 0x00000DE7
    XK_Thai_maiek*: KeySym = 0x00000DE8
    XK_Thai_maitho*: KeySym = 0x00000DE9
    XK_Thai_maitri*: KeySym = 0x00000DEA
    XK_Thai_maichattawa*: KeySym = 0x00000DEB
    XK_Thai_thanthakhat*: KeySym = 0x00000DEC
    XK_Thai_nikhahit*: KeySym = 0x00000DED
    XK_Thai_leksun*: KeySym = 0x00000DF0
    XK_Thai_leknung*: KeySym = 0x00000DF1
    XK_Thai_leksong*: KeySym = 0x00000DF2
    XK_Thai_leksam*: KeySym = 0x00000DF3
    XK_Thai_leksi*: KeySym = 0x00000DF4
    XK_Thai_lekha*: KeySym = 0x00000DF5
    XK_Thai_lekhok*: KeySym = 0x00000DF6
    XK_Thai_lekchet*: KeySym = 0x00000DF7
    XK_Thai_lekpaet*: KeySym = 0x00000DF8
    XK_Thai_lekkao*: KeySym = 0x00000DF9
# XK_THAI
#*
# *   Korean
# *   Byte 3 = e
# *

when defined(XK_KOREAN) or true:
  const
    XK_Hangul*: KeySym = 0x0000FF31     # Hangul start/stop(toggle)
    XK_Hangul_Start*: KeySym = 0x0000FF32 # Hangul start
    XK_Hangul_End*: KeySym = 0x0000FF33 # Hangul end, English start
    XK_Hangul_Hanja*: KeySym = 0x0000FF34 # Start Hangul->Hanja Conversion
    XK_Hangul_Jamo*: KeySym = 0x0000FF35 # Hangul Jamo mode
    XK_Hangul_Romaja*: KeySym = 0x0000FF36 # Hangul Romaja mode
    XK_Hangul_Codeinput*: KeySym = 0x0000FF37 # Hangul code input mode
    XK_Hangul_Jeonja*: KeySym = 0x0000FF38 # Jeonja mode
    XK_Hangul_Banja*: KeySym = 0x0000FF39 # Banja mode
    XK_Hangul_PreHanja*: KeySym = 0x0000FF3A # Pre Hanja conversion
    XK_Hangul_PostHanja*: KeySym = 0x0000FF3B # Post Hanja conversion
    XK_Hangul_SingleCandidate*: KeySym = 0x0000FF3C # Single candidate
    XK_Hangul_MultipleCandidate*: KeySym = 0x0000FF3D # Multiple candidate
    XK_Hangul_PreviousCandidate*: KeySym = 0x0000FF3E # Previous candidate
    XK_Hangul_Special*: KeySym = 0x0000FF3F # Special symbols
    XK_Hangul_switch*: KeySym = 0x0000FF7E # Alias for mode_switch \
                                   # Hangul Consonant Characters
    XK_Hangul_Kiyeog*: KeySym = 0x00000EA1
    XK_Hangul_SsangKiyeog*: KeySym = 0x00000EA2
    XK_Hangul_KiyeogSios*: KeySym = 0x00000EA3
    XK_Hangul_Nieun*: KeySym = 0x00000EA4
    XK_Hangul_NieunJieuj*: KeySym = 0x00000EA5
    XK_Hangul_NieunHieuh*: KeySym = 0x00000EA6
    XK_Hangul_Dikeud*: KeySym = 0x00000EA7
    XK_Hangul_SsangDikeud*: KeySym = 0x00000EA8
    XK_Hangul_Rieul*: KeySym = 0x00000EA9
    XK_Hangul_RieulKiyeog*: KeySym = 0x00000EAA
    XK_Hangul_RieulMieum*: KeySym = 0x00000EAB
    XK_Hangul_RieulPieub*: KeySym = 0x00000EAC
    XK_Hangul_RieulSios*: KeySym = 0x00000EAD
    XK_Hangul_RieulTieut*: KeySym = 0x00000EAE
    XK_Hangul_RieulPhieuf*: KeySym = 0x00000EAF
    XK_Hangul_RieulHieuh*: KeySym = 0x00000EB0
    XK_Hangul_Mieum*: KeySym = 0x00000EB1
    XK_Hangul_Pieub*: KeySym = 0x00000EB2
    XK_Hangul_SsangPieub*: KeySym = 0x00000EB3
    XK_Hangul_PieubSios*: KeySym = 0x00000EB4
    XK_Hangul_Sios*: KeySym = 0x00000EB5
    XK_Hangul_SsangSios*: KeySym = 0x00000EB6
    XK_Hangul_Ieung*: KeySym = 0x00000EB7
    XK_Hangul_Jieuj*: KeySym = 0x00000EB8
    XK_Hangul_SsangJieuj*: KeySym = 0x00000EB9
    XK_Hangul_Cieuc*: KeySym = 0x00000EBA
    XK_Hangul_Khieuq*: KeySym = 0x00000EBB
    XK_Hangul_Tieut*: KeySym = 0x00000EBC
    XK_Hangul_Phieuf*: KeySym = 0x00000EBD
    XK_Hangul_Hieuh*: KeySym = 0x00000EBE # Hangul Vowel Characters
    XK_Hangul_A*: KeySym = 0x00000EBF
    XK_Hangul_AE*: KeySym = 0x00000EC0
    XK_Hangul_YA*: KeySym = 0x00000EC1
    XK_Hangul_YAE*: KeySym = 0x00000EC2
    XK_Hangul_EO*: KeySym = 0x00000EC3
    XK_Hangul_E*: KeySym = 0x00000EC4
    XK_Hangul_YEO*: KeySym = 0x00000EC5
    XK_Hangul_YE*: KeySym = 0x00000EC6
    XK_Hangul_O*: KeySym = 0x00000EC7
    XK_Hangul_WA*: KeySym = 0x00000EC8
    XK_Hangul_WAE*: KeySym = 0x00000EC9
    XK_Hangul_OE*: KeySym = 0x00000ECA
    XK_Hangul_YO*: KeySym = 0x00000ECB
    XK_Hangul_U*: KeySym = 0x00000ECC
    XK_Hangul_WEO*: KeySym = 0x00000ECD
    XK_Hangul_WE*: KeySym = 0x00000ECE
    XK_Hangul_WI*: KeySym = 0x00000ECF
    XK_Hangul_YU*: KeySym = 0x00000ED0
    XK_Hangul_EU*: KeySym = 0x00000ED1
    XK_Hangul_YI*: KeySym = 0x00000ED2
    XK_Hangul_I*: KeySym = 0x00000ED3   # Hangul syllable-final (JongSeong) Characters
    XK_Hangul_J_Kiyeog*: KeySym = 0x00000ED4
    XK_Hangul_J_SsangKiyeog*: KeySym = 0x00000ED5
    XK_Hangul_J_KiyeogSios*: KeySym = 0x00000ED6
    XK_Hangul_J_Nieun*: KeySym = 0x00000ED7
    XK_Hangul_J_NieunJieuj*: KeySym = 0x00000ED8
    XK_Hangul_J_NieunHieuh*: KeySym = 0x00000ED9
    XK_Hangul_J_Dikeud*: KeySym = 0x00000EDA
    XK_Hangul_J_Rieul*: KeySym = 0x00000EDB
    XK_Hangul_J_RieulKiyeog*: KeySym = 0x00000EDC
    XK_Hangul_J_RieulMieum*: KeySym = 0x00000EDD
    XK_Hangul_J_RieulPieub*: KeySym = 0x00000EDE
    XK_Hangul_J_RieulSios*: KeySym = 0x00000EDF
    XK_Hangul_J_RieulTieut*: KeySym = 0x00000EE0
    XK_Hangul_J_RieulPhieuf*: KeySym = 0x00000EE1
    XK_Hangul_J_RieulHieuh*: KeySym = 0x00000EE2
    XK_Hangul_J_Mieum*: KeySym = 0x00000EE3
    XK_Hangul_J_Pieub*: KeySym = 0x00000EE4
    XK_Hangul_J_PieubSios*: KeySym = 0x00000EE5
    XK_Hangul_J_Sios*: KeySym = 0x00000EE6
    XK_Hangul_J_SsangSios*: KeySym = 0x00000EE7
    XK_Hangul_J_Ieung*: KeySym = 0x00000EE8
    XK_Hangul_J_Jieuj*: KeySym = 0x00000EE9
    XK_Hangul_J_Cieuc*: KeySym = 0x00000EEA
    XK_Hangul_J_Khieuq*: KeySym = 0x00000EEB
    XK_Hangul_J_Tieut*: KeySym = 0x00000EEC
    XK_Hangul_J_Phieuf*: KeySym = 0x00000EED
    XK_Hangul_J_Hieuh*: KeySym = 0x00000EEE # Ancient Hangul Consonant Characters
    XK_Hangul_RieulYeorinHieuh*: KeySym = 0x00000EEF
    XK_Hangul_SunkyeongeumMieum*: KeySym = 0x00000EF0
    XK_Hangul_SunkyeongeumPieub*: KeySym = 0x00000EF1
    XK_Hangul_PanSios*: KeySym = 0x00000EF2
    XK_Hangul_KkogjiDalrinIeung*: KeySym = 0x00000EF3
    XK_Hangul_SunkyeongeumPhieuf*: KeySym = 0x00000EF4
    XK_Hangul_YeorinHieuh*: KeySym = 0x00000EF5 # Ancient Hangul Vowel Characters
    XK_Hangul_AraeA*: KeySym = 0x00000EF6
    XK_Hangul_AraeAE*: KeySym = 0x00000EF7 # Ancient Hangul syllable-final (JongSeong) Characters
    XK_Hangul_J_PanSios*: KeySym = 0x00000EF8
    XK_Hangul_J_KkogjiDalrinIeung*: KeySym = 0x00000EF9
    XK_Hangul_J_YeorinHieuh*: KeySym = 0x00000EFA # Korean currency symbol
    XK_Korean_Won*: KeySym = 0x00000EFF
# XK_KOREAN
#*
# *   Armenian
# *   Byte 3 = = $14
# *

when defined(XK_ARMENIAN) or true:
  const
    XK_Armenian_eternity*: KeySym = 0x000014A1
    XK_Armenian_ligature_ew*: KeySym = 0x000014A2
    XK_Armenian_full_stop*: KeySym = 0x000014A3
    XK_Armenian_verjaket*: KeySym = 0x000014A3
    XK_Armenian_parenright*: KeySym = 0x000014A4
    XK_Armenian_parenleft*: KeySym = 0x000014A5
    XK_Armenian_guillemotright*: KeySym = 0x000014A6
    XK_Armenian_guillemotleft*: KeySym = 0x000014A7
    XK_Armenian_em_dash*: KeySym = 0x000014A8
    XK_Armenian_dot*: KeySym = 0x000014A9
    XK_Armenian_mijaket*: KeySym = 0x000014A9
    XK_Armenian_separation_mark*: KeySym = 0x000014AA
    XK_Armenian_but*: KeySym = 0x000014AA
    XK_Armenian_comma*: KeySym = 0x000014AB
    XK_Armenian_en_dash*: KeySym = 0x000014AC
    XK_Armenian_hyphen*: KeySym = 0x000014AD
    XK_Armenian_yentamna*: KeySym = 0x000014AD
    XK_Armenian_ellipsis*: KeySym = 0x000014AE
    XK_Armenian_exclam*: KeySym = 0x000014AF
    XK_Armenian_amanak*: KeySym = 0x000014AF
    XK_Armenian_accent*: KeySym = 0x000014B0
    XK_Armenian_shesht*: KeySym = 0x000014B0
    XK_Armenian_question*: KeySym = 0x000014B1
    XK_Armenian_paruyk*: KeySym = 0x000014B1
    XKc_Armenian_AYB*: KeySym = 0x000014B2
    XK_Armenian_ayb*: KeySym = 0x000014B3
    XKc_Armenian_BEN*: KeySym = 0x000014B4
    XK_Armenian_ben*: KeySym = 0x000014B5
    XKc_Armenian_GIM*: KeySym = 0x000014B6
    XK_Armenian_gim*: KeySym = 0x000014B7
    XKc_Armenian_DA*: KeySym = 0x000014B8
    XK_Armenian_da*: KeySym = 0x000014B9
    XKc_Armenian_YECH*: KeySym = 0x000014BA
    XK_Armenian_yech*: KeySym = 0x000014BB
    XKc_Armenian_ZA*: KeySym = 0x000014BC
    XK_Armenian_za*: KeySym = 0x000014BD
    XKc_Armenian_E*: KeySym = 0x000014BE
    XK_Armenian_e*: KeySym = 0x000014BF
    XKc_Armenian_AT*: KeySym = 0x000014C0
    XK_Armenian_at*: KeySym = 0x000014C1
    XKc_Armenian_TO*: KeySym = 0x000014C2
    XK_Armenian_to*: KeySym = 0x000014C3
    XKc_Armenian_ZHE*: KeySym = 0x000014C4
    XK_Armenian_zhe*: KeySym = 0x000014C5
    XKc_Armenian_INI*: KeySym = 0x000014C6
    XK_Armenian_ini*: KeySym = 0x000014C7
    XKc_Armenian_LYUN*: KeySym = 0x000014C8
    XK_Armenian_lyun*: KeySym = 0x000014C9
    XKc_Armenian_KHE*: KeySym = 0x000014CA
    XK_Armenian_khe*: KeySym = 0x000014CB
    XKc_Armenian_TSA*: KeySym = 0x000014CC
    XK_Armenian_tsa*: KeySym = 0x000014CD
    XKc_Armenian_KEN*: KeySym = 0x000014CE
    XK_Armenian_ken*: KeySym = 0x000014CF
    XKc_Armenian_HO*: KeySym = 0x000014D0
    XK_Armenian_ho*: KeySym = 0x000014D1
    XKc_Armenian_DZA*: KeySym = 0x000014D2
    XK_Armenian_dza*: KeySym = 0x000014D3
    XKc_Armenian_GHAT*: KeySym = 0x000014D4
    XK_Armenian_ghat*: KeySym = 0x000014D5
    XKc_Armenian_TCHE*: KeySym = 0x000014D6
    XK_Armenian_tche*: KeySym = 0x000014D7
    XKc_Armenian_MEN*: KeySym = 0x000014D8
    XK_Armenian_men*: KeySym = 0x000014D9
    XKc_Armenian_HI*: KeySym = 0x000014DA
    XK_Armenian_hi*: KeySym = 0x000014DB
    XKc_Armenian_NU*: KeySym = 0x000014DC
    XK_Armenian_nu*: KeySym = 0x000014DD
    XKc_Armenian_SHA*: KeySym = 0x000014DE
    XK_Armenian_sha*: KeySym = 0x000014DF
    XKc_Armenian_VO*: KeySym = 0x000014E0
    XK_Armenian_vo*: KeySym = 0x000014E1
    XKc_Armenian_CHA*: KeySym = 0x000014E2
    XK_Armenian_cha*: KeySym = 0x000014E3
    XKc_Armenian_PE*: KeySym = 0x000014E4
    XK_Armenian_pe*: KeySym = 0x000014E5
    XKc_Armenian_JE*: KeySym = 0x000014E6
    XK_Armenian_je*: KeySym = 0x000014E7
    XKc_Armenian_RA*: KeySym = 0x000014E8
    XK_Armenian_ra*: KeySym = 0x000014E9
    XKc_Armenian_SE*: KeySym = 0x000014EA
    XK_Armenian_se*: KeySym = 0x000014EB
    XKc_Armenian_VEV*: KeySym = 0x000014EC
    XK_Armenian_vev*: KeySym = 0x000014ED
    XKc_Armenian_TYUN*: KeySym = 0x000014EE
    XK_Armenian_tyun*: KeySym = 0x000014EF
    XKc_Armenian_RE*: KeySym = 0x000014F0
    XK_Armenian_re*: KeySym = 0x000014F1
    XKc_Armenian_TSO*: KeySym = 0x000014F2
    XK_Armenian_tso*: KeySym = 0x000014F3
    XKc_Armenian_VYUN*: KeySym = 0x000014F4
    XK_Armenian_vyun*: KeySym = 0x000014F5
    XKc_Armenian_PYUR*: KeySym = 0x000014F6
    XK_Armenian_pyur*: KeySym = 0x000014F7
    XKc_Armenian_KE*: KeySym = 0x000014F8
    XK_Armenian_ke*: KeySym = 0x000014F9
    XKc_Armenian_O*: KeySym = 0x000014FA
    XK_Armenian_o*: KeySym = 0x000014FB
    XKc_Armenian_FE*: KeySym = 0x000014FC
    XK_Armenian_fe*: KeySym = 0x000014FD
    XK_Armenian_apostrophe*: KeySym = 0x000014FE
    XK_Armenian_section_sign*: KeySym = 0x000014FF
# XK_ARMENIAN
#*
# *   Georgian
# *   Byte 3 = = $15
# *

when defined(XK_GEORGIAN) or true:
  const
    XK_Georgian_an*: KeySym = 0x000015D0
    XK_Georgian_ban*: KeySym = 0x000015D1
    XK_Georgian_gan*: KeySym = 0x000015D2
    XK_Georgian_don*: KeySym = 0x000015D3
    XK_Georgian_en*: KeySym = 0x000015D4
    XK_Georgian_vin*: KeySym = 0x000015D5
    XK_Georgian_zen*: KeySym = 0x000015D6
    XK_Georgian_tan*: KeySym = 0x000015D7
    XK_Georgian_in*: KeySym = 0x000015D8
    XK_Georgian_kan*: KeySym = 0x000015D9
    XK_Georgian_las*: KeySym = 0x000015DA
    XK_Georgian_man*: KeySym = 0x000015DB
    XK_Georgian_nar*: KeySym = 0x000015DC
    XK_Georgian_on*: KeySym = 0x000015DD
    XK_Georgian_par*: KeySym = 0x000015DE
    XK_Georgian_zhar*: KeySym = 0x000015DF
    XK_Georgian_rae*: KeySym = 0x000015E0
    XK_Georgian_san*: KeySym = 0x000015E1
    XK_Georgian_tar*: KeySym = 0x000015E2
    XK_Georgian_un*: KeySym = 0x000015E3
    XK_Georgian_phar*: KeySym = 0x000015E4
    XK_Georgian_khar*: KeySym = 0x000015E5
    XK_Georgian_ghan*: KeySym = 0x000015E6
    XK_Georgian_qar*: KeySym = 0x000015E7
    XK_Georgian_shin*: KeySym = 0x000015E8
    XK_Georgian_chin*: KeySym = 0x000015E9
    XK_Georgian_can*: KeySym = 0x000015EA
    XK_Georgian_jil*: KeySym = 0x000015EB
    XK_Georgian_cil*: KeySym = 0x000015EC
    XK_Georgian_char*: KeySym = 0x000015ED
    XK_Georgian_xan*: KeySym = 0x000015EE
    XK_Georgian_jhan*: KeySym = 0x000015EF
    XK_Georgian_hae*: KeySym = 0x000015F0
    XK_Georgian_he*: KeySym = 0x000015F1
    XK_Georgian_hie*: KeySym = 0x000015F2
    XK_Georgian_we*: KeySym = 0x000015F3
    XK_Georgian_har*: KeySym = 0x000015F4
    XK_Georgian_hoe*: KeySym = 0x000015F5
    XK_Georgian_fi*: KeySym = 0x000015F6
# XK_GEORGIAN
#*
# * Azeri (and other Turkic or Caucasian languages of ex-USSR)
# * Byte 3 = = $16
# *

when defined(XK_CAUCASUS) or true:
  # latin
  const
    XKc_Ccedillaabovedot*: KeySym = 0x000016A2
    XKc_Xabovedot*: KeySym = 0x000016A3
    XKc_Qabovedot*: KeySym = 0x000016A5
    XKc_Ibreve*: KeySym = 0x000016A6
    XKc_IE*: KeySym = 0x000016A7
    XKc_UO*: KeySym = 0x000016A8
    XKc_Zstroke*: KeySym = 0x000016A9
    XKc_Gcaron*: KeySym = 0x000016AA
    XKc_Obarred*: KeySym = 0x000016AF
    XK_ccedillaabovedot*: KeySym = 0x000016B2
    XK_xabovedot*: KeySym = 0x000016B3
    XKc_Ocaron*: KeySym = 0x000016B4
    XK_qabovedot*: KeySym = 0x000016B5
    XK_ibreve*: KeySym = 0x000016B6
    XK_ie*: KeySym = 0x000016B7
    XK_uo*: KeySym = 0x000016B8
    XK_zstroke*: KeySym = 0x000016B9
    XK_gcaron*: KeySym = 0x000016BA
    XK_ocaron*: KeySym = 0x000016BD
    XK_obarred*: KeySym = 0x000016BF
    XKc_SCHWA*: KeySym = 0x000016C6
    XK_schwa*: KeySym = 0x000016F6 # those are not really Caucasus, but I put them here for now\ 
                           # For Inupiak
    XKc_Lbelowdot*: KeySym = 0x000016D1
    XKc_Lstrokebelowdot*: KeySym = 0x000016D2
    XK_lbelowdot*: KeySym = 0x000016E1
    XK_lstrokebelowdot*: KeySym = 0x000016E2 # For Guarani
    XKc_Gtilde*: KeySym = 0x000016D3
    XK_gtilde*: KeySym = 0x000016E3
# XK_CAUCASUS
#*
# *   Vietnamese
# *   Byte 3 = = $1e
# *

when defined(XK_VIETNAMESE) or true:
  const
    XKc_Abelowdot*: KeySym = 0x00001EA0
    XK_abelowdot*: KeySym = 0x00001EA1
    XKc_Ahook*: KeySym = 0x00001EA2
    XK_ahook*: KeySym = 0x00001EA3
    XKc_Acircumflexacute*: KeySym = 0x00001EA4
    XK_acircumflexacute*: KeySym = 0x00001EA5
    XKc_Acircumflexgrave*: KeySym = 0x00001EA6
    XK_acircumflexgrave*: KeySym = 0x00001EA7
    XKc_Acircumflexhook*: KeySym = 0x00001EA8
    XK_acircumflexhook*: KeySym = 0x00001EA9
    XKc_Acircumflextilde*: KeySym = 0x00001EAA
    XK_acircumflextilde*: KeySym = 0x00001EAB
    XKc_Acircumflexbelowdot*: KeySym = 0x00001EAC
    XK_acircumflexbelowdot*: KeySym = 0x00001EAD
    XKc_Abreveacute*: KeySym = 0x00001EAE
    XK_abreveacute*: KeySym = 0x00001EAF
    XKc_Abrevegrave*: KeySym = 0x00001EB0
    XK_abrevegrave*: KeySym = 0x00001EB1
    XKc_Abrevehook*: KeySym = 0x00001EB2
    XK_abrevehook*: KeySym = 0x00001EB3
    XKc_Abrevetilde*: KeySym = 0x00001EB4
    XK_abrevetilde*: KeySym = 0x00001EB5
    XKc_Abrevebelowdot*: KeySym = 0x00001EB6
    XK_abrevebelowdot*: KeySym = 0x00001EB7
    XKc_Ebelowdot*: KeySym = 0x00001EB8
    XK_ebelowdot*: KeySym = 0x00001EB9
    XKc_Ehook*: KeySym = 0x00001EBA
    XK_ehook*: KeySym = 0x00001EBB
    XKc_Etilde*: KeySym = 0x00001EBC
    XK_etilde*: KeySym = 0x00001EBD
    XKc_Ecircumflexacute*: KeySym = 0x00001EBE
    XK_ecircumflexacute*: KeySym = 0x00001EBF
    XKc_Ecircumflexgrave*: KeySym = 0x00001EC0
    XK_ecircumflexgrave*: KeySym = 0x00001EC1
    XKc_Ecircumflexhook*: KeySym = 0x00001EC2
    XK_ecircumflexhook*: KeySym = 0x00001EC3
    XKc_Ecircumflextilde*: KeySym = 0x00001EC4
    XK_ecircumflextilde*: KeySym = 0x00001EC5
    XKc_Ecircumflexbelowdot*: KeySym = 0x00001EC6
    XK_ecircumflexbelowdot*: KeySym = 0x00001EC7
    XKc_Ihook*: KeySym = 0x00001EC8
    XK_ihook*: KeySym = 0x00001EC9
    XKc_Ibelowdot*: KeySym = 0x00001ECA
    XK_ibelowdot*: KeySym = 0x00001ECB
    XKc_Obelowdot*: KeySym = 0x00001ECC
    XK_obelowdot*: KeySym = 0x00001ECD
    XKc_Ohook*: KeySym = 0x00001ECE
    XK_ohook*: KeySym = 0x00001ECF
    XKc_Ocircumflexacute*: KeySym = 0x00001ED0
    XK_ocircumflexacute*: KeySym = 0x00001ED1
    XKc_Ocircumflexgrave*: KeySym = 0x00001ED2
    XK_ocircumflexgrave*: KeySym = 0x00001ED3
    XKc_Ocircumflexhook*: KeySym = 0x00001ED4
    XK_ocircumflexhook*: KeySym = 0x00001ED5
    XKc_Ocircumflextilde*: KeySym = 0x00001ED6
    XK_ocircumflextilde*: KeySym = 0x00001ED7
    XKc_Ocircumflexbelowdot*: KeySym = 0x00001ED8
    XK_ocircumflexbelowdot*: KeySym = 0x00001ED9
    XKc_Ohornacute*: KeySym = 0x00001EDA
    XK_ohornacute*: KeySym = 0x00001EDB
    XKc_Ohorngrave*: KeySym = 0x00001EDC
    XK_ohorngrave*: KeySym = 0x00001EDD
    XKc_Ohornhook*: KeySym = 0x00001EDE
    XK_ohornhook*: KeySym = 0x00001EDF
    XKc_Ohorntilde*: KeySym = 0x00001EE0
    XK_ohorntilde*: KeySym = 0x00001EE1
    XKc_Ohornbelowdot*: KeySym = 0x00001EE2
    XK_ohornbelowdot*: KeySym = 0x00001EE3
    XKc_Ubelowdot*: KeySym = 0x00001EE4
    XK_ubelowdot*: KeySym = 0x00001EE5
    XKc_Uhook*: KeySym = 0x00001EE6
    XK_uhook*: KeySym = 0x00001EE7
    XKc_Uhornacute*: KeySym = 0x00001EE8
    XK_uhornacute*: KeySym = 0x00001EE9
    XKc_Uhorngrave*: KeySym = 0x00001EEA
    XK_uhorngrave*: KeySym = 0x00001EEB
    XKc_Uhornhook*: KeySym = 0x00001EEC
    XK_uhornhook*: KeySym = 0x00001EED
    XKc_Uhorntilde*: KeySym = 0x00001EEE
    XK_uhorntilde*: KeySym = 0x00001EEF
    XKc_Uhornbelowdot*: KeySym = 0x00001EF0
    XK_uhornbelowdot*: KeySym = 0x00001EF1
    XKc_Ybelowdot*: KeySym = 0x00001EF4
    XK_ybelowdot*: KeySym = 0x00001EF5
    XKc_Yhook*: KeySym = 0x00001EF6
    XK_yhook*: KeySym = 0x00001EF7
    XKc_Ytilde*: KeySym = 0x00001EF8
    XK_ytilde*: KeySym = 0x00001EF9
    XKc_Ohorn*: KeySym = 0x00001EFA     # U+01a0
    XK_ohorn*: KeySym = 0x00001EFB      # U+01a1
    XKc_Uhorn*: KeySym = 0x00001EFC     # U+01af
    XK_uhorn*: KeySym = 0x00001EFD      # U+01b0
    XK_combining_tilde*: KeySym = 0x00001E9F # U+0303
    XK_combining_grave*: KeySym = 0x00001EF2 # U+0300
    XK_combining_acute*: KeySym = 0x00001EF3 # U+0301
    XK_combining_hook*: KeySym = 0x00001EFE # U+0309
    XK_combining_belowdot*: KeySym = 0x00001EFF # U+0323
# XK_VIETNAMESE

when defined(XK_CURRENCY) or true:
  const
    XK_EcuSign*: KeySym = 0x000020A0
    XK_ColonSign*: KeySym = 0x000020A1
    XK_CruzeiroSign*: KeySym = 0x000020A2
    XK_FFrancSign*: KeySym = 0x000020A3
    XK_LiraSign*: KeySym = 0x000020A4
    XK_MillSign*: KeySym = 0x000020A5
    XK_NairaSign*: KeySym = 0x000020A6
    XK_PesetaSign*: KeySym = 0x000020A7
    XK_RupeeSign*: KeySym = 0x000020A8
    XK_WonSign*: KeySym = 0x000020A9
    XK_NewSheqelSign*: KeySym = 0x000020AA
    XK_DongSign*: KeySym = 0x000020AB
    XK_EuroSign*: KeySym = 0x000020AC
# implementation
