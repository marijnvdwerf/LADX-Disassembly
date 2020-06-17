;
; Code for the entities system.
;

; Tell if Bow-Wow can eat an entity of the given type.
; Inputs:
;   de   entity type
; Return:
;   a    value read from BowWowEatableEntitiesTable
CanBowWowEatEntity::
    ld   a, $14
    ld   [MBC3SelectBank], a
    ld   hl, BowWowEatableEntitiesTable
    add  hl, de
    ld   a, [hl]
    ld   hl, MBC3SelectBank
    ld   [hl], $05
    ret

label_3935::
    callsw func_019_7C50
    ld   a, $03
    jp   SwitchBank

label_3942::
    callsb func_003_53E4
    jp   ReloadSavedBank

label_394D::
    callsb func_014_54AC
    jp   ReloadSavedBank

CreateFollowingNpcEntity_trampoline::
    callsw CreateFollowingNpcEntity
    ld   a, $02
    jp   SwitchBank

label_3965::
    callsb ConfigureNewEntity
    jp   ReloadSavedBank

label_397B::
    callsb func_014_5347
    ld   a, $03
    ld   [MBC3SelectBank], a
    ret

data_3989::
    db   0, 8, $10, $18

; Loop through all active entities, and call the relevant handler depending
; on their state.
AnimateEntities::
    ; Play the Boss Agony audio effect if needed
    ld   hl, wBossAgonySFXCountdown
    ld   a, [hl]
    and  a
    jr   z, .bossAgonyEnd
    dec  [hl]
    jr   nz, .bossAgonyEnd
    ld   a, WAVE_SFX_BOSS_AGONY
    ldh  [hWaveSfx], a
.bossAgonyEnd

    ; If no dialog is open…
    ld   a, [wDialogState]
    and  a
    jr   nz, .C111End
    ; … decrement $C111
    ld   a, [$C111]
    ld   [$C1A8], a
    and  a
    jr   z, .C111End
    dec  a
    ld   [$C111], a
.C111End

    ; If Link is passing out, return
    ld   a, [wLinkMotionState]
    cp   LINK_MOTION_PASS_OUT
    ret  z

    xor  a
    ld   [$C3C1], a
    ldh  a, [hMapId]
    cp   MAP_CAVE_B
    ldh  a, [hFrameCounter]
    jr   c, .label_39C1
    xor  a

.label_39C1
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, data_3989
    add  hl, de
    ld   a, [hl]
    ld   [wOAMNextAvailableSlot], a
    ld   a, [$C5A0]                               ; $4303: $FA $A0 $C5
    ld   [$C5A1], a                               ; $4306: $EA $A1 $C5
    xor  a                                        ; $4309: $AF
    ld   [$C5A0], a                               ; $430A: $EA $A0 $C5
    ld   [wC10C], a                               ; $430D: $EA $0C $C1
    ldh  [hFFB2], a                               ; $4310: $E0 $B2
    ld   [wC117], a                               ; $4312: $EA $17 $C1
    ld   [$C19D], a                               ; $4315: $EA $9D $C1
    ld   [$C147], a                               ; $4318: $EA $47 $C1
    ld   [wLiftedEntityType], a                   ; $431B: $EA $A8 $C5
    ld   [$D45E], a                               ; $431E: $EA $5E $D4
    ld   a, [wDialogState]
    and  a
    jr   nz, .label_39E3
    ld   [$C1AD], a

.label_39E3
    ld a, $02                                     ; $38ab: $3e $02
    call SwitchAdjustedBank                       ; $38ad: $cd $b9 $07
    call $63e6                                    ; $38b0: $cd $e6 $63

    ; Initialize the entities counter
    ld   b, $00
    ld   c, MAX_ENTITIES - 1

    ; For each entity slot…
.loop
    ; Save the active entity index
    ld   a, c
    ld   [wActiveEntityIndex], a

    ; Read the entity state
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   a, [hl]

    ; If state != 0…
    and  a
    jr   z, .AnimateEntityEnd

    ; animate the entity.
    ldh  [hActiveEntityStatus], a
    call AnimateEntity
.AnimateEntityEnd

    ; While c >= 0, loop
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, .loop

.return
    ret

ResetEntity_trampoline::
    callsb ResetEntity
    ld   a, $03
    ld   [MBC3SelectBank], a
    ret

; For a given entity slot, call the relevant entity handler
; (depending on the entity state).
;
; Inputs:
;   bc   entity index
AnimateEntity::
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityType], a

    ld   hl, wEntitiesStateTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityState], a

    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntitySpriteVariant], a

    ld   a, BANK(UpdateEntityPositionForRoomTransition)
    call SwitchAdjustedBank

    ldh  a, [hActiveEntityType]
    cp   ENTITY_RAFT_RAFT_OWNER
    jr   nz, .raftManEnd
    ldh  a, [$FFB2]
    and  a
    jr   nz, .entityLifted
.raftManEnd

    ldh  a, [hActiveEntityStatus]
    cp   ENTITY_STATUS_LIFTED
    jr   nz, .notLifted
.entityLifted
    call UpdateEntityPositionForRoomTransition
    call CopyEntityPositionToActivePosition
    jr   .liftedEnd
