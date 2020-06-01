;
; See "overworld_a" for more information on this
;

;
; GBC room overlays for rooms CC-FF, as well as alternate layouts
; for rooms 06, 0E, 1B, 2B, 79, and 8C
;

RoomGBCOverlaysB::

RoomGBCOverlayCC::
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F
    db $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A
    db $04, $55, $5A, $5A, $56, $F7, $FF, $FA, $44, $FA
    db $62, $57, $59, $59, $58, $62, $52, $52, $52, $62
    db $62, $5B, $E2, $5B, $5B, $0A, $5B, $E2, $5B, $0A
    db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C
    db $62, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A
    db $62, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A

RoomGBCOverlayCD::
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $3C
    db $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $BA, $37
    db $F8, $55, $5A, $56, $55, $5A, $56, $04, $04, $37
    db $62, $57, $59, $58, $57, $59, $58, $62, $04, $37
    db $0A, $5B, $E2, $5B, $5B, $E2, $5B, $62, $F6, $37
    db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $62, $FB, $37
    db $0A, $0A, $0A, $0A, $0A, $0A, $0C, $62, $FF, $37
    db $0A, $0A, $0A, $0A, $0A, $0A, $0C, $62, $FE, $37

RoomGBCOverlayCE::
    db $09, $3D, $2F, $2F, $2F, $2F, $2F, $2F, $3C, $09
    db $3D, $34, $CF, $CF, $CF, $D0, $D0, $D0, $33, $3C
    db $38, $CF, $CF, $CF, $CF, $D0, $D0, $D0, $D0, $33
    db $38, $CF, $CF, $CF, $CF, $D0, $D0, $D0, $D0, $08
    db $38, $D1, $D1, $D1, $D1, $D2, $D2, $D2, $D2, $2B
    db $38, $D1, $D1, $D1, $D1, $D2, $D2, $D2, $D2, $37
    db $38, $D1, $D1, $D1, $D1, $D2, $D2, $D2, $D2, $37
    db $32, $2C, $2C, $2D, $08, $2B, $2C, $2C, $2C, $31

RoomGBCOverlayCF::
    db $3D, $2F, $2F, $2F, $48, $E1, $49, $3C, $09, $38
    db $38, $08, $08, $6F, $08, $08, $08, $33, $3C, $38
    db $34, $08, $08, $08, $08, $08, $08, $08, $37, $38
    db $08, $08, $69, $08, $08, $08, $08, $08, $37, $38
    db $2D, $08, $08, $08, $69, $69, $69, $08, $37, $38
    db $38, $69, $69, $69, $08, $08, $08, $08, $37, $38
    db $38, $08, $08, $08, $08, $08, $08, $08, $37, $38
    db $38, $08, $69, $69, $08, $08, $2B, $2C, $31, $38

RoomGBCOverlayD0::
    db $3E, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3B, $04
    db $37, $FF, $FF, $FC, $0B, $F7, $FF, $FF, $F8, $F5
    db $37, $F7, $FA, $F8, $0B, $0B, $F7, $F8, $04, $F7
    db $2E, $2F, $2F, $2F, $48, $43, $49, $48, $E0, $49
    db $3E, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $E0, $3A
    db $37, $FF, $F8, $04, $04, $04, $04, $04, $04, $F5
    db $37, $F8, $04, $36, $3C, $04, $04, $F5, $F9, $FF
    db $37, $04, $04, $04, $2E, $48, $4A, $49, $2F, $2F

RoomGBCOverlayD1::
    db $FB, $44, $FF, $FF, $FF, $FC, $38, $04, $FE, $27
    db $FF, $FF, $FA, $FA, $44, $F8, $38, $F6, $F7, $25
    db $FA, $F8, $3D, $48, $4A, $49, $4E, $44, $F6, $27
    db $2F, $2F, $4E, $3A, $3A, $3A, $3B, $FF, $F8, $25
    db $3A, $3A, $3B, $F5, $F9, $FF, $FA, $F8, $04, $27
    db $F9, $FF, $FA, $44, $FF, $FC, $5C, $5C, $5C, $25
    db $FF, $F8, $5C, $5C, $F7, $F8, $04, $04, $04, $27
    db $2F, $2F, $2F, $2F, $48, $4A, $49, $2F, $2F, $2F

RoomGBCOverlayD2::
    db $28, $FB, $FC, $04, $F5, $FF, $FF, $FC, $27, $29
    db $26, $FB, $44, $F9, $FF, $FF, $FF, $FF, $44, $27
    db $28, $FB, $FF, $FF, $FF, $44, $FF, $FF, $F8, $25
    db $26, $FB, $FF, $FA, $FA, $FF, $FF, $FC, $25, $2A
    db $28, $FB, $FC, $25, $26, $FB, $FF, $F8, $27, $29
    db $26, $F7, $44, $27, $28, $FB, $FC, $04, $04, $27
    db $28, $04, $F7, $F9, $F9, $FA, $FF, $F6, $04, $04
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F

