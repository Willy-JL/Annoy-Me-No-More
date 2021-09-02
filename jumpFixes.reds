  @replaceMethod(JumpDecisions)
  protected const func EnterCondition(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Bool {
    let jumpPressedFlag: Bool = stateContext.GetConditionBool(n"JumpPressed");
    if !jumpPressedFlag && !this.m_jumpPressed {
      this.EnableOnEnterCondition(false);
    };
    // if scriptInterface.localBlackboard.GetBool(GetAllBlackboardDefs().PlayerStateMachine.IsPlayerInsideMovingElevator) {
    //   return false;
    // };
    if !scriptInterface.HasStatFlag(gamedataStatType.CanJump) {
      return false;
    };

    // BEGIN PATCH
    let hasChargeJump: Bool;
    let hasAirHover: Bool;
    let player: ref<GameObject>;
    player = GameInstance.GetPlayerSystem(scriptInterface.owner.GetGame()).GetLocalPlayerMainGameObject();
    if StatusEffectSystem.ObjectHasStatusEffectWithTag(player, n"PhoneCall") {
      let espd: ref<EquipmentSystemPlayerData>;
      let legsCW: ItemID;
      espd = EquipmentSystem.GetData(player);
      legsCW = espd.GetItemInEquipSlot(gamedataEquipmentArea.LegsCW, 0);
      hasChargeJump = Equals(TDBID.ToStringDEBUG(ItemID.GetTDBID(legsCW)), "<TDBID:72037888:1B>");
      hasAirHover = Equals(TDBID.ToStringDEBUG(ItemID.GetTDBID(legsCW)), "<TDBID:E27CB046:1B>");
    } else {
      hasChargeJump = scriptInterface.HasStatFlag(gamedataStatType.HasChargeJump);
      hasAirHover = scriptInterface.HasStatFlag(gamedataStatType.HasAirHover);
    };
    if hasChargeJump || hasAirHover {
    // END PATCH

    // if scriptInterface.HasStatFlag(gamedataStatType.HasChargeJump) || scriptInterface.HasStatFlag(gamedataStatType.HasAirHover) {
      if this.GetActionHoldTime(stateContext, scriptInterface, n"Jump") < 0.15 && stateContext.GetConditionFloat(n"InputHoldTime") < 0.20 && scriptInterface.IsActionJustReleased(n"Jump") {
        return true;
      };
    } else {
      if jumpPressedFlag || scriptInterface.IsActionJustPressed(n"Jump") {
        return true;
      };
    };
    return false;
  }

  @replaceMethod(DoubleJumpDecisions)
  protected const func EnterCondition(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Bool {
    let currentNumberOfJumps: Int32;
    let jumpPressedFlag: Bool = stateContext.GetConditionBool(n"JumpPressed");
    if !jumpPressedFlag && !this.m_jumpPressed {
      this.EnableOnEnterCondition(false);
    };

    // BEGIN PATCH
    let hasDoubleJump: Bool;
    let player: ref<GameObject>;
    player = GameInstance.GetPlayerSystem(scriptInterface.owner.GetGame()).GetLocalPlayerMainGameObject();
    if StatusEffectSystem.ObjectHasStatusEffectWithTag(player, n"PhoneCall") {
      let espd: ref<EquipmentSystemPlayerData>;
      let legsCW: ItemID;
      espd = EquipmentSystem.GetData(player);
      legsCW = espd.GetItemInEquipSlot(gamedataEquipmentArea.LegsCW, 0);
      hasDoubleJump = Equals(TDBID.ToStringDEBUG(ItemID.GetTDBID(legsCW)), "<TDBID:67E21FC0:18>");
    } else {
      hasDoubleJump = scriptInterface.HasStatFlag(gamedataStatType.HasDoubleJump);
    }
    if !hasDoubleJump {
    // END PATCH

    //if !scriptInterface.HasStatFlag(gamedataStatType.HasDoubleJump) {
      return false;
    };
    if scriptInterface.HasStatFlag(gamedataStatType.HasChargeJump) || scriptInterface.HasStatFlag(gamedataStatType.HasAirHover) {
      return false;
    };
    // if this.IsCurrentFallSpeedTooFastToEnter(stateContext, scriptInterface) {
    //   return false;
    // };
    // if scriptInterface.localBlackboard.GetBool(GetAllBlackboardDefs().PlayerStateMachine.IsPlayerInsideMovingElevator) {
    //   return false;
    // };
    currentNumberOfJumps = stateContext.GetIntParameter(n"currentNumberOfJumps", true);
    if currentNumberOfJumps >= this.GetStaticIntParameterDefault("numberOfMultiJumps", 1) {
      return false;
    };
    if jumpPressedFlag || scriptInterface.IsActionJustPressed(n"Jump") {
      return true;
    };
    return false;
  }

  @replaceMethod(ChargeJumpDecisions)
  protected const func EnterCondition(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Bool {
    this.EnableOnEnterCondition(false);

    // BEGIN PATCH
    let hasChargeJump: Bool;
    let hasAirHover: Bool;
    let player: ref<GameObject>;
    player = GameInstance.GetPlayerSystem(scriptInterface.owner.GetGame()).GetLocalPlayerMainGameObject();
    if StatusEffectSystem.ObjectHasStatusEffectWithTag(player, n"PhoneCall") {
      let espd: ref<EquipmentSystemPlayerData>;
      let legsCW: ItemID;
      espd = EquipmentSystem.GetData(player);
      legsCW = espd.GetItemInEquipSlot(gamedataEquipmentArea.LegsCW, 0);
      hasChargeJump = Equals(TDBID.ToStringDEBUG(ItemID.GetTDBID(legsCW)), "<TDBID:72037888:1B>");
      hasAirHover = Equals(TDBID.ToStringDEBUG(ItemID.GetTDBID(legsCW)), "<TDBID:E27CB046:1B>");
    } else {
      hasChargeJump = scriptInterface.HasStatFlag(gamedataStatType.HasChargeJump);
      hasAirHover = scriptInterface.HasStatFlag(gamedataStatType.HasAirHover);
    };
    if stateContext.GetConditionFloat(n"InputHoldTime") > 0.15 && scriptInterface.IsActionJustReleased(n"Jump") && hasChargeJump {
      if hasAirHover {
    // END PATCH

    // if stateContext.GetConditionFloat(n"InputHoldTime") > 0.15 && scriptInterface.IsActionJustReleased(n"Jump") && scriptInterface.HasStatFlag(gamedataStatType.HasChargeJump) {
    //   if scriptInterface.HasStatFlag(gamedataStatType.HasAirHover) {
        return false;
      };
      if this.IsPlayerInAnyMenu(scriptInterface) || this.IsRadialWheelOpen(scriptInterface) {
        return false;
      };
      // if this.IsCurrentFallSpeedTooFastToEnter(stateContext, scriptInterface) {
      //   return false;
      // };
      // if scriptInterface.localBlackboard.GetBool(GetAllBlackboardDefs().PlayerStateMachine.IsPlayerInsideMovingElevator) {
      //   return false;
      // };
      return true;
    };
    return false;
  }

  @replaceMethod(HoverJumpDecisions)
  protected const func EnterCondition(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Bool {
    if scriptInterface.IsActionJustHeld(n"Jump") {

      // BEGIN PATCH
      let hasAirHover: Bool;
      let player: ref<GameObject>;
      player = GameInstance.GetPlayerSystem(scriptInterface.owner.GetGame()).GetLocalPlayerMainGameObject();
      if StatusEffectSystem.ObjectHasStatusEffectWithTag(player, n"PhoneCall") {
        let espd: ref<EquipmentSystemPlayerData>;
        let legsCW: ItemID;
        espd = EquipmentSystem.GetData(player);
        legsCW = espd.GetItemInEquipSlot(gamedataEquipmentArea.LegsCW, 0);
        hasAirHover = Equals(TDBID.ToStringDEBUG(ItemID.GetTDBID(legsCW)), "<TDBID:E27CB046:1B>");
      } else {
        hasAirHover = scriptInterface.HasStatFlag(gamedataStatType.HasAirHover);
      };
      if !hasAirHover {
      // END PATCH

      // if !scriptInterface.HasStatFlag(gamedataStatType.HasAirHover) {
        return false;
      };
      // if this.IsCurrentFallSpeedTooFastToEnter(stateContext, scriptInterface) {
      //   return false;
      // };
      // if scriptInterface.localBlackboard.GetBool(GetAllBlackboardDefs().PlayerStateMachine.IsPlayerInsideMovingElevator) {
      //   return false;
      // };
      return true;
    };
    return false;
  }
