  @replaceMethod(CrossingLight)
  protected final func PlayTrafficNotificationSound(status: worldTrafficLightColor) -> Void {
    // if Equals(status, worldTrafficLightColor.RED) && this.m_audioLightIsGreen {
    //   GameObject.PlaySoundEvent(this, (this.GetDevicePS() as CrossingLightControllerPS).GetRedSFX());
    //   this.m_audioLightIsGreen = false;
    // } else {
    //   if Equals(status, worldTrafficLightColor.GREEN) && !this.m_audioLightIsGreen {
    //     GameObject.PlaySoundEvent(this, (this.GetDevicePS() as CrossingLightControllerPS).GetGreenSFX());
    //     this.m_audioLightIsGreen = true;
    //   };
    // };

    // BEGIN PATCH
    return;
    // END PATCH
  }