RoomGBCOverlayD3::
    db $2A, $28, $27, $28, $2E, $2F, $2F, $2F, $4E, $27
    db $28, $04, $04, $0C, $39, $62, $C2, $62, $3B, $25
    db $26, $04, $04, $0C, $0C, $0C, $0C, $0C, $0C, $27
    db $28, $04, $04, $0C, $B6, $0C, $0C, $0C, $B6, $25
    db $26, $04, $04, $0C, $B7, $0C, $B6, $0C, $B7, $27
    db $28, $04, $04, $04, $0C, $0C, $C0, $0C, $0C, $25
    db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $04, $27
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F

RoomGBCOverlayD4::
    db $28, $0A, $0A, $12, $04, $44, $04, $13, $0F, $14
    db $26, $0A, $1A, $16, $04, $04, $04, $11, $1B, $12
    db $28, $D4, $18, $0F, $14, $5C, $04, $11, $1B, $12
    db $26, $0A, $0A, $6E, $18, $0F, $14, $15, $10, $16
    db $29, $26, $6E, $5C, $6E, $6E, $18, $0F, $0F, $0F
    db $2A, $28, $D4, $20, $E8, $E8, $E8, $E8, $0A, $6E
    db $28, $0A, $20, $0A, $E8, $E8, $E8, $E8, $5C, $0A
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F

RoomGBCOverlayD5::
    db $11, $1B, $1B, $12, $04, $11, $0A, $0A, $0A, $27
    db $11, $1B, $1A, $16, $6E, $11, $0A, $0A, $0A, $25
    db $15, $10, $16, $13, $0F, $17, $D4, $0A, $0A, $27
    db $04, $44, $D4, $11, $0A, $0A, $20, $D4, $04, $25
    db $0F, $0F, $0F, $17, $0A, $0A, $0A, $0A, $04, $27
    db $6E, $0A, $0A, $0A, $D4, $0A, $0A, $0A, $25, $26
    db $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $27, $28
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $3C

RoomGBCOverlayD6::
    db $28, $0A, $6E, $D3, $D3, $D3, $0A, $D3, $D3, $D3
    db $26, $0A, $6E, $D3, $5C, $5C, $5C, $5C, $5C, $0A
    db $28, $0A, $6E, $D3, $D3, $D3, $5C, $D3, $D3, $D3
    db $26, $0A, $6E, $52, $52, $52, $5C, $5C, $5C, $0A
    db $28, $0A, $F6, $5B, $E2, $5B, $6E, $D4, $6E, $6E
    db $25, $26, $0A, $F6, $04, $04, $F7, $FD, $F6, $6E
    db $27, $28, $0A, $0A, $0A, $D3, $25, $26, $F7, $FD
    db $25, $26, $25, $26, $25, $26, $27, $28, $25, $26

RoomGBCOverlayD7::
    db $D3, $0A, $D3, $D3, $0A, $D3, $0A, $6E, $FB, $37
    db $0A, $5C, $5C, $D3, $5C, $D3, $5C, $6E, $FC, $37
    db $D3, $D3, $5C, $5C, $5C, $D3, $5C, $6E, $F7, $37
    db $0A, $5C, $D3, $D3, $D3, $5C, $5C, $6E, $04, $37
    db $D3, $5C, $5C, $5C, $5C, $5C, $6E, $04, $F5, $37
    db $6E, $6E, $6E, $D4, $6E, $6E, $F5, $FD, $F8, $2E
    db $FA, $F6, $04, $04, $04, $F5, $F8, $25, $26, $39
    db $25, $26, $25, $26, $25, $26, $25, $2A, $29, $26

RoomGBCOverlayD8::
    db $38, $0A, $FF, $FF, $F8, $04, $04, $38, $3B, $0E
    db $38, $0A, $FF, $FC, $04, $04, $F5, $38, $0E, $0E
    db $38, $0A, $FF, $F8, $04, $04, $FB, $38, $0E, $0E
    db $38, $0A, $FC, $04, $04, $F5, $FF, $38, $0E, $0E
    db $38, $0A, $FC, $3D, $48, $E0, $49, $4E, $0E, $0E
    db $4E, $FF, $FC, $38, $3A, $E0, $3A, $3B, $0E, $0E
    db $3B, $F7, $FF, $38, $0E, $0E, $0E, $0E, $0E, $0E
    db $25, $26, $F7, $38, $0E, $0E, $0E, $0E, $0E, $0E

RoomGBCOverlayD9::
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
    db $0E, $0E, $0E, $CA, $51, $51, $51, $51, $0E, $0E
    db $0E, $0E, $51, $0E, $B6, $B7, $66, $0E, $CA, $0E
    db $0E, $0E, $51, $0E, $67, $E3, $68, $0E, $51, $0E
    db $0E, $CA, $51, $0E, $0E, $0E, $0E, $0E, $51, $0E
    db $0E, $0E, $0E, $51, $0E, $0E, $0E, $CA, $51, $0E
    db $0E, $CA, $CA, $CA, $51, $CA, $51, $51, $0E, $0E
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E

RoomGBCOverlayDA::
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $37, $04, $27
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $33, $E0, $2F
    db $0E, $0E, $2B, $2C, $2C, $2D, $0E, $0E, $0E, $0E
    db $0E, $0E, $37, $04, $6F, $32, $2C, $2D, $0E, $0E
    db $0E, $0E, $37, $04, $04, $04, $04, $38, $0E, $0E
    db $0E, $0E, $33, $3C, $04, $04, $04, $38, $0E, $0E
    db $0E, $0E, $0E, $37, $04, $04, $F5, $38, $0E, $0E
    db $0E, $0E, $0E, $37, $F5, $F9, $44, $38, $0E, $0E