.notLifted
    call CopyEntityPositionToActivePosition
    call UpdateEntityPositionForRoomTransition
.liftedEnd

    ld   a, BANK(UpdateEntityTimers)
    call SwitchAdjustedBank
    call UpdateEntityTimers

    ; Select bank 3
    ld   a, $03
    call SwitchAdjustedBank

    ldh  a, [hActiveEntityStatus]
    cp   ENTITY_STATUS_ACTIVE
    jp   z, ExecuteActiveEntityHandler
    JP_TABLE
._00 dw AnimateEntities.return
._01 dw EntityDeathHandler
._02 dw EntityFallHandler
._03 dw EntityDestructionHandler
._04 dw EntityInitHandler
._05 dw ExecuteActiveEntityHandler
._06 dw EntityStunnedHandler
._07 dw EntityLiftedHandler
._08 dw EntityThrownHandler

; Execute active entity handler, then return to bank 3
ExecuteActiveEntityHandler_trampoline::
    call ExecuteActiveEntityHandler
    ld   a, $03
    jp SwitchAdjustedBank

; Read the entity handler address in the handlers table,
; then jump to execution.
ExecuteActiveEntityHandler::

    ; de = active entity id
    ldh  a, [hActiveEntityType]
    ld   e, a
    ld   d, b

    ; hl = de * 3
    ld hl, $4000                                  ; $3949: $21 $00 $40
    add hl, de                                    ; $394c: $19
    ld a, [hl]                                    ; $394d: $7e
    call SwitchAdjustedBank
    ld a, e
    JP_TABLE
