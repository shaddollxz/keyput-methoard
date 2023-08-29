; win 键的位置和 mac 改键后的的 fn 键位置相同

#1::F1
#2::F2
#3::F3
#4::F4
#5::F5
#6::F6
#7::F7
#8::F8
#9::F9
#0::F10
#-::F11
#=::F12

#HotIf (WinActive("Visual Studio Code"))
#p:: {
    Send("{F6}{F5}")
}
#m::^+F5
#'::+F5
#j::F10
#k::F11
#h::+F11
#l:: return
#HotIf

#HotIf (WinActive("Mozilla Firefox"))
#p::F8
#j::F10
#k::F11
#h::+F11
#l:: return
#HotIf