RoomGBCOverlayDB::
    db $28, $F7, $0A, $FC, $04, $F7, $FF, $FC, $25, $26
    db $2F, $3C, $0A, $FF, $F6, $04, $44, $FC, $27, $28
    db $0E, $37, $FF, $FF, $F8, $F5, $0A, $0A, $25, $26
    db $0E, $37, $FB, $FC, $04, $0A, $25, $45, $2A, $28
    db $0E, $37, $44, $FC, $04, $0A, $27, $E1, $29, $26
    db $0E, $37, $0A, $FF, $F6, $04, $0A, $0A, $27, $28
    db $0E, $37, $0A, $FF, $44, $F9, $FF, $FC, $3D, $2F
    db $0E, $37, $0A, $FF, $FF, $FF, $FF, $FF, $38, $0E

RoomGBCOverlayDC::
    db $62, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A
    db $62, $0A, $0A, $FF, $FF, $FF, $FF, $FF, $0A, $0A
    db $62, $0A, $FF, $44, $FF, $FF, $FF, $FF, $FF, $0A
    db $62, $0A, $FF, $FF, $FF, $FF, $FF, $FF, $44, $0A
    db $62, $0A, $FF, $FF, $FF, $FF, $44, $FF, $FF, $0A
    db $62, $62, $0A, $FF, $FF, $44, $FA, $FA, $0A, $0A
    db $2F, $2F, $3C, $0A, $0A, $0A, $62, $62, $62, $62
    db $0E, $0E, $37, $FC, $25, $26, $25, $26, $25, $26

RoomGBCOverlayDD::
    db $0A, $0A, $0A, $0A, $0A, $0A, $0C, $62, $FB, $37
    db $0A, $0A, $0A, $0A, $55, $5A, $56, $62, $FE, $37
    db $0A, $0A, $5C, $5C, $57, $59, $58, $62, $FB, $37
    db $0A, $0A, $5C, $61, $5B, $E2, $5B, $62, $FC, $2E
    db $0A, $0A, $0C, $0C, $0C, $0C, $62, $FB, $44, $39
    db $FF, $FC, $0C, $0A, $62, $62, $62, $F8, $25, $26
    db $62, $62, $0C, $62, $62, $FA, $F8, $04, $27, $28
    db $25, $26, $0C, $25, $26, $04, $25, $26, $25, $26

RoomGBCOverlayDE::
    db $36, $2F, $2F, $34, $08, $2E, $2F, $2F, $2F, $2F
    db $B6, $08, $08, $08, $08, $39, $3A, $3A, $3A, $3A
    db $B7, $08, $3D, $35, $08, $08, $69, $08, $08, $08
    db $3C, $03, $38, $08, $08, $08, $08, $08, $08, $08
    db $37, $03, $38, $69, $08, $08, $08, $08, $08, $08
    db $37, $03, $32, $2C, $2D, $08, $08, $08, $08, $2B
    db $37, $03, $03, $09, $38, $08, $08, $08, $08, $37
    db $37, $03, $03, $03, $38, $08, $2B, $2C, $2C, $31

RoomGBCOverlayDF::
    db $4E, $08, $69, $69, $08, $08, $33, $2F, $35, $38
    db $3B, $08, $08, $69, $08, $08, $08, $08, $08, $38
    db $08, $08, $08, $08, $69, $08, $08, $08, $08, $38
    db $08, $08, $08, $08, $08, $69, $08, $08, $08, $38
    db $08, $08, $08, $08, $08, $36, $2F, $3C, $08, $38
    db $2D, $08, $08, $08, $08, $08, $08, $37, $03, $38
    db $38, $08, $08, $08, $08, $08, $C8, $37, $03, $38
    db $32, $2C, $2C, $2C, $2C, $2C, $2C, $31, $03, $38

RoomGBCOverlayE0::
    db $37, $03, $03, $03, $39, $3A, $3A, $3A, $3A, $3A
    db $37, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $37, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $37, $03, $03, $03, $B6, $B7, $B6, $B7, $03, $B6
    db $37, $03, $03, $03, $CD, $CE, $CD, $CE, $03, $CD
    db $37, $03, $03, $03, $03, $03, $03, $03, $03, $B6
    db $37, $03, $03, $03, $03, $5C, $03, $5C, $5C, $CD
    db $37, $03, $03, $3D, $2F, $48, $E0, $49, $2F, $2F

RoomGBCOverlayE1::
    db $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A
    db $03, $03, $D4, $03, $03, $5C, $5C, $5C, $B6, $B7
    db $03, $03, $03, $03, $03, $03, $03, $03, $CD, $CE
    db $B7, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $CE, $03, $03, $3D, $2F, $35, $03, $03, $36, $2F
    db $B7, $03, $03, $38, $08, $08, $08, $08, $08, $08
    db $CE, $5C, $5C, $38, $08, $08, $24, $08, $08, $08
    db $2F, $2F, $2F, $4E, $08, $08, $08, $08, $2B, $2C