._00 dw ArrowEntityHandler
._01 dw BoomerangEntityHandler
._02 dw BombEntityHandler
._03 dw HookshotChainEntityHandler
._04 dw HookshotHitEntityHandler
._05 dw LiftableRockEntityHandler
._06 dw PushedBlockEntityHandler
._07 dw ChestWithItemEntityHandler
._08 dw MagicPowderSprinkleEntityHandler
._09 dw OctorockEntityHandler
._0A dw OctorockRockEntityHandler
._0B dw MoblinEntityHandler
._0C dw MoblinArrowEntityHandler
._0D dw TektiteEntityHandler
._0E dw LeeverEntityHandler
._0F dw ArmosStatueEntityHandler
._10 dw HidingGhiniEntityHandler
._11 dw GiantGhiniEntityHandler
._12 dw GhiniEntityHandler
._13 dw HeartContainerTilesTable
._14 dw MoblinSwordEntityHandler ; $14
._15 dw AntiFairyEntityHandler
._16 dw SparkClockwiseEntityHandler
._17 dw SparkCounterClockwiseEntityHandler
._18 dw PolsVoiceEntityHandler ; $18
._19 dw KeeseEntityHandler
._1A dw StalfosAggressiveEntityHandler
._1B dw GelEntityHandler
._1C dw MiniGelEntityHandler ; $1C
._1D dw 0
._1E dw StalfosEvasiveEntityHandler
._1F dw GibdoEntityHandler
._20 dw HardHatBeetleEntityHandler ; $20
._21 dw WizrobeEntityHandler
._22 dw WizrobeProjectileEntityHandler
._23 dw LikeLikeEntityHandler
._24 dw IronMaskEntityHandler ; $24
._25 dw EntityExplosionDisplayList ; small exploding ennemy
._26 dw EntityExplosionDisplayList ; small exploding ennemy 2
._27 dw SpikeTrapEntityHandler
._28 dw MimicEntityHandler ; $28
._29 dw MiniMoldromEntityHandler
._2A dw LaserEntityHandler
._2B dw LaserBeamEntityHandler
._2C dw SpikedBeetleEntityHandler ; $2C
._2D dw DroppableHeartEntityHandler
._2E dw DroppableRupeeEntityHandler
._2F dw DroppableFairyEntityHandler
._30 dw KeyDropPointEntityHandler ; $30
._31 dw SwordEntityHandler
._32 dw Entity32Handler
._33 dw PieceOfPowerEntityHandler
._34 dw GuardianAcornEntityHandler ; $34
._35 dw HeartPieceEntityHandler
._36 dw HeartContainerEntityHandler
._37 dw DroppableArrowsEntityHandler
._38 dw DroppableBombsEntityHandler ; $38
._39 dw SirensInstrumentEntityHandler
._3A dw SleepyToadstoolEntityHandler
._3B dw DroppableMagicPowderEntityHandler
._3C dw HidingSlimeKeyEntityHandler ; $3C
._3D dw DroppableSeashellEntityHandler
._3E dw MarinEntityHandler
._3F dw RacoonEntityHandler
._40 dw WitchEntityHandler ; $40
._41 dw OwlEventEntityHandler
._42 dw OwlStatueEntityHandler
._43 dw SeashellMansionTreesEntityHandler
._44 dw YarnaTalkingBonesEntityHandler ; $44
._45 dw BouldersEntityHandler
._46 dw MovingBlockLeftTopEntityHandler
._47 dw MovingBlockLeftBottomEntityHandler
._48 dw MovingBlockBottomLeftEntityHandler ; $48
._49 dw MovingBlockBottomRightEntityHandler
._4A dw 0
._4B dw PotEntityHandler
._4C dw 0
._4D dw ShopOwnerEntityHandler
._4E dw Disabled4EEntityHandler
._4F dw TrendyGameOwnerEntityHandler
._50 dw BooBuddyEntityHandler ; $50
._51 dw KnightEntityHandler
._52 dw TractorDeviceEntityHandler
._53 dw ReversedTractorDeviceEntityHandler
._54 dw FishermanFishingGameEntityHandler ; $54
._55 dw BouncingBombiteEntityHandler
._56 dw TimerBombiteEntityHandler
._57 dw PairoddEntityHandler
._58 dw PairoddProjectileEntityHandler
._59 dw MoldormEntityHandler
._5A dw FacadeEntityHandler
._5B dw SlimeEyeEntityHandler
._5C dw GenieEntityHandler ; $5C
._5D dw SlimeEelEntityHandler
._5E dw GhomaEntityHandler
._5F dw MasterStalfosEntityHandler
._60 dw DodongoSnakeEntityHandler ; $60
._61 dw WarpEntityHandler
._62 dw HotHeadEntityHandler
._63 dw EvilEagleEntityHandler
._64 dw SouthFaceShrineDoorEntityHandler ; $64
._65 dw AnglerFishEntityHandler
._66 dw CrystalSwitchEntityHandler
._67 dw Entity67Handler
._68 dw Entity68Handler ; $68
._69 dw MovingBlockMoverEntityHandler
._6A dw EntityRaftOwnerHandler
._6B dw TextDebuggerEntityHandler
._6C dw CuccoEntityHandler ; $6C
._6D dw BowWowEntityHandler
._6E dw ButterflyEntityHandler
._6F dw DogEntityHandler
._70 dw Kid70EntityHandler ; $70
._71 dw Kid71EntityHandler
._72 dw Kid72EntityHandler
._73 dw Kid73EntityHandler
._74 dw PapahlsWifeEntityHandler ; $74
._75 dw GrandmaUlriraEntityHandler
._76 dw MrWriteEntityHandler
._77 dw GrandpaUlriraEntityHandler
._78 dw YipYipEntityHandler ; $78
._79 dw MadamMeowMeowEntityHandler
._7A dw CrowEntityHandler
._7B dw CrazyTracyEntityHandler
._7C dw GiantGopongaFlowerEntityHandler ; $7C
._7D dw GopongaProjectileEntityHandler
._7E dw GopongaFlowerEntityHandler
._7F dw TurtleRockHeadEntityHandler
._80 dw TelephoneEntityHandler ; $80
._81 dw RollingBonesEntityHandler
._82 dw RollingBonesBarEntityHandler
._83 dw DreamShrineBedEntityHandler
._84 dw BigFairyEntityHandler ; $84
._85 dw MrWriteBirdEntityHandler
._86 dw FloatingItemEntityHandler
._87 dw DesertLanmolaEntityHandler
._88 dw ArmosKnightEntityHandler ; $88
._89 dw HinoxEntityHandler
._8A dw 0
._8B dw 0
._8C dw Entity8CHandler ; $8C
._8D dw Entity8DHandler
._8E dw CueBallEntityHandler
._8F dw MaskedMimicGoriyaEntityHandler
._90 dw ThreeOfAKindEntityHandler ; $90
._91 dw AntiKirbyEntityHandler
._92 dw SmasherEntityHandler
._93 dw MadBomberEntityHandler
._94 dw KanaletBombableWallEntityHandler ; $94
._95 dw RichardEntityHandler
._96 dw RichardFrogEntityHandler
._97 dw Entity97Handler
._98 dw HorsePieceEntityHandler ; $98
._99 dw WaterTektiteEntityHandler
._9A dw FlyingTilesEntityHandler
._9B dw HidingGelEntityHandler
._9C dw StarEntityHandler ; $9C
._9D dw LiftableStatueEntityHandler
._9E dw FireballShooterEntityHandler
._9F dw GoombaEntityHandler
._A0 dw PeaHatEntityHandler ; $A0
._A1 dw SnakeEntityHandler
._A2 dw 0
._A3 dw SideViewPlatformHorizontalEntityHandler
._A4 dw SideViewPlatformVerticalEntityHandler ; $A4
._A5 dw SideViewPlatformEntityHandler
._A6 dw SideViewWeightsEntityHandler
._A7 dw SmashablePillarEntityHandler
._A8 dw EntityA8Handler ; $A8
._A9 dw BlooperEntityHandler
._AA dw CheepCheepHorizontalEntityHandler
._AB dw CheepCheepVerticalEntityHandler
._AC dw CheepCheepJumpingEntityHandler ; $AC
._AD dw KikiTheMonkeyEntityHandler
._AE dw WingedOctorockEntityHandler
._AF dw TradingItemEntityHandler
._B0 dw PincerEntityHandler ; $B0
._B1 dw HoleFillerEntityHandler
._B2 dw BeetleSpawnerEntityHandler
._B3 dw HoneycombEntityHandler
._B4 dw TarinEntityHandler ; $B4
._B5 dw BearEntityHandler
._B6 dw PapahlEntityHandler
._B7 dw MermaidEntityHandler
._B8 dw FishermanUnderBridgeEntityHandler ; $B8
._B9 dw BuzzBlobEntityHandler
._BA dw BomberEntityHandler
._BB dw BushCrawlerEntityHandler
._BC dw GrimCreeperEntityHandler ; $BC
._BD dw VireEntityHandler
._BE dw BlainoEntityHandler
._BF dw ZombieEntityHandler
._C0 dw MazeSignpostEntityHandler ; $C0
._C1 dw MarinAtTheShoreEntityHandler
._C2 dw MarinAtTalTalHeightsEntityHandler
._C3 dw MamuAndFrogsEntityHandler
._C4 dw WalrusEntityHandler ; $C4
._C5 dw UrchinEntityHandler
._C6 dw SandCrabEntityHandler
._C7 dw ManboAndFishesEntityHandler
._C8 dw BunnyCallingMarinEntityHandler ; $C8
._C9 dw MusicalNoteEntityHandler
._CA dw MadBatterEntityHandler
._CB dw ZoraEntityHandler
._CC dw FishEntityHandler ; $CC
._CD dw BananasSchuleSaleEntityHandler
._CE dw MermaidStatueEntityHandler
._CF dw SeashellMansionEntityHandler
._D0 dw AnimalD0EntityHandler ; $D0
._D1 dw AnimalD1EntityHandler
._D2 dw AnimalD2EntityHandler
._D3 dw BunnyD3EntityHandler
._D4 dw GhostEntityHandler ; $D4
._D5 dw RoosterEntityHandler
._D6 dw SideViewPotEntityHandler
._D7 dw ThwimpEntityHandler
._D8 dw ThwompEntityHandler ; $D8
._D9 dw ThwompRammableEntityHandler
._DA dw PodobooEntityHandler
._DB dw GiantBubbleEntityHandler
._DC dw FlyingRoosterEventsEntityHandler ; $DC
._DD dw BookEntityHandler
._DE dw EggSongEventEntityHandler
._DF dw SwordBeamEntityHandler
._E0 dw MonkeyEntityHandler ; $E0
._E1 dw WitchRatEntityHandler
._E2 dw FlameShooterEntityHandler
._E3 dw PokeyEntityHandler
._E4 dw MoblinKingEntityHandler ; $E4
._E5 dw FloatingItem2EntityHandler
._E6 dw FinalNightmareEntityHandler
._E7 dw KanaletCastleGateSwitchEntityHandler
._E8 dw EndingOwlStairClimbingEntityHandler ; $E8

