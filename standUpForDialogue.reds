  @wrapMethod(BaseContextEvents)
  protected final func OnUpdate(timeDelta: Float, stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
    let sceneSystem: ref<SceneSystemInterface>;
    sceneSystem = GameInstance.GetSceneSystem(scriptInterface.executionOwner.GetGame()).GetScriptInterface();
    if sceneSystem.IsFastForwardingAllowed(scnFastForwardMode.Default) || sceneSystem.IsFastForwardingAllowed(scnFastForwardMode.GameplayReview) {
      stateContext.SetConditionBoolParameter(n"CrouchToggled", false, true);
    };

    wrappedMethod(timeDelta, stateContext, scriptInterface);
  }