RoomGBCOverlayE2::
    db $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A
    db $B6, $B7, $03, $03, $03, $03, $03, $03, $B6, $B7
    db $CD, $CE, $03, $03, $03, $03, $03, $03, $CD, $CE
    db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $3C, $03, $03
    db $08, $08, $24, $08, $08, $08, $08, $37, $B6, $B7
    db $08, $08, $08, $08, $24, $08, $08, $37, $CD, $CE
    db $2C, $2D, $08, $08, $08, $08, $08, $2E, $3C, $03

RoomGBCOverlayE3::
    db $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A
    db $B6, $B7, $03, $52, $52, $52, $B6, $B7, $B6, $B7
    db $CD, $CE, $03, $5B, $E2, $5B, $CD, $CE, $CD, $CE
    db $03, $03, $5C, $03, $03, $03, $03, $03, $03, $03
    db $03, $03, $5C, $03, $03, $03, $03, $03, $03, $03
    db $B6, $B7, $03, $03, $03, $03, $B6, $B7, $B6, $B7
    db $CD, $CE, $03, $03, $03, $03, $CD, $CE, $CD, $CE
    db $03, $3D, $48, $4A, $4A, $4A, $49, $2F, $2F, $2F

RoomGBCOverlayE4::
    db $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A
    db $B6, $B7, $B6, $B7, $B6, $B7, $08, $08, $08, $08
    db $CD, $CE, $CD, $CE, $CD, $CE, $08, $08, $08, $08
    db $03, $03, $5C, $08, $08, $08, $08, $08, $24, $08
    db $03, $03, $5C, $08, $08, $08, $08, $08, $08, $08
    db $B6, $B7, $3D, $35, $08, $08, $08, $08, $08, $08
    db $CD, $CE, $38, $08, $24, $08, $08, $08, $08, $2B
    db $2F, $2F, $4E, $08, $08, $08, $08, $08, $08, $37

RoomGBCOverlayE5::
    db $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $37
    db $08, $08, $08, $08, $08, $24, $08, $08, $08, $2E
    db $08, $08, $08, $C8, $08, $08, $08, $A0, $20, $39
    db $08, $24, $08, $08, $08, $08, $C8, $20, $F5, $F9
    db $08, $08, $08, $08, $08, $08, $08, $20, $FB, $FF
    db $08, $08, $C8, $08, $08, $08, $36, $3C, $F7, $FA
    db $2D, $08, $08, $08, $08, $08, $08, $33, $2F, $3C
    db $32, $2C, $2C, $2C, $2D, $08, $08, $08, $08, $37

RoomGBCOverlayE6::
    db $27, $28, $27, $28, $27, $28, $3D, $35, $27, $28
    db $2F, $2F, $2F, $2F, $2F, $2F, $4E, $0A, $0A, $0A
    db $3A, $3A, $3A, $3A, $3A, $3A, $3B, $0A, $0A, $0A
    db $F9, $F6, $25, $26, $C6, $0A, $0A, $0A, $25, $26
    db $FF, $FC, $27, $28, $25, $26, $25, $26, $27, $29
    db $FA, $FA, $F6, $04, $27, $28, $27, $28, $04, $27
    db $3D, $2F, $3C, $F6, $04, $04, $04, $04, $04, $25
    db $38, $3A, $2E, $3C, $F9, $F6, $04, $04, $04, $27

RoomGBCOverlayE7::
    db $27, $28, $27, $28, $27, $28, $27, $29, $2A, $28
    db $0A, $0A, $0A, $0A, $0A, $0A, $C6, $27, $28, $F5
    db $0A, $0A, $0A, $0A, $0A, $0A, $25, $26, $F5, $44
    db $25, $26, $25, $26, $0A, $25, $2A, $28, $F7, $FF
    db $2A, $28, $27, $29, $26, $27, $28, $04, $04, $FB
    db $28, $F7, $F6, $27, $28, $44, $F6, $E8, $F5, $FF
    db $26, $04, $F7, $FD, $FD, $FA, $FA, $F9, $FF, $FF
    db $28, $25, $26, $25, $26, $25, $26, $FB, $44, $FF

RoomGBCOverlayE8::
    db $27, $28, $04, $38, $0E, $0E, $0E, $0E, $0E, $0E
    db $F9, $F6, $04, $38, $0E, $0E, $0E, $0E, $0E, $0E
    db $FF, $FF, $F6, $32, $2C, $2C, $2C, $2D, $0E, $0E
    db $FF, $FF, $FA, $FD, $FA, $F6, $09, $38, $0E, $0E
    db $FA, $F8, $25, $45, $26, $FB, $F6, $38, $0E, $0E
    db $03, $04, $27, $E1, $28, $F7, $FF, $32, $2C, $2C
    db $03, $03, $03, $04, $09, $04, $F7, $FA, $FF, $F9
    db $03, $03, $03, $03, $03, $03, $04, $04, $F7, $FA