; Types of entity hitboxes
; Array indexed par (wEntitiesHitboxFlagsTable & $7C)
; Content goes into wEntitiesHitboxPositionTable
; Values:
;  - hitbox X
;  - hitbox Y
;  - ???
;  - ???
HitboxPositions:: ; 3b25
._00 db   $08, $05, $08, $05
._04 db   $08, $0A, $08, $0A
._08 db   $08, $0A, $08, $0A
._0C db   $08, $10, $04, $0A
._10 db   $08, $02, $08, $02
._14 db   $08, $13, $08, $13
._18 db   $08, $06, $06, $08
._1C db   $08, $07, $06, $0A
._20 db   $08, $06, $10, $30
._24 db   $08, $07, $04, $0A
._28 db   $0C, $07, $FC, $04
._2C db   $10, $10, $0C, $12
._30 db   $08, $08, $02, $08
._34 db   $10, $0C, $08, $10
._38 db   $08, $07, $0C, $08
._3C db   $08, $08, $02, $08

; Read hitbox params from the hitbox types table, and copy them
; to the entities hitbox table.
; Inputs:
;   bc    entity index
ConfigureEntityHitbox::
    ; de = HitboxPositions[wEntitiesHitboxFlagsTable & $7C]
    ld   hl, wEntitiesHitboxFlagsTable
    add  hl, bc
    ld   a, [hl]
    and  $7C ; '|'
    ld   e, a
    ld   d, b
    ld   hl, HitboxPositions
    add  hl, de
    push hl
    pop de
    push bc
    ; c = c * 4
    sla  c
    sla  c
    ; Destination: hl = wEntitiesHitboxPositionTable + (entity index * 4)
    ld   hl, wEntitiesHitboxPositionTable
    add  hl, bc

    ; Copy 4 bytes from HitboxPositions to wEntitiesHitboxPositionTable
    ld   c, 4
    ; While c != 0
.loop
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, .loop
    pop  bc
    ret

; Set the given value to the entity sprite variants table.
;
; Inputs:
;   a    variant value
;   bc   entity index
SetEntitySpriteVariant::
    ld   hl, wEntitiesSpriteVariantTable
    add  hl, bc
    ld   [hl], a
    ret

; Increment the state attribute of the given entity
; Input:
;   bc   entity index
IncrementEntityState::
    ld   hl, wEntitiesStateTable
    add  hl, bc
    inc  [hl]
    ret

label_3B18::
    callsb func_002_75F5
    jp   ReloadSavedBank

label_3B23::
    callsb func_003_7893
    jp   ReloadSavedBank

