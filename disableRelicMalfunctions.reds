  @replaceMethod(GameObject)
  protected func StartStatusEffectVFX(evt: ref<ApplyStatusEffectEvent>) -> Void {
    let i: Int32;
    let vfxList: array<wref<StatusEffectFX_Record>>;
    evt.staticData.VFX(vfxList);
    i = 0;
    while i < ArraySize(vfxList) {
      if evt.isNewApplication || vfxList[i].ShouldReapply() {
        // GameObjectEffectHelper.StartEffectEvent(this, vfxList[i].Name());

        // BEGIN PATCH
        if !StrBeginsWith(ToString(vfxList[i].Name()), "johnny_sickness") {
          GameObjectEffectHelper.StartEffectEvent(this, vfxList[i].Name());
        };
        // END PATCH

      };
      i += 1;
    };
  }

  @replaceMethod(GameObject)
  protected func StartStatusEffectSFX(evt: ref<ApplyStatusEffectEvent>) -> Void {
    let i: Int32;
    let sfxList: array<wref<StatusEffectFX_Record>>;
    evt.staticData.SFX(sfxList);
    i = 0;
    while i < ArraySize(sfxList) {
      if evt.isNewApplication || sfxList[i].ShouldReapply() {
        // GameObject.PlaySound(this, sfxList[i].Name());

        // BEGIN PATCH
        if !StrBeginsWith(ToString(sfxList[i].Name()), "johnny_sickness") {
          GameObject.PlaySound(this, sfxList[i].Name());
        };
        // END PATCH

      };
      i += 1;
    };
  }