RoomGBCOverlayE9::
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
    db $0E, $0E, $0E, $0E, $2B, $2C, $2C, $2C, $2C, $2C
    db $0E, $0E, $0E, $CA, $37, $04, $C6, $04, $04, $F5
    db $0E, $0E, $0E, $0E, $33, $3C, $04, $F5, $F9, $FF
    db $0E, $0E, $CA, $0E, $0E, $37, $F5, $FA, $44, $FF
    db $2C, $2C, $2C, $2D, $0E, $33, $2F, $3C, $F7, $FA
    db $0A, $0A, $5C, $38, $0E, $0E, $0E, $33, $2F, $2F
    db $FF, $0A, $0A, $38, $0E, $0E, $0E, $CA, $CA, $CA

RoomGBCOverlayEA::
    db $0E, $0E, $0E, $37, $44, $FA, $F8, $38, $0E, $0E
    db $2C, $2C, $2D, $33, $2F, $DB, $2F, $34, $0E, $0E
    db $F9, $44, $38, $0E, $CA, $DB, $0E, $0E, $0E, $0E
    db $FF, $FC, $32, $2D, $CA, $DB, $CA, $0E, $2B, $2C
    db $44, $F8, $04, $32, $2D, $DB, $CA, $2B, $31, $04
    db $F8, $04, $25, $26, $32, $DB, $2C, $31, $F5, $F9
    db $3C, $04, $27, $28, $04, $04, $F7, $44, $FF, $FA
    db $37, $04, $04, $25, $26, $04, $04, $F7, $FC, $25

RoomGBCOverlayEB::
    db $0E, $37, $FF, $FF, $FF, $FF, $FF, $44, $38, $0E
    db $0E, $37, $F7, $44, $FF, $FF, $FF, $F8, $38, $0E
    db $0E, $37, $04, $FB, $FF, $FF, $FC, $04, $38, $0E
    db $2C, $31, $F5, $FA, $44, $FF, $FF, $F6, $38, $0E
    db $F5, $F9, $F8, $04, $F7, $FF, $44, $F8, $38, $0E
    db $FF, $F8, $25, $26, $04, $F7, $F8, $04, $38, $0E
    db $44, $04, $27, $28, $04, $04, $04, $04, $38, $0E
    db $26, $25, $26, $44, $F6, $04, $04, $3D, $34, $0E

RoomGBCOverlayEC::
    db $0E, $0E, $37, $FC, $27, $28, $27, $28, $27, $28
    db $0E, $0E, $37, $FE, $3D, $2F, $2F, $2F, $2F, $2F
    db $0E, $0E, $37, $FB, $38, $1B, $1B, $1B, $1B, $1B
    db $0E, $2B, $31, $FC, $38, $2B, $2C, $2D, $1B, $1B
    db $0E, $37, $44, $FC, $38, $37, $E8, $38, $1B, $1B
    db $0E, $37, $FF, $FF, $38, $33, $E0, $34, $1B, $1B
    db $0E, $37, $FB, $44, $38, $1B, $1B, $1B, $1B, $1B
    db $0E, $37, $FB, $FF, $32, $2C, $2C, $2C, $2C, $2C

RoomGBCOverlayED::
    db $27, $28, $44, $27, $28, $04, $27, $28, $27, $28
    db $2F, $3C, $F8, $25, $26, $04, $F5, $44, $2B, $2C
    db $1B, $37, $04, $27, $28, $F5, $FF, $2B, $31, $03
    db $1B, $33, $E0, $3C, $04, $FB, $F8, $37, $03, $03
    db $1B, $1B, $1B, $37, $F5, $FC, $2B, $31, $03, $03
    db $1B, $1B, $1B, $37, $FB, $FF, $37, $03, $03, $03
    db $1B, $1B, $1B, $37, $FF, $44, $37, $03, $03, $03
    db $2C, $2C, $2C, $31, $44, $FF, $37, $03, $03, $03

RoomGBCOverlayEE::
    db $37, $09, $03, $03, $38, $08, $33, $2F, $2F, $2F
    db $31, $03, $03, $03, $38, $08, $08, $08, $08, $B6
    db $03, $03, $03, $03, $38, $08, $08, $08, $08, $B7
    db $03, $3D, $2F, $2F, $4E, $08, $08, $08, $08, $08
    db $09, $38, $3A, $3A, $3B, $08, $08, $08, $08, $08
    db $03, $38, $08, $08, $08, $08, $08, $C8, $08, $08
    db $03, $38, $08, $C8, $08, $08, $08, $08, $08, $08
    db $03, $38, $08, $08, $08, $08, $08, $08, $08, $B6

RoomGBCOverlayEF::
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $3C, $03, $38
    db $B6, $08, $08, $08, $08, $08, $08, $37, $03, $38
    db $B7, $08, $08, $08, $08, $08, $08, $37, $03, $38
    db $08, $08, $08, $08, $69, $08, $08, $37, $03, $38
    db $08, $08, $08, $08, $08, $08, $08, $37, $03, $38
    db $08, $08, $08, $08, $08, $08, $08, $37, $03, $38
    db $08, $08, $08, $08, $08, $08, $08, $37, $03, $38
    db $B6, $08, $08, $08, $B6, $B6, $B6, $37, $03, $38