label_3B2E::
    callsb ApplySwordIntersectionWithObjects
    jp   ReloadSavedBank

label_3B39::
    callsb func_003_6E28
    jp   ReloadSavedBank

label_3B44::
    callsb func_003_6C6B
    jp   ReloadSavedBank

CheckLinkCollisionWithProjectile_trampoline::
    callsb CheckLinkCollisionWithProjectile
    jp   ReloadSavedBank

CheckLinkCollisionWithEnemy_trampoline::
    callsb CheckLinkCollisionWithEnemy.collisionEvenInTheAir
    jp   ReloadSavedBank

label_3B65::
    callsb func_003_73EB
    jp   ReloadSavedBank

label_3B70::
    callsb func_003_6E2B
    jp   ReloadSavedBank

label_3B7B::
    callsb func_003_75A2
    jp   ReloadSavedBank

SpawnNewEntity_trampoline::
    push af
    ld   a, BANK(SpawnNewEntity)
    ld   [MBC3SelectBank], a
    pop  af
    call SpawnNewEntity
    rr   l
    call ReloadSavedBank
    rl   l
    ret

SpawnNewEntityInRange_trampoline::
    push af
    ld   a, BANK(SpawnNewEntityInRange)
    ld   [MBC3SelectBank], a
    pop  af
    call SpawnNewEntityInRange
    rr   l
    call ReloadSavedBank
    rl   l
    ret

ApplyVectorTowardsLink_trampoline::
    ld   hl, MBC3SelectBank
    ld   [hl], BANK(ApplyVectorTowardsLink)
    call ApplyVectorTowardsLink
    jp   ReloadSavedBank

GetVectorTowardsLink_trampoline::
    ld   hl, MBC3SelectBank
    ld   [hl], BANK(GetVectorTowardsLink)
    call GetVectorTowardsLink
    jp   ReloadSavedBank

; Render a pair of sprites for the active entity to the OAM buffer.
;
; The main input is a display list containing OAM attributes (2 bytes each).
; Each display list item is a pair of OAM attributes (one for each sprite).
;
; The entity variant is used to animate the entity, by selecting one of
; the different pairs in the display list.
;
; Inputs:
;   de                          address of the display list
;   hActiveEntitySpriteVariant  the sprite variant to use
RenderActiveEntitySpritesPair::
    ; If hActiveEntitySpriteVariant == -1, return.
    ldh  a, [hActiveEntitySpriteVariant]
    inc  a
    ret  z

    call SkipDisabledEntityDuringRoomTransition

    push de

    ; de = wDynamicOAMBuffer + [wOAMNextAvailableSlot]
    ld   a, [wOAMNextAvailableSlot]
    ld   e, a
    ld   d, b
    ld   hl, wDynamicOAMBuffer
    add  hl, de
    ld   e, l
    ld   d, h

    ; Sprite 0: set OAM byte 0 (Y position)
    ; [de] = [hActiveEntityVisualPosY]
    ldh  a, [hActiveEntityVisualPosY]
    ld   [de], a
    inc  de

    ; Sprite 0: set OAM byte 1 (X position)
    ; [de] = [hActiveEntityPosX] + x-flip - [wScreenShakeHorizontal]
    ld   a, [wScreenShakeHorizontal]
    ld   c, a
    ; (if the entity is X-flipped, adjust sprite 0 position)
    ldh  a, [hActiveEntityFlipAttribute]
    and  OAMF_XFLIP
    rra
    rra
    ld   hl, hActiveEntityPosX
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  de

    ; hl = pop de + [hActiveEntitySpriteVariant] * 2
    ldh  a, [hActiveEntitySpriteVariant]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    pop  hl
    add  hl, bc

    ; Sprite 0: set OAM byte 2 (tile n°)
    ; [de] = [hl++] + [hActiveEntityTilesOffset]
    ldh  a, [hActiveEntityTilesOffset]
    ld   c, a
    ld   a, [hli]
    add  a, c
    ld   [de], a
    and  $0F
    cp   $0F
    jr   nz, .jr_3C08
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de
.jr_3C08

    inc  de

    ; Sprite 0: set OAM byte 3 (tile attribute)
    ld   a, [hli]
    push hl
    ld   hl, hActiveEntityFlipAttribute
    xor  [hl]
    ld   [de], a
    inc  de

    ; Sprite 1: set OAM byte 0 (Y position)
    ldh  a, [hActiveEntityVisualPosY]
    ld   [de], a
    inc  de

    ; Sprite 1: set OAM byte 1 (X position)
    ; [de] = [hActiveEntityPosX] + x-flip - [wScreenShakeHorizontal]
    ld   a, [wScreenShakeHorizontal]
    ld   c, a
    ; (if the entity is X-flipped, adjust sprite 0 position)
    ldh  a, [hActiveEntityFlipAttribute]
    and  OAMF_XFLIP
    xor  $20
    rra
    rra
    ld   hl, hActiveEntityPosX
    sub  a, c
    add  a, [hl]
    ld   [de], a
    inc  de

    ; Sprite 1: set OAM byte 2 (tile n°)
    pop  hl
    ldh  a, [hActiveEntityTilesOffset]
    ld   c, a
    ld   a, [hli]
    add  a, c
    ld   [de], a
    and  $0F
    cp   $0F
    jr   nz, .jr_3C4B
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de
.jr_3C4B

    inc  de

    ; Sprite 1: set OAM byte 3 (tile attribute)
    ld   a, [hl]
    ld   hl, hActiveEntityFlipAttribute
    xor  [hl]
    ld   [de], a
