  @replaceMethod(ScenesFastForwardTransition)
  protected final const func IsBlockedByPhoneCallRestriction(scriptInterface: ref<StateGameScriptInterface>) -> Bool {
    // if this.IsFastForwardByLine(scriptInterface) {
    //   return StatusEffectSystem.ObjectHasStatusEffectWithTag(scriptInterface.executionOwner, n"PhoneCall");
    // };
    return false;
  }