RoomGBCOverlayF0::
    db $37, $03, $03, $38, $3A, $3A, $E0, $3A, $3A, $3A
    db $37, $03, $03, $38, $08, $08, $08, $08, $08, $08
    db $37, $03, $03, $38, $08, $08, $08, $24, $08, $08
    db $2E, $3C, $03, $38, $08, $08, $08, $08, $08, $08
    db $39, $37, $03, $38, $08, $08, $C8, $08, $08, $08
    db $1F, $2E, $2F, $4E, $1E, $1E, $1E, $1E, $1E, $1E
    db $1F, $39, $3A, $3B, $1F, $1F, $1F, $1F, $1F, $1F
    db $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F

RoomGBCOverlayF1::
    db $3A, $3A, $3A, $3B, $08, $08, $08, $08, $37, $03
    db $08, $08, $08, $08, $08, $08, $24, $08, $2E, $2F
    db $08, $08, $08, $08, $08, $08, $08, $08, $39, $3A
    db $08, $08, $08, $C8, $08, $08, $08, $08, $24, $08
    db $08, $08, $08, $08, $23, $08, $C8, $08, $08, $2B
    db $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $37
    db $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $2E
    db $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $39

RoomGBCOverlayF2::
    db $03, $38, $08, $08, $08, $08, $08, $3E, $2E, $2F
    db $2F, $4E, $08, $08, $08, $08, $08, $39, $3E, $3A
    db $3A, $3B, $08, $08, $08, $08, $08, $08, $39, $3A
    db $08, $08, $08, $08, $08, $23, $08, $08, $24, $08
    db $2C, $2D, $08, $08, $23, $08, $08, $C8, $08, $08
    db $03, $38, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E
    db $2F, $4E, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F
    db $3A, $3B, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F

RoomGBCOverlayF3::
    db $2F, $4E, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A
    db $3A, $3F, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A
    db $3A, $3B, $08, $24, $08, $08, $08, $08, $08, $08
    db $08, $08, $08, $08, $08, $08, $08, $08, $24, $08
    db $08, $08, $08, $C8, $08, $08, $08, $08, $08, $08
    db $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E
    db $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F
    db $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F

RoomGBCOverlayF4::
    db $3A, $3A, $3F, $08, $08, $08, $08, $08, $08, $37
    db $3A, $BA, $3B, $08, $08, $24, $08, $08, $08, $37
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $37
    db $08, $08, $08, $08, $C8, $08, $08, $08, $24, $37
    db $08, $24, $08, $08, $08, $08, $08, $08, $08, $37
    db $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $37
    db $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $33
    db $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F

RoomGBCOverlayF5::
    db $03, $3D, $2F, $2F, $34, $08, $08, $08, $08, $37
    db $03, $38, $08, $08, $08, $24, $08, $08, $08, $37
    db $3D, $4E, $B6, $B7, $08, $08, $08, $B6, $B7, $37
    db $38, $3B, $CD, $CE, $08, $08, $08, $CD, $CE, $37
    db $38, $08, $08, $C8, $08, $08, $08, $08, $08, $37
    db $38, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $2E
    db $34, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $3E
    db $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $39

RoomGBCOverlayF6::
    db $38, $0E, $39, $37, $FF, $FF, $F6, $04, $04, $25
    db $38, $0E, $0E, $37, $0A, $0A, $44, $F9, $F6, $27
    db $38, $0E, $0E, $37, $52, $52, $52, $0A, $0A, $F9
    db $38, $0E, $0E, $37, $5B, $E2, $5B, $0A, $FF, $FF
    db $38, $0E, $0E, $2E, $3C, $0A, $0A, $04, $F7, $44
    db $4E, $0E, $0E, $39, $2E, $2F, $3C, $F6, $04, $F7
    db $3B, $0E, $0E, $0E, $39, $3A, $2E, $2F, $2F, $2F
    db $3B, $0E, $0E, $0E, $0E, $0E, $39, $3A, $3A, $3A

RoomGBCOverlayF7::
    db $26, $27, $29, $2A, $29, $2A, $28, $44, $FA, $F8
    db $28, $25, $2A, $29, $2A, $29, $26, $F8, $25, $26
    db $F6, $27, $28, $27, $28, $27, $28, $04, $27, $28
    db $FC, $04, $04, $E8, $E8, $E8, $04, $04, $3D, $2F
    db $FF, $F6, $25, $26, $25, $26, $25, $26, $38, $0E
    db $FF, $F8, $27, $28, $27, $28, $27, $28, $38, $0E
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $4E, $0E
    db $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3B, $0E

RoomGBCOverlayF8::
    db $04, $F5, $F6, $04, $F5, $FD, $F9, $F9, $F6, $04
    db $3D, $2F, $48, $E0, $49, $3C, $F7, $FA, $44, $F6
    db $38, $0E, $0E, $0E, $0E, $33, $2F, $3C, $F7, $FF
    db $34, $0E, $2B, $2C, $2C, $2D, $0E, $37, $04, $F7
    db $CA, $0E, $37, $04, $5C, $38, $0E, $37, $F6, $04
    db $CA, $0E, $33, $E0, $2F, $34, $0E, $37, $FA, $F9
    db $CA, $0E, $0E, $0E, $CA, $0E, $0E, $2E, $3C, $44
    db $0E, $CA, $CA, $CA, $0E, $0E, $0E, $39, $2E, $2F