.paletteFlip1End

    ; Restore the entity index to bc
    ld   a, [wActiveEntityIndex]
    ld   c, a
    ld   b, $00

    callsb func_015_795D
    ; fallthrough

label_3C71::
    call func_015_7995

    ; Reload saved bank and return
    jp   ReloadSavedBank

; Render a single sprite for the active entity to the OAM buffer.
;
; The main input is a display list, containing OAM attributes (2 bytes each).
; There is one OAM attribute per variant.
;
; The entity variant is used to animate the entity, by selecting a sprite
; among the different attributes in the display list.
;
; Inputs:
;   de                          address of the display list
;   wActiveEntityIndex          index
;   hActiveEntitySpriteVariant  the sprite variant to use
;   wOAMNextAvailableSlot       index of the dynamically allocated OAM slot
RenderActiveEntitySprite::
    ; If hActiveEntitySpriteVariant == -1, return.
    ldh  a, [hActiveEntitySpriteVariant]
    inc  a
    ret  z

    call SkipDisabledEntityDuringRoomTransition

    push de

    ; de = wDynamicOAMBuffer + [wOAMNextAvailableSlot]
    ld   a, [wOAMNextAvailableSlot]
    ld   l, a
    ld   h, $00
    ld   bc, wDynamicOAMBuffer
    add  hl, bc
    ld   e, l
    ld   d, h
    ; bc = [wActiveEntityIndex]
    ld   a, [wActiveEntityIndex]
    ld   c, a
    ld   b, $00

    ; Set OAM byte 0 (Y position)

    ; If in a side-scrolling room…
    ldh  a, [hIsSideScrolling]
    and  a
    ldh  a, [hActiveEntityVisualPosY]
    jr   z, .sideScrollingEnd
    ; … hActiveEntityVisualPosY -= 4
    sub  a, $04
    ldh  [hActiveEntityVisualPosY], a
.sideScrollingEnd
    ld   [de], a
    inc  de

    ; Set OAM byte 1 (X position)
    ld   a, [wScreenShakeHorizontal]
    ld   h, a
    ldh  a, [hActiveEntityPosX]
    add  a, $04
    sub  a, h
    ld   [de], a
    inc  de

    ; Set OAM byte 2 (tile n°)
    ldh  a, [hActiveEntitySpriteVariant]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    pop  hl
    add  hl, bc
    ld   a, [hli]
    ld   [de], a

    ; Set OAM byte 3 (tile attribute)

    ; If on GBC…
    inc  de
    ld   a, [hli]
    ld   hl, hActiveEntityFlipAttribute
    xor  [hl]
    ld   [de], a

.functionEnd
    inc  de
    jr   RenderActiveEntitySpritesPair.paletteFlip1End

label_3CD9::
    ld   a, $15
    ld   [MBC3SelectBank], a
    jr   label_3C71

; Render a large rectangle of sprites using the entire OAM buffer.
;
; The sprites are allocated starting from the very start of the OAM buffer,
; overwriting even the part dedicated to Link's sprites.
;
; This is mainly used when displaying a large sprite on a screen where Link
; is not present.
;
; See RenderActiveEntitySpritesRect for details.
RenderActiveEntitySpritesRectUsingAllOAM::
    push hl
    ld   hl, wOAMBuffer
    jr   RenderActiveEntitySpritesRect.withDestination

; Render a large rectangle of sprites for the active entity to the OAM buffer.
;
; This function takes a display list of OAM attributes.
; Each item of the display list is a tupple of [x (?), y(?), tile n°, tile attributes] values.
;
; The display list is processed regardless of the active sprite variant.
; Variants must be managed by the caller itself.
;
; The sprites are allocated starting from the next available slot
; in the dynamic part of the OAM buffer.
;
; Inputs:
;   hl  the oam attributes display list
;   c   the number of sprites
;
; Return value:
;   c   [wActiveEntityIndex]
RenderActiveEntitySpritesRect::
    ; If hActiveEntitySpriteVariant == -1, return.
    ldh  a, [hActiveEntitySpriteVariant]
    inc  a
    jr   z, .return

    ; de = wDynamicOAMBuffer + [wOAMNextAvailableSlot]
    push hl
    ld   a, [wOAMNextAvailableSlot]
    ld   e, a
    ld   d, $00
    ld   hl, wDynamicOAMBuffer
    add  hl, de
.withDestination
    ld   e, l
    ld   d, h
    pop  hl

    ; Save counter to hScratch0
    ld   a, c
    ldh  [hScratch0], a

    ld   a, [wActiveEntityIndex]
    ld   c, a
    call SkipDisabledEntityDuringRoomTransition

    ; Restore counter from hScratch0
    ldh  a, [hScratch0]
    ld   c, a

