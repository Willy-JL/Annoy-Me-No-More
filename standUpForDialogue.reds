  @replaceMethod(BaseContextEvents)
  protected final func OnUpdate(timeDelta: Float, stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
    // BEGIN PATCH
    let sceneSystem: ref<SceneSystemInterface>;
    sceneSystem = GameInstance.GetSceneSystem(scriptInterface.executionOwner.GetGame()).GetScriptInterface();
    if sceneSystem.IsFastForwardingAllowed(scnFastForwardMode.Default) || sceneSystem.IsFastForwardingAllowed(scnFastForwardMode.GameplayReview) {
      stateContext.SetConditionBoolParameter(n"CrouchToggled", false, true);
    };
    // END PATCH

    if this.m_gameplaySettings.GetIsInputHintEnabled() {
      this.UpdateHints(stateContext, scriptInterface, true);
    };
  }