RoomGBCOverlayF9::
    db $F7, $FA, $FF, $38, $0E, $0E, $0E, $CA, $CA, $CA
    db $04, $04, $F7, $32, $2C, $2C, $2C, $2C, $2C, $2D
    db $F9, $F6, $04, $E8, $E8, $5C, $5C, $5C, $5C, $38
    db $FF, $FC, $E8, $E8, $E8, $5C, $5C, $5C, $5C, $38
    db $F7, $F8, $E8, $E8, $5C, $5C, $5C, $C6, $5C, $38
    db $F6, $04, $E8, $E8, $5C, $5C, $5C, $5C, $5C, $38
    db $FA, $F6, $E8, $E8, $E8, $5C, $5C, $5C, $3D, $34
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $34, $0E

RoomGBCOverlayFA::
    db $37, $F5, $F6, $27, $28, $04, $04, $04, $FE, $27
    db $37, $F7, $44, $3D, $2F, $E0, $3C, $F5, $44, $25
    db $37, $04, $F7, $F2, $0E, $0E, $EA, $FB, $F8, $27
    db $37, $20, $04, $F3, $0E, $0E, $F0, $FE, $04, $04
    db $33, $3C, $F6, $F3, $0E, $0E, $F0, $44, $20, $04
    db $0E, $37, $44, $F4, $0E, $0E, $F1, $F7, $F6, $04
    db $0E, $33, $2F, $34, $0E, $CA, $33, $2F, $2F, $2F
    db $0E, $0E, $0E, $CA, $CA, $0E, $0E, $0E, $0E, $0E

RoomGBCOverlayFB::
    db $28, $27, $28, $F7, $FF, $F6, $04, $38, $0E, $0E
    db $26, $04, $04, $04, $F7, $F8, $04, $38, $0E, $0E
    db $28, $04, $04, $04, $04, $04, $04, $38, $0E, $CA
    db $04, $04, $04, $04, $04, $04, $F5, $38, $0E, $CA
    db $04, $04, $04, $F5, $F6, $3D, $2F, $34, $CA, $CA
    db $04, $04, $F5, $FC, $3D, $34, $0E, $CA, $0E, $0E
    db $2F, $2F, $2F, $2F, $34, $0E, $0E, $0E, $0E, $0E
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E

RoomGBCOverlayFC::
    db $0E, $37, $FF, $FC, $25, $26, $25, $26, $25, $26
    db $0E, $37, $44, $FC, $27, $29, $2A, $28, $27, $28
    db $2B, $31, $FF, $FC, $5C, $27, $28, $44, $04, $F5
    db $37, $FB, $FF, $44, $04, $5C, $25, $26, $04, $FB
    db $37, $44, $FF, $F8, $5C, $5C, $27, $28, $F5, $FF
    db $33, $3C, $44, $5C, $5C, $5C, $F5, $F9, $44, $FF
    db $0E, $33, $3C, $5C, $F5, $F9, $44, $FF, $FA, $FF
    db $0E, $0E, $33, $2F, $2F, $2F, $2F, $2F, $2F, $2F

RoomGBCOverlayFD::
    db $25, $26, $25, $26, $FB, $FF, $37, $03, $03, $03
    db $27, $28, $27, $28, $44, $FC, $2E, $48, $4A, $49
    db $F6, $04, $D4, $F5, $FF, $FF, $39, $3A, $3A, $3A
    db $44, $F6, $04, $FB, $FF, $FF, $44, $F8, $04, $F5
    db $FF, $FF, $F9, $44, $FF, $FA, $F8, $04, $F5, $44
    db $FF, $FF, $FF, $FF, $F8, $3D, $2F, $2F, $2F, $2F
    db $FA, $FF, $44, $F8, $3D, $34, $0E, $0E, $0E, $0E
    db $2F, $2F, $2F, $2F, $34, $0E, $0E, $0E, $0E, $0E

RoomGBCOverlayFE::
    db $09, $38, $08, $08, $08, $08, $08, $08, $08, $B7
    db $2F, $4E, $08, $08, $08, $08, $08, $08, $08, $08
    db $3A, $3B, $08, $CD, $08, $08, $CD, $08, $08, $08
    db $08, $08, $08, $CE, $08, $08, $CE, $08, $08, $B6
    db $08, $08, $08, $08, $08, $08, $08, $08, $08, $B7
    db $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F, $2F
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E

RoomGBCOverlayFF::
    db $B7, $08, $08, $08, $B7, $B7, $B7, $37, $03, $38
    db $08, $08, $08, $08, $08, $08, $08, $37, $03, $38
    db $08, $08, $08, $08, $2B, $2C, $2C, $31, $5C, $38
    db $B6, $08, $08, $08, $37, $20, $09, $03, $5C, $38
    db $B7, $08, $08, $08, $37, $20, $03, $3D, $2F, $4E
    db $2F, $2F, $2F, $2F, $2E, $2F, $2F, $4E, $3A, $3B
    db $0E, $0E, $0E, $0E, $39, $3A, $3A, $3B, $0E, $0E
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E