.loop
    ; Set OAM byte 0 (Y position)
    ldh  a, [hActiveEntityVisualPosY]
    add  a, [hl]
    ld   [de], a
    inc  hl
    inc  de

    ; Set OAM byte 1 (X position)
    push bc
    ld   a, [wScreenShakeHorizontal]
    ld   c, a
    ldh  a, [hActiveEntityPosX]
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  hl
    inc  de

    ; Set OAM byte 2 (tile n°)
    ldh  a, [hActiveEntityTilesOffset]
    ld   c, a
    ld   a, [hli]
    push af
    add  a, c
    ld   [de], a
    pop  af
    cp   $FF
    jr   nz, .jp_3D28
    dec  de
    xor  a
    ld   [de], a
    inc  de
.jp_3D28
    pop  bc
    inc  de

    ; Set OAM byte 3 (tile attribute)
    ldh  a, [hActiveEntityFlipAttribute]
    xor  [hl]
    ld   [de], a
    inc  hl

.paletteFlipEnd

    inc  de
    dec  c
    jr   nz, .loop

    ld   a, [wActiveEntityIndex]
    ld   c, a
    callsb func_015_795D
    jp   ReloadSavedBank

.return
    ld   a, [wActiveEntityIndex]
    ld   c, a
    ret

; If the active entity rendering is disabled during
; the room transition, return to the parent of the caller.
; Otherwise, return to caller normally.
;
; Inputs:
;  bc:   active entity index?
SkipDisabledEntityDuringRoomTransition::
    ; If no room transition is active, return.
    push hl
    ld   a, [wRoomTransitionState]
    and  a
    jr   z, .return

    ; If hActiveEntityPosX - 1 is outside of screen, skip
    ldh  a, [hActiveEntityPosX]
    dec  a
    cp   $C0
    jr   nc, .skip

    ; If hActiveEntityVisualPosY - 1 is outside of the screen, skip
    ldh  a, [hActiveEntityVisualPosY]
    dec  a
    cp   $88
    jr   nc, .skip

    ; If wEntitiesPosXSignTable[c] != 0, skip
    ld   hl, wEntitiesPosXSignTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, .skip

    ; If wEntitiesPosYSignTable[c] != 0, skip
    ld   hl, wEntitiesPosYSignTable
    add  hl, bc
    ld   a, [hl]
    and  a

    ; Otherwise, don't skip and simply return to caller.
    jr   z, .return

.skip
    ; Pop the caller return address.
    ; The next value to be popped will be the parent caller
    ; address, thus returning to the parent of the parent early.
    pop  af

.return
    pop  hl
    ret

; Inputs:
;   bc   entity slot index
ClearEntitySpeed::
    ld   hl, wEntitiesSpeedXTable
    add  hl, bc
    ld   [hl], b
    ld   hl, wEntitiesSpeedYTable
    add  hl, bc
    ld   [hl], b
    ret

CopyEntityPositionToActivePosition::
    ld   hl, wEntitiesPosXTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityPosX], a
    ld   hl, wEntitiesPosYTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityPosY], a
    ld   hl, wEntitiesPosZTable
    add  hl, bc
    sub  a, [hl]
    ldh  [hActiveEntityVisualPosY], a
    ret

label_3DA0::
    callhl func_015_7964
    jp   ReloadSavedBank

label_3DAB::
    callhl func_004_5A1A
    jp   ReloadSavedBank

EntityInitMoldorm_trampoline::
    callhl EntityInitMoldorm
    jp   ReloadSavedBank

EntityInitFacade_trampoline::
    callhl EntityInitFacade
    jp   ReloadSavedBank

EntityInitSlimeEye_trampoline::
    callhl EntityInitSlimeEye
    jp   ReloadSavedBank

EntityInitGenie_trampoline::
    callhl EntityInitGenie
    jp   ReloadSavedBank

EntityInitSlimeEel_trampoline::
    callhl EntityInitSlimeEel
    jp   ReloadSavedBank

EntityInitDodongoSnake_trampoline::
    callhl EntityInitDodongoSnake
    jp   ReloadSavedBank

EntityInitHotHead_trampoline::
    callhl EntityInitHotHead
    jp   ReloadSavedBank

EntityInitEvilEagle_trampoline::
    callhl EntityInitEvilEagle
    jp   ReloadSavedBank

Entity67Handler_trampoline::
    callhl Entity67Handler
    jp   ReloadSavedBank

label_3E19::
    ld   a, [wCurrentBank]
    push af
    callsw CheckPositionForMapTransition
    pop  af
    jp   SwitchBank

label_3E29::
    callhl func_004_5C63
    jp   ReloadSavedBank

label_3E34::
    callhl SmashRock
    jp   ReloadSavedBank

LoadHeartsAndRuppeesCount::
    ld   hl, MBC3SelectBank
    ld   [hl], BANK(LoadRupeesDigits)
    call LoadRupeesDigits
    call LoadHeartsCount
    jp   ReloadSavedBank

label_3E4D::
    callsw SpawnChestWithItem
    ld   a, $03
    jp   SwitchBank

label_3E5A::
    ld   hl, MBC3SelectBank
    ld [hl], $02                                  ; $3e8d: $36 $02
    call $61e7                                    ; $3e8f: $cd $e7 $61
    jp ReloadSavedBank

