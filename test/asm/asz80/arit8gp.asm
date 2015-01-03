; *******************************
; 8 Bit Arithmetic Group
; *******************************

   .include "addan.asm"
   .include "addar.asm"
   .include "addabhlb.asm"
   .include "addabixb.asm"
   .include "addabiyb.asm"

   .include "adcan.asm"
   .include "adcar.asm"
   .include "adcabhlb.asm"
   .include "adcabixb.asm"
   .include "adcabiyb.asm"
   
   .include "suban.asm"
   .include "subar.asm"
   .include "subabhlb.asm"
   .include "subabixb.asm"
   .include "subabiyb.asm"

   .include "sbcan.asm"
   .include "sbcar.asm"
   .include "sbcabhlb.asm"
   .include "sbcabixb.asm"
   .include "sbcabiyb.asm"
   
   .include "andan.asm"
   .include "andar.asm"
   .include "andabhlb.asm"
   .include "andabixb.asm"
   .include "andabiyb.asm"
   
   .include "oran.asm"
   .include "orar.asm"
   .include "orabhlb.asm"
   .include "orabixb.asm"
   .include "orabiyb.asm"

   .include "xoran.asm"
   .include "xorar.asm"
   .include "xorabhlb.asm"
   .include "xorabixb.asm"
   .include "xorabiyb.asm"

   .include "cpan.asm"
   .include "cpar.asm"
   .include "cpabhlb.asm"
   .include "cpabixb.asm"
   .include "cpabiyb.asm"

   .include "incr.asm"
   .include "incbhlb.asm"
   .include "incbixb.asm"
   .include "incbiyb.asm"

   .include "decr.asm"
   .include "decbhlb.asm"
   .include "decbixb.asm"
   .include "decbiyb.asm"

arit8gp:
   call addan      ; add A, n
   call addar      ; add A, r
   call addabhlb   ; add A, (hl)
   call addabixb   ; add A, (ix+d)
   call addabiyb   ; add A, (iy+d)

   call adcan      ; adc A, n
   call adcar      ; adc A, r
   call adcabhlb   ; adc A, (hl)
   call adcabixb   ; adc A, (ix+d)
   call adcabiyb   ; adc A, (iy+d)

   call suban      ; sub A, n
   call subar      ; sub A, r
   call subabhlb   ; sub A, (hl)
   call subabixb   ; sub A, (ix+d)
   call subabiyb   ; sub A, (iy+d)

   call sbcan      ; sbc A, n
   call sbcar      ; sbc A, r
   call sbcabhlb   ; sbc A, (hl)
   call sbcabixb   ; sbc A, (ix+d)
   call sbcabiyb   ; sbc A, (iy+d)

   call andan      ; and A, n
   call andar      ; and A, r
   call andabhlb   ; and A, (hl)
   call andabixb   ; and A, (ix+d)
   call andabiyb   ; and A, (iy+d)

   call oran      ; or A, n
   call orar      ; or A, r
   call orabhlb   ; or A, (hl)
   call orabixb   ; or A, (ix+d)
   call orabiyb   ; or A, (iy+d)

   call xoran      ; xor A, n
   call xorar      ; xor A, r
   call xorabhlb   ; xor A, (hl)
   call xorabixb   ; xor A, (ix+d)
   call xorabiyb   ; xor A, (iy+d)

   call cpan      ; cp A, n
   call cpar      ; cp A, r
   call cpabhlb   ; cp A, (hl)
   call cpabixb   ; cp A, (ix+d)
   call cpabiyb   ; cp A, (iy+d)

   call incr      ; inc r
   call incbhlb   ; inc (hl)
   call incbixb   ; inc (ix+d)
   call incbiyb   ; inc (iy+d)

   call decr      ; dec r
   call decbhlb   ; dec (hl)
   call decbixb   ; dec (ix+d)
   call decbiyb   ; dec (iy+d)

   ret
   
