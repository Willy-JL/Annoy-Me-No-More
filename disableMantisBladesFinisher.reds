  @replaceMethod(DamageSystem)
  private final func PlayFinisherGameEffect(const hitEvent: ref<gameHitEvent>, const hasFromFront: Bool, const hasFromBack: Bool) -> Bool {
    let bodyType: CName;
    let bodyTypeVarSetter: ref<AnimWrapperWeightSetter>;
    let finisherName: CName;
    let gameEffectInstance: ref<EffectInstance>;
    let instigator: ref<GameObject>;
    let targetPuppet: ref<gamePuppet>;
    let attackData: ref<AttackData> = hitEvent.attackData;
    if !this.GetFinisherNameBasedOnWeapon(hitEvent, hasFromFront, hasFromBack, finisherName) {
      return false;
    };
    instigator = attackData.GetInstigator();
    gameEffectInstance = GameInstance.GetGameEffectSystem(GetGameInstance()).CreateEffectStatic(n"playFinisher", finisherName, instigator);
    if !IsDefined(gameEffectInstance) {
      return false;
    };
    AnimationControllerComponent.PushEventToObjAndHeldItems(instigator, n"ForceReady");
    targetPuppet = hitEvent.target as gamePuppet;
    bodyType = targetPuppet.GetBodyType();
    bodyTypeVarSetter = new AnimWrapperWeightSetter();
    bodyTypeVarSetter.key = bodyType;
    bodyTypeVarSetter.value = 1.00;
    instigator.QueueEvent(bodyTypeVarSetter);
    EffectData.SetVector(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.position, hitEvent.target.GetWorldPosition());
    EffectData.SetEntity(gameEffectInstance.GetSharedData(), GetAllBlackboardDefs().EffectSharedData.entity, hitEvent.target);
    // gameEffectInstance.Run();

    // BEGIN PATCH
    if Equals(TweakDBInterface.GetWeaponItemRecord(ItemID.GetTDBID(attackData.GetWeapon().GetItemID())).ItemType().Type(), gamedataItemType.Cyb_MantisBlades) {
      (hitEvent.target as ScriptedPuppet).Kill(instigator, false, false);
    } else {
      gameEffectInstance.Run();
    };
    // END PATCH

    AnimationControllerComponent.PushEventToObjAndHeldItems(instigator, n"ForceReady");
    this.SetCameraContext(instigator, n"WorkspotLocked");
    this.SetGameplayCameraParameters(instigator, "cameraFinishers");
    return true;
  }