;
; Alternate overlays used for some rooms when major layout changes happen
;

RoomGBCOverlay06Alt::   ; Alternate Wind Fish's Egg (with entrance open)
    db $00, $00, $00, $00, $05, $06, $07, $00, $00, $00
    db $7C, $7D, $00, $80, $63, $64, $65, $81, $7C, $7D
    db $EF, $EF, $EF, $37, $71, $C1, $7F, $38, $EF, $EF
    db $E5, $E5, $1D, $37, $A9, $CB, $BF, $38, $5D, $E5
    db $E5, $E5, $37, $2E, $48, $E0, $49, $4E, $38, $E5
    db $E5, $E5, $37, $3E, $3A, $E0, $3A, $3F, $38, $E5
    db $E5, $1D, $2E, $2F, $48, $E0, $49, $2F, $4E, $5D
    db $E5, $37, $3E, $3A, $3A, $E0, $3A, $3A, $3B, $38

RoomGBCOverlay0EAlt::   ; Alternate Eagle's Tower (spun around with door and ladder)
    db $00, $00, $00, $72, $74, $74, $74, $73, $00, $00
    db $7C, $7E, $7D, $72, $75, $D6, $76, $73, $7C, $7D
    db $EF, $EF, $EF, $72, $74, $E1, $74, $73, $EF, $EF
    db $1D, $50, $50, $72, $74, $77, $74, $73, $50, $50
    db $37, $54, $20, $B6, $74, $77, $74, $B7, $03, $03
    db $37, $20, $03, $03, $03, $03, $09, $03, $03, $09
    db $2E, $3C, $03, $09, $03, $03, $03, $03, $03, $03
    db $3E, $2E, $2F, $2F, $48, $4A, $49, $48, $4A, $49

RoomGBCOverlay1BAlt::   ; Alternate Angler's Tunnel upper cliff (water drained)
    db $03, $03, $03, $03, $03, $03, $03, $38, $50, $50
    db $03, $3D, $2F, $3C, $03, $03, $03, $38, $1B, $1B
    db $2F, $4E, $E1, $2E, $2F, $2F, $2F, $4E, $03, $1B
    db $3A, $3F, $3A, $3E, $3A, $3A, $E1, $3F, $03, $03
    db $3A, $3B, $03, $39, $3A, $3A, $3A, $3B, $03, $03
    db $1B, $03, $09, $03, $03, $09, $09, $03, $03, $1B
    db $1B, $3D, $48, $4A, $4A, $4A, $49, $3C, $09, $03
    db $2F, $4E, $3A, $3A, $3A, $3A, $3A, $2E, $2F, $2F

RoomGBCOverlay2BAlt::   ; Alternate Angler's Tunnel entrance (waterfall turned off)
    db $3A, $3F, $3A, $D5, $D6, $D7, $3A, $3E, $3A, $3A
    db $3A, $3F, $3A, $CD, $E1, $CE, $3A, $3E, $3A, $3A
    db $3A, $3B, $03, $09, $03, $09, $C6, $39, $3A, $3A
    db $0E, $0E, $1B, $1B, $03, $03, $09, $0E, $0E, $0E
    db $0E, $0E, $0E, $1B, $1B, $1B, $1B, $0E, $0E, $0E
    db $2C, $2C, $2C, $2C, $54, $2C, $2C, $2C, $2C, $2C
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db $2C, $2D, $2B, $2C, $2D, $2B, $2C, $2D, $2B, $2C

RoomGBCOverlay79Alt::   ; Alternate Kanalet Castle entry (gate down)
    db $96, $96, $9D, $9E, $0D, $0C, $0D, $9D, $9E, $96
    db $93, $93, $97, $98, $0D, $0C, $0D, $97, $98, $93
    db $0E, $0E, $94, $95, $0D, $0C, $0D, $94, $95, $0E
    db $0E, $0E, $0E, $9F, $0D, $0C, $0D, $9F, $0E, $0E
    db $0E, $0E, $0E, $9A, $0D, $0C, $0D, $9A, $0E, $0E
    db $2C, $2C, $2C, $A3, $0D, $0C, $0D, $A3, $2C, $2C
    db $F7, $FA, $FF, $F9, $F6, $0C, $F5, $F9, $FF, $FA
    db $25, $26, $FB, $FF, $FC, $0C, $FB, $FF, $FC, $25

RoomGBCOverlay8CAlt::   ; Alternate Northern Face Shrine (entrance raised)
    db $38, $B3, $B3, $B3, $B3, $B3, $3A, $3A, $3A, $3A
    db $38, $B3, $B3, $B3, $B3, $B3, $47, $3A, $3A, $3A
    db $38, $AD, $B1, $E7, $AD, $B1, $38, $70, $47, $3A
    db $38, $AE, $B2, $E3, $AE, $B2, $F2, $04, $38, $0E
    db $38, $B9, $B8, $B9, $B8, $B9, $F3, $04, $F2, $0E
    db $38, $B6, $B9, $B9, $B9, $B6, $F4, $04, $F3, $0E
    db $38, $B7, $B9, $B9, $B9, $B7, $38, $04, $F4, $0E
    db $38, $2F, $48, $E0, $49, $2F, $4E, $04, $38, $0E