GiveInventoryItem_trampoline::                ; @TODO Give player item in reg d
    callhl GiveInventoryItem
    jp   ReloadSavedBank

func_006_783C_trampoline::
    callsw func_006_783C
    ld   a, $03
    jp   SwitchBank

UnloadAllEntities::
    ld   e, MAX_ENTITIES
    ld   hl, wEntitiesStatusTable

.loop
    xor  a
    ldi  [hl], a
    dec  e
    jr   nz, .loop

    ret

label_3E8E::
    ld   hl, wEntitiesUnknowTableZ
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z

    ldh  a, [hFrameCounter]
    xor  c
    and  $03
    ret  nz

    ldh  a, [hActiveEntityPosX]
    ldh  [hScratch0], a
    ldh  a, [hActiveEntityVisualPosY]
    ldh  [hScratch1], a
    ld   a, TRANSCIENT_VFX_SMOKE
    call AddTranscientVfx
    ld   hl, wTranscientVfxCountdownTable
    add  hl, de
    ld   [hl], $0F
    ret

label_3EAF::
    ld   hl, $C3F0
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, .jr_3EBA
    cpl
    inc  a

.jr_3EBA
    ldh  [hScratch0], a
    ld   hl, wEntitiesUnknowTableS
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, .jr_3EC7
    cpl
    inc  a

.jr_3EC7
    ld   e, $03
    ld   hl, hScratch0
    cp   [hl]
    jr   c, .jr_3ED1
    ld   e, $0C

.jr_3ED1
    ld   a, e
    ld   hl, wEntitiesCollisionsTable
    add  hl, bc
    and  [hl]
    jr   z, .jr_3EDE
    ld   hl, wEntitiesIgnoreHitsCountdownTable
    add  hl, bc
    ld   [hl], b

.jr_3EDE
    ret

BossIntroDialogTable::
    ; Indexed by hMapId. Last entry might be unused?
    db $B0, $B4, $B1, $B2, $B3, $B6, $BA, $BC, $B8

; Start the boss music and show the boss's intro dialog
BossIntro::
    ld   hl, wInventoryAppearing
    ld   a, [wRoomTransitionState]
    or   [hl]
    ret  nz

    ld   a, [wBossIntroDelay]
    and  a
    jr   z, .endOfDelay
    dec  a
    ld   [wBossIntroDelay], a
    ret
.endOfDelay:

    ; don't do this twice
    ld   a, [wDidBossIntro]
    and  a
    ret  nz
    inc  a
    ld   [wDidBossIntro], a

    ; boss music
    ld   hl, wEntitiesUnknowTableH
    add  hl, bc
    ld   a, [hl]
    and  $04
    ld   a, MUSIC_BOSS_BATTLE

    jr   z, .endIf
    ld   a, MUSIC_MINIBOSS

.endIf:
    ld   [wMusicTrackToPlay], a

ldh  [$FFBD], a
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    ret  nz

    ; opening monologue
    ldh  a, [hActiveEntityType]
    cp   ENTITY_DESERT_LANMOLA
    jr   nz, .endDesertLanmola
    ld   a, $DA
    jr   .openDialog
.endDesertLanmola:

    cp   ENTITY_GRIM_CREEPER
    jr   nz, .endGrimCreeper
    ld   a, $26
    jr   .openDialog
.endGrimCreeper:

    ld   hl, wEntitiesUnknowTableH
    add  hl, bc
    ld   a, [hl]
    and  $04
    jr nz, jr_000_3f71                    ; other minibosses are silent
    ldh  a, [hMapId]
    cp   MAP_FACE_SHRINE
   jr nz, jr_000_3f71
    ld   e, a
    ld   d, b
    ld   hl, BossIntroDialogTable
    add  hl, de
    ld   a, [hl]
.openDialog:
    call   OpenDialog
jr_000_3f71
    ret

data_3F48::
    db 1, 2, 4, 8, $10, $20, $40, $80

DidKillEnemy::
    ld   a, BANK(SpawnEnemyDrop)
    ld   [wC113], a
    ld   [MBC3SelectBank], a
    call SpawnEnemyDrop
    call ReloadSavedBank

.label_3F5E
    ld   hl, wEntitiesLoadOrderTable
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, UnloadEntity
    push af
    ld   a, [wKillCount2]
    ld   e, a
    ld   d, b
    inc  a
    ld   [wKillCount2], a
    ld   a, [hl]
    ld   hl, $DBB6
    add  hl, de
    ld   [hl], a
    pop  af

.label_3F78
    cp   $08
    jr   nc, UnloadEntity
    ld   e, a
    ld   d, b
    ld   hl, data_3F48
    add  hl, de
    ldh  a, [hMapRoom]
    ld   e, a
    ld   d, b
    ld   a, [hl]
    ld   hl, wEntitiesClearedRooms
    add  hl, de
    or   [hl]
    ld   [hl], a
    ; fall through UnloadEntity

; Unload an entity by setting its status to 0 (ENTITY_STATUS_DISABLED)
; Input:
;   bc:  index of the entity
UnloadEntity::
UnloadEntityAndReturn::
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   [hl], b
    ret